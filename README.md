
# Denoising Noisy Image with Wavelet Transform

This project demonstrates image denoising using Wavelet Transform (SWT) in MATLAB. The focus is on reducing noise from a 512x512, 8-bit image through different decomposition and reconstruction techniques.

## Methodology

### Decomposition and Reconstruction
The noisy image is decomposed into multiple subbands using `swt2` and reconstructed with `iswt2`.

## Results
Original Image and DFT
![image](https://github.com/user-attachments/assets/5ce85500-d736-4654-8470-53ae1f60d941)

- **Initial Noise Reduction:**  
  High-frequency components were removed, significantly reducing noise.

Method 1

![image](https://github.com/user-attachments/assets/fdd0a89a-146e-4370-b5f9-94869dc8f399)

Method 2

![image](https://github.com/user-attachments/assets/fdb07460-0732-468c-bfd0-c09b8b9f206b)


- **Further Zeroing Out:**  
  Additional high-frequency subbands were eliminated, further improving image clarity but introducing slight blurring.

Method 1

![image](https://github.com/user-attachments/assets/f4c6dc46-6261-4408-b987-2e8e6ebc5b09)
![image](https://github.com/user-attachments/assets/fe5c010f-c420-4027-b75d-8b4a18dd1287)

Method 2

![image](https://github.com/user-attachments/assets/1773b5c7-9f02-422f-813b-5a78dfafdb99)
![image](https://github.com/user-attachments/assets/233c0e55-f6ff-42ab-ba5a-55941effeb86)

## Conclusion

Both methods effectively reduced noise, with further zeroing out leading to a cleaner image at the cost of some blurring.

## How to Run
1. Clone this repository.
2. Open `denoising_project.m` in MATLAB.
3. Run the script to see the results.
