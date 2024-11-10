.
├── README.md
├── denoising_project.m
└── lena512noisy.bmp

# Denoising Noisy Image with Wavelet Transform

This project demonstrates image denoising using Wavelet Transform (SWT) in MATLAB. The focus is on reducing noise from a 512x512, 8-bit image through different decomposition and reconstruction techniques.

## Methodology

### Decomposition and Reconstruction
The noisy image is decomposed into multiple subbands using `swt2` and reconstructed with `iswt2`.

## Results

- **Initial Noise Reduction:**  
  High-frequency components were removed, significantly reducing noise.

- **Further Zeroing Out:**  
  Additional high-frequency subbands were eliminated, further improving image clarity but introducing slight blurring.

## Conclusion

Both methods effectively reduced noise, with further zeroing out leading to a cleaner image at the cost of some blurring.

## How to Run
1. Clone this repository.
2. Open `denoising_project.m` in MATLAB.
3. Run the script to see the results.
