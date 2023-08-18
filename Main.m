clear;
clc;

% Get a list of image files in the selected folder
folderPath = uigetdir('Select Folder');
imageFiles = dir(fullfile(folderPath, '*.jpg')); % you can change the extension
%%
Columns = {'Area','Eccentricity','Homogeneity','Energy','Correlation','Entropy','Class'};
excelFileName = 'AllFeatures.xlsx';

WBC = [];
RBC = [];
for i = 1:length(imageFiles)

    % Read the current image
    FullPath = fullfile(folderPath, imageFiles(i).name);
    myImage = imread(FullPath);

    % Preprocess and segment the image
    [seg_wbc, seg_rbc] = PreprocessingAndSegmentation(myImage);

    % Plot the segmented images
    %     subplot(2, 1, 1);
    %     imshow(seg_rbc);
    %     title('RBC');

    %     subplot(2, 1, 2);
    %     imshow(seg_wbc);
    %     title('WBC');

    % Features Extraction
    featwbc = ExtractFeatureWBC(seg_wbc);
    featrbc = ExtractFeatureRBC(seg_rbc);
    WBC = [WBC; featwbc];
    RBC = [RBC; featrbc];

end
%%
% Combine the extracted features in one excell file for further
FeaturesWBC = WBC;
FeaturesRBC = RBC;
AllFeatures = [FeaturesWBC; FeaturesRBC];
% xlswrite(excelFileName, AllFeatures);
% xlswrite(excelFileName, Columns);
%% Classification of the extracted features
[Accuracy, Sensitivity, Specificity] = Classification(AllFeatures);
