%% Hypertension and socio-demography: 
% using neural networks to predict high blood pressure 
% from responses to the English Longitudinal Study of Ageing 
% Alexandros Dimitrios Nalmpantis, & Georgios Kyriakopoulos; 
% INM-427 (2017)

%% Support Vector Machines

%% Set working directory for the analysis
cd 'C:\Users\Render02\Desktop\MSc Data Science\Neural networks\Coursework\NN-Matlab'

%% Set filename and read the excel data-file (here, classes are coded as [-1, 1]
filename = 'Variables_SVM.xlsx';
%filename = '1.ELSA_Wave 7_v1.xlsx',
[ds,txt,raw] = xlsread(filename); 

%% Create a matrix with the training data in randomised order (remove first
% columns := id)
ds_svm=ds(:,2:43);
ds_svm_rand = ds_svm(randperm(size(ds_svm,1)),:);

%% Split into training and testing dataset (randomly 70%-train; 30% test)
numInst = size(ds_svm_rand,1);
idx = randperm(numInst);
numTrain = round(numInst*(70/100)); 
numTest = numInst - numTrain;

svm_train = ds_svm_rand(idx(1:numTrain),:);  
svm_test = ds_svm_rand(idx(numTrain+1:end),:);

%% Train, validate, and test SVM with linear kernel
[svm_kernel_linear_trained, validationAccuracy_svm_kernel_linear] = svm_kernel_linear(svm_train)
yfit_svm_kernel_linear = svm_kernel_linear_trained.predictFcn(svm_test(:,2:42));
confusion_svm_kernel_linear = confusionmat(svm_test(:,1),yfit_svm_kernel_linear)
stats_svm_kernel_linear = confusionmatStats(svm_test(:,1),yfit_svm_kernel_linear)

%% Train, validate, and test SVM with quadratic kernel
[svm_kernel_quad_trained, validationAccuracy_svm_kernel_quad] = svm_kernel_quad(svm_train);
yfit_svm_kernel_quad = svm_kernel_quad_trained.predictFcn(svm_test(:,2:42));
confusion_svm_kernel_quad = confusionmat(svm_test(:,1),yfit_svm_kernel_quad)
stats_svm_kernel_quad = confusionmatStats(svm_test(:,1),yfit_svm_kernel_quad)

%% Train, validate, and test SVM with cubic kernel 
[svm_kernel_cubic_trained, validationAccuracy_svm_kernel_cubic] = svm_kernel_cubic(svm_train);
yfit_svm_kernel_cubic = svm_kernel_cubic_trained.predictFcn(svm_test(:,2:42));
confusion_svm_kernel_cubic = confusionmat(svm_test(:,1),yfit_svm_kernel_cubic)
stats_svm_kernel_cubic = confusionmatStats(svm_test(:,1),yfit_svm_kernel_cubic)

%% Train, validate, and test SVM with fine gaussian kernel 
[svm_kernel_fgauss_trained, validationAccuracy_svm_kernel_fgauss] = svm_kernel_fgauss(svm_train);
yfit_svm_kernel_fgauss = svm_kernel_fgauss_trained.predictFcn(svm_test(:,2:42));
confusion_svm_kernel_fgauss = confusionmat(svm_test(:,1),yfit_svm_kernel_fgauss)
stats_svm_kernel_fgauss = confusionmatStats(svm_test(:,1),yfit_svm_kernel_fgauss)

%% Train, validate, and test SVM medium gaussian kernel 
[svm_kernel_mgauss_trained, validationAccuracy_svm_kernel_mgauss] = svm_kernel_mgauss(svm_train);
yfit_svm_kernel_mgauss = svm_kernel_mgauss_trained.predictFcn(svm_test(:,2:42));
confusion_svm_kernel_mgauss = confusionmat(svm_test(:,1),yfit_svm_kernel_mgauss)
stats_svm_kernel_mgauss = confusionmatStats(svm_test(:,1),yfit_svm_kernel_mgauss)

%% Train, validate, and test SVM with coarse gaussian kernel 
[svm_kernel_cgauss_trained, validationAccuracy_svm_kernel_cgauss] = svm_kernel_cgauss(svm_train);
yfit_svm_kernel_cgauss = svm_kernel_cgauss_trained.predictFcn(svm_test(:,2:42));
confusion_svm_kernel_cgauss = confusionmat(svm_test(:,1),yfit_svm_kernel_cgauss)
stats_svm_kernel_cgauss = confusionmatStats(svm_test(:,1),yfit_svm_kernel_cgauss)

