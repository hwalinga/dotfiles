#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri May  3 04:22:34 PM CEST 2024

@author hielke
"""

import argparse
import subprocess

import cv2
import pytesseract
import svgwrite


def extract_text(image):
    # Convert image to grayscale
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

    # Perform OCR to extract text
    text = pytesseract.image_to_string(gray)
    return text


def main(input_file, output_file):
    # Load PNG image
    image = cv2.imread(input_file)

    # Extract text from image
    extracted_text = extract_text(image)

    # Create SVG object
    svg = svgwrite.Drawing(filename=output_file)

    # Add text element to SVG
    svg.add(svg.text(extracted_text, insert=(10, 20)))

    # Save SVG file
    svg.save()

    # Convert PNG image to SVG vector format using Potrace
    subprocess.run(["potrace", input_file, "-o", output_file + ".svg"])


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Convert PNG with text to SVG')
    parser.add_argument('input_file', type=str, help='Path to input PNG file')
    parser.add_argument('output_file', type=str, help='Path to output SVG file')
    args = parser.parse_args()

    main(args.input_file, args.output_file)
