function FeaturesRBC = ExtractFeatureRBC(seg_rbc)
% This fucntion extracts feature from the segmented red blood cell images
% and add '1' as class label and saves the extracted features for
% classification purpose
[L,n] = bwlabel(seg_rbc);
X = [];
for i=1:n
    m1=(L==i);
    props=regionprops(m1,'Area','Eccentricity');
    rbc_Areas(i,:) = [props.Area];
    rbc_Ecentricity(i,:)=[props.Eccentricity];
    rbc_stats(i,:) = graycoprops(m1, {'energy'});
    rbc_homogeneity(i,:) = graycoprops(graycomatrix(m1), 'Homogeneity');
    rbc_e(i,:) = entropy(m1);
    rbc_S(i,:) = std(m1);
    rbc_correlation(i,:) = graycoprops(graycomatrix(m1), 'Correlation');
    rbc_enerjy(i,:)=struct2array(rbc_stats(i,:));
    rbc_homogen(i,:) = struct2array(rbc_homogeneity(i,:));
    rbc_cor(i,:)=struct2array(rbc_correlation(i,:));
%     h = {'Area','Eccentricity','Homogeneity','Energy','Correlation','Entropy','Class'};
    A = [rbc_Areas(i,:) ,rbc_Ecentricity(i,:),rbc_e(i,:),rbc_homogen(i,:),rbc_enerjy(i,:),rbc_cor(i,:), 1];
    X = [X; A];
end
FeaturesRBC = X;
% Features = [h; num2cell(X)];