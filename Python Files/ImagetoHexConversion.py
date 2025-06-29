from PIL import Image
import numpy as np

class ImageToHexConverter:
    def __init__(self, image_path, hex_output_path, frac_bits=15):
        self.image_path = image_path
        self.hex_output_path = hex_output_path
        self.frac_bits = frac_bits
        self.pixel_values = []
        self.normalized_values = []
        self.fixed_values = []
        self.hex_values = []

    def load_image(self):
        img = Image.open(self.image_path).convert('L')  # convert to grayscale
        data = 255 - np.array(img)  # invert grayscale
        self.pixel_values = data.flatten()
        # print("Image loaded and flattened.")

    def normalize_pixels(self):
        self.normalized_values = [val / 255.0 for val in self.pixel_values]
        # print("Pixel values normalized.")

    def to_fixed(self, f):
        b = int(round(f * (2 ** self.frac_bits)))
        if b < 0:
            b = (1 << (self.frac_bits + 17)) + b  # two's complement for 32 bit
        return b

    def to_hex(self, val, nbits=32):
        return f"{(val + (1 << nbits)) % (1 << nbits):0{nbits // 4}X}"

    def convert_to_fixed_and_hex(self):
        for val in self.normalized_values:
            fixed = self.to_fixed(val)
            self.fixed_values.append(fixed)
            hex_val = self.to_hex(fixed)
            self.hex_values.append(hex_val)
        # print("Converted to fixed-point and hexadecimal.")

    def save_hex_to_file(self):
        with open(self.hex_output_path, 'w') as f:
            for hexval in self.hex_values:
                f.write(hexval + '\n')
        # print(f"Hex values saved to '{self.hex_output_path}'.")

    def process(self):
        self.load_image()
        self.normalize_pixels()
        self.convert_to_fixed_and_hex()
        self.save_hex_to_file()

converter = ImageToHexConverter("8.png", "8_hex.mem")
converter.process() 
