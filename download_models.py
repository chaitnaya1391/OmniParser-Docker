# download_models.py
from paddleocr import PaddleOCR
import sys

print("Initializing PaddleOCR to force model download...")
try:
    # Specify the language you need (e.g., 'en' for English GUI)
    # This call checks for and downloads the required models if they don't exist.
    ocr = PaddleOCR(use_angle_cls=True, lang="en") 
    print("PaddleOCR models successfully downloaded and cached.")
except Exception as e:
    print(f"Error during model download: {e}")
    sys.exit(1)