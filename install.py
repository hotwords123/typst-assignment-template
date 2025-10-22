# /// script
# requires-python = ">=3.9"
# dependencies = [
#     "toml",
# ]
# ///
"""Install local packages for Typst.

See https://github.com/typst/packages/tree/main#local-packages for more details.
"""

import logging
import os
import shutil
import sys
from pathlib import Path

import toml


def main(args):
    package_dir = get_package_dir()
    logging.info(f"Typst local package directory: {package_dir}")

    src_path = Path(args.path).resolve()
    toml_path = src_path / "typst.toml"

    package_info = toml.load(toml_path)
    package_name: str = args.name or package_info["package"]["name"]
    package_version: str = args.version or package_info["package"]["version"]
    namespace: str = args.namespace

    dest_path = package_dir / namespace / package_name / package_version
    logging.info(f"Installing to {dest_path}")

    if dest_path.exists():
        if args.force:
            logging.info("Removing existing package...")
            shutil.rmtree(dest_path)
        else:
            logging.error(
                f"Package {package_name} version {package_version} already exists. "
                "Use --force to overwrite."
            )
            sys.exit(1)

    dest_path.mkdir(parents=True, exist_ok=True)

    files_to_copy = [
        "src/",
        "LICENSE",
        "README.md",
        "typst.toml",
    ]
    for item in files_to_copy:
        src_item = src_path / item
        dest_item = dest_path / item
        if src_item.is_dir():
            shutil.copytree(src_item, dest_item, dirs_exist_ok=True)
        else:
            shutil.copy2(src_item, dest_item)

    logging.info("Package installed successfully.")


def get_package_dir() -> Path:
    """Get the Typst local package directory path."""
    if sys.platform == "win32":
        data_dir = Path(os.environ.get("APPDATA") or Path.home() / "AppData/Roaming")
    elif sys.platform == "darwin":
        data_dir = Path.home() / "Library/Application Support"
    else:
        data_dir = Path(os.environ.get("XDG_DATA_HOME") or Path.home() / ".local/share")
    return data_dir / "typst/packages"


def parse_args():
    """Parse command line arguments."""
    import argparse

    parser = argparse.ArgumentParser(description="Install the Typst package locally.")
    parser.add_argument(
        "-p", "--path", type=str, default=".", help="Path to the package directory"
    )
    parser.add_argument(
        "-n", "--name", type=str, help="Package name (overrides toml name)"
    )
    parser.add_argument(
        "-v", "--version", type=str, help="Package version (overrides toml version)"
    )
    parser.add_argument(
        "-s", "--namespace", type=str, default="local", help="Package namespace"
    )
    parser.add_argument(
        "-f", "--force", action="store_true", help="Force overwrite if package exists"
    )
    return parser.parse_args()


if __name__ == "__main__":
    logging.basicConfig(
        level=logging.INFO, format="%(asctime)s - %(levelname)s - %(message)s"
    )
    main(parse_args())
