function FeaturesWBC = ExtractFeatureWBC(seg_wbc)
% This fucntion extracts feature from the segmented white blood cell images
% and add '0' as class label and saves the extracted features for
% classification purpose
[L,n] = bwlabel(seg_wbc);
X = [];
for i=1:n
    m1=(L==i);
    props=regionprops(m1,'Area','Eccentricity');
    wbc_Areas(i,:) = [props.Area];
    wbc_Ecentricity(i,:)=[props.Eccentricity];
    wbc_stats(i,:) = graycoprops(m1, {'energy'});
    wbc_homogeneity(i,:) = graycoprops(graycomatrix(m1), 'Homogeneity');
    wbc_e(i,:) = entropy(m1);
    wbc_S(i,:) = std(m1);
    wbc_correlation(i,:) = graycoprops(graycomatrix(m1), 'Correlation');
    wbc_enerjy(i,:)=struct2array(wbc_stats(i,:));
    wbc_homogen(i,:) = struct2array(wbc_homogeneity(i,:));
    wbc_cor(i,:)=struct2array(wbc_correlation(i,:));
%     h = {'Area','Eccentricity','Homogeneity','Energy','Correlation','Entropy','Class'};
    A = [wbc_Areas(i,:) ,wbc_Ecentricity(i,:),wbc_e(i,:),wbc_homogen(i,:),wbc_enerjy(i,:),wbc_cor(i,:), 0];
    X = [X; A];
end
FeaturesWBC = X;
% Features = [h; num2cell(X)];