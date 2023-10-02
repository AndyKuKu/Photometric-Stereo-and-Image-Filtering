# Photometric-Stereo-and-Image-Filtering

Part 1: This section is to implement photometric stereo, a method for estimating the surface normals of objects from
multiple images taken from different lighting directions. The provided data includes 16-bit integer PNG images of 96 different lighting directions, a mask image, lighting directions, lighting intensities, and image file names. The implementation should estimate surface normals using Lambert's reflectance model and handle shadows and highlights by discarding the darkest and brightest pixels respectively.

Part 2: This section involves two topics in image processing: convolution and edge detection. The convolution function
takes a grayscale image and a convolution kernel as inputs and returns a convolution result image of the same size as the input image. The edge detection function uses a Gaussian filter to smooth the image and calculates x and y direction image gradients using the Sobel filter. Then, non-maximum suppression is applied to the gradient map to extract fine edges, while mapping the gradient angles to the nearest values among four slopes close to 0°, 45°, 90°, and 135°.
