# Blood Cell Classification Project
This project focuses on the analysis of blood cells to classify red and white blood cells using image processing techniques and conventional machine learning models.

## Project Overview

The goal of this project is to develop a system that automatically classifies red and white blood cells based on image processing and feature extraction. The project involves several key steps, including preprocessing, segmentation, feature extraction, and classification.

## Dataset: 
The dataset contains a total of 17,092 images of individual normal cells, which were acquired using the analyzer CellaVision DM96 in the Core Laboratory at the Hospital Clinic of Barcelona. The dataset can be found on https://www.kaggle.com/datasets/bzhbzh35/peripheral-blood-cell. The dataset is organized in the following eight groups:
1. Neutrophils
2. Eosinophils
3. Basophils
4. Lymphocytes
5. Monocytes
6. Immature granulocytes (promyelocytes, myelocytes, and metamyelocytes)
7. Erythroblasts
8. Platelets or thrombocytes

From the dataset, we randomly selected 50 images from each group for further analysis. This subset of images was used for preprocessing, segmentation, feature extraction, and classification.

## Steps performed
- **Preprocessing**: Enhance image contrast through filtering techniques to improve the quality of blood cell images.
- **Segmentation**: Perform morphological operations to segment blood cells, separating red and white blood cells.
- **Feature Extraction**: Extract a range of features from both red and white blood cells, including area, eccentricity, energy, homogeneity, entropy, and more.
- **Classification**: Utilize a conventional machine learning model, K-Nearest Neighbors (KNN), to classify blood cells based on the extracted features.

## How to Run

1. Ensure you have MATLAB installed on your system.
2. Clone this repository:
3. Open the MATLAB project and run the Main script.
4. Modify the path to the input image and adjust parameters as needed.

## Results

The project successfully classifies blood cells into red and white categories using extracted features and the KNN classifier.
## Dependencies

- MATLAB (version 2018 or higher)



