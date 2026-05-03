#!/usr/bin/env python3
"""Validate Shopify App Store feature image basics without external deps."""

from __future__ import annotations

import argparse
import struct
import sys
from pathlib import Path


EXPECTED_WIDTH = 1600
EXPECTED_HEIGHT = 900


class ImageValidationError(Exception):
    pass


def read_png_size(data: bytes) -> tuple[int, int] | None:
    if not data.startswith(b"\x89PNG\r\n\x1a\n"):
        return None
    if len(data) < 24 or data[12:16] != b"IHDR":
        raise ImageValidationError("Invalid PNG: missing IHDR chunk")
    width, height = struct.unpack(">II", data[16:24])
    return width, height


def read_jpeg_size(data: bytes) -> tuple[int, int] | None:
    if not data.startswith(b"\xff\xd8"):
        return None

    i = 2
    while i < len(data):
        while i < len(data) and data[i] == 0xFF:
            i += 1
        if i >= len(data):
            break

        marker = data[i]
        i += 1

        if marker in {0xD8, 0xD9, 0x01} or 0xD0 <= marker <= 0xD7:
            continue
        if i + 2 > len(data):
            break

        segment_length = struct.unpack(">H", data[i : i + 2])[0]
        if segment_length < 2 or i + segment_length > len(data):
            raise ImageValidationError("Invalid JPEG: malformed segment")

        if marker in {
            0xC0,
            0xC1,
            0xC2,
            0xC3,
            0xC5,
            0xC6,
            0xC7,
            0xC9,
            0xCA,
            0xCB,
            0xCD,
            0xCE,
            0xCF,
        }:
            if segment_length < 7:
                raise ImageValidationError("Invalid JPEG: short SOF segment")
            height, width = struct.unpack(">HH", data[i + 3 : i + 7])
            return width, height

        i += segment_length

    raise ImageValidationError("Invalid JPEG: no size marker found")


def detect_image(path: Path) -> tuple[str, int, int]:
    data = path.read_bytes()
    png_size = read_png_size(data)
    if png_size:
        return "PNG", *png_size

    jpeg_size = read_jpeg_size(data)
    if jpeg_size:
        return "JPEG", *jpeg_size

    raise ImageValidationError("Unsupported format: expected PNG or JPEG")


def validate(path: Path) -> list[str]:
    if not path.exists():
        raise ImageValidationError(f"File not found: {path}")
    if not path.is_file():
        raise ImageValidationError(f"Not a file: {path}")

    image_format, width, height = detect_image(path)
    errors: list[str] = []

    if (width, height) != (EXPECTED_WIDTH, EXPECTED_HEIGHT):
        errors.append(
            f"Expected {EXPECTED_WIDTH}x{EXPECTED_HEIGHT}, got {width}x{height}"
        )
    if width * 9 != height * 16:
        errors.append(f"Expected 16:9 aspect ratio, got {width}:{height}")

    if errors:
        raise ImageValidationError("; ".join(errors))

    return [
        f"format={image_format}",
        f"size={width}x{height}",
        "aspect=16:9",
        "status=pass",
    ]


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Validate Shopify App Store feature image dimensions and format."
    )
    parser.add_argument("image", type=Path, help="Path to PNG or JPEG image")
    args = parser.parse_args()

    try:
        print("\n".join(validate(args.image)))
    except ImageValidationError as exc:
        print(f"status=fail\nerror={exc}", file=sys.stderr)
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
