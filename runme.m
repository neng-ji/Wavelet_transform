% Load and prepare the image
img = imread('lena512noisy.bmp');
img = double(img);

% Define the wavelet
wavelet = 'sym1';

% Perform  wavelet transform
[LL, LH, HL, HH] = swt2(img, 4, wavelet);

LH_zeroed = LH; HL_zeroed = HL; HH_zeroed = HH;

% Zero out the highest frequency components 
% Scenarios 1, 3, and 6 highest frequencies
zeroLevels = [1, 3, 6];  

for i = 1:length(zeroLevels)
    
    LH_zeroed = LH; HL_zeroed = HL; HH_zeroed = HH;
    numZero = zeroLevels(i);
    
    if numZero == 1
        HH_zeroed(:,:,1) = 0;
    elseif numZero == 3
        LH_zeroed(:,:,1) = 0; HL_zeroed(:,:,1) = 0; HH_zeroed(:,:,1) = 0;
    elseif numZero == 6
        LH_zeroed(:,:,1:2) = 0; HL_zeroed(:,:,1:2) = 0; HH_zeroed(:,:,1:2) = 0;
    end

    % Reconstruct the image 
    img_reconstructed = iswt2(LL, LH_zeroed, HL_zeroed, HH_zeroed, 'sym1');

    % Calculate and display DFT magnitude 
    dft_original = fftshift(fft2(img));
    magnitude_spectrum_original = log(1 + abs(dft_original));
    dft_reconstructed = fftshift(fft2(img_reconstructed));
    magnitude_spectrum_reconstructed = log(1 + abs(dft_reconstructed));

    % Display
    figure;
    subplot(1, 3, 1);
    imshow(img, []);
    title('Original Image');

    subplot(1, 3, 2);
    imshow(img_reconstructed, []);
    title(sprintf('Reconstructed Image\n%u Highest Frequencies Zeroed', numZero));

    subplot(1, 3, 3);
    imshow(magnitude_spectrum_reconstructed, []);
    title(sprintf('DFT of Reconstructed Image\n%u Highest Frequencies Zeroed', numZero));
end













% Load image
original_img = imread('lena512noisy.bmp');
original_img = double(original_img);

wavelet = 'sym1'; 

% Apply SWT to the image to get the initial subbands
[LLm, LHm, HLm, HHm] = swt2(original_img, 1, wavelet);

% Decompositions
[LL1, LH1, HL1, HH1] = swt2(LLm, 1, wavelet);
[LL2, LH2, HL2, HH2] = swt2(LHm, 1, wavelet);
[LL3, LH3, HL3, HH3] = swt2(HLm, 1, wavelet);
[LL4, LH4, HL4, HH4] = swt2(HHm, 1, wavelet);

% Two-level decomposition of LL1 
[LL5, LH5, HL5, HH5] = swt2(LL1, 2, wavelet);

% Configuration array for different zero-out scenarios
configs = {
    {3, {'LH4', 'HL4', 'HH4'}},
    {10, {'LH4', 'HL4', 'HH4', 'LL4', 'LH2', 'HL2', 'HH2', 'LH3', 'HL3', 'HH3'}},
    {15, {'LH4', 'HL4', 'HH4', 'LL4', 'LH2', 'HL2', 'HH2', 'LL2', 'LH3', 'HL3', 'HH3', 'LL3', 'LH1', 'HL1', 'HH1'}}
};

for i = 1:length(configs)
    zeroCount = configs{i}{1};
    zeroBands = configs{i}{2};

    [LL1z, LH1z, HL1z, HH1z] = deal(LL1, LH1, HL1, HH1);
    [LL2z, LH2z, HL2z, HH2z] = deal(LL2, LH2, HL2, HH2);
    [LL3z, LH3z, HL3z, HH3z] = deal(LL3, LH3, HL3, HH3);
    [LL4z, LH4z, HL4z, HH4z] = deal(LL4, LH4, HL4, HH4);

    for j = 1:length(zeroBands)
        eval([zeroBands{j} 'z(:) = 0;']);
    end

    % Reconstruct each first-level decomposition
    LLm_reconstructed = iswt2(LL1z, LH1z, HL1z, HH1z, wavelet);  
    LHm_reconstructed = iswt2(LL2z, LH2z, HL2z, HH2z, wavelet);  
    HLm_reconstructed = iswt2(LL3z, LH3z, HL3z, HH3z, wavelet);  
    HHm_reconstructed = iswt2(LL4z, LH4z, HL4z, HH4z, wavelet);  

    img_reconstructed = iswt2(LLm_reconstructed, LHm_reconstructed, HLm_reconstructed, HHm_reconstructed, wavelet);

    % Calculate DFT magnitude 
    dft_original = fftshift(fft2(original_img));
    magnitude_spectrum_original = log(1 + abs(dft_original));
    dft_reconstructed = fftshift(fft2(img_reconstructed));
    magnitude_spectrum_reconstructed = log(1 + abs(dft_reconstructed));

    
    figure;
    subplot(1, 3, 1);
    imshow(original_img, []);
    title('Original Image');

    subplot(1, 3, 2);
    imshow(img_reconstructed, []);
    title(sprintf('Reconstructed Image\nZeroed %d Highest Frequencies', zeroCount));

    subplot(1, 3, 3);
    imshow(magnitude_spectrum_reconstructed, []);
    title(sprintf('DFT of Reconstructed Image\nZeroed %d Highest Frequencies', zeroCount));
end



img = imread('lena512noisy.bmp');
img = double(img);

% Calculate the DFT of the image
dft_original = fftshift(fft2(img));
magnitude_spectrum_original = log(1 + abs(dft_original));

% Display
figure;
subplot(1, 2, 1);
imshow(img, []);
title('Original Image');

subplot(1, 2, 2);
imshow(magnitude_spectrum_original, []);
title('DFT Magnitude Spectrum of Original Image');
