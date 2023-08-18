function [seg_wbc, seg_rbc] = PreprocessingAndSegmentation(image)

myImage = image(:,:,2);
myImage = adapthisteq(myImage);
t = graythresh(myImage);
BW = imbinarize(myImage, t);
BW1 = bwareaopen(BW, 1000);
BW2 = ~BW1;
BW3 = imfill(BW2, 'holes');
BW4 = bwareaopen(BW3, 400);
eroded_img = imerode(BW4, strel('disk', 10));

seg_wbc = bwareafilt(eroded_img, [5000 20000]);
seg_wbc = imfill(seg_wbc, 'holes');
seg_rbc = logical(imsubtract(eroded_img, seg_wbc));