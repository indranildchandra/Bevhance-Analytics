X = dlmread('diffData.csv');
Y = labelledUnitsVector_char;
Mdl = fitctree(X,Y);
imp = predictorImportance(Mdl);

figure;
bar(imp);
title('Predictor Importance Estimates');
ylabel('Estimates');
xlabel('Predictors');
h = gca;
h.XTickLabel = Mdl.PredictorNames;
h.XTickLabelRotation = 45;
h.TickLabelInterpreter = 'none';


var(labelledDiffVector);
attributeVariance = var(labelledDiffVector);
normalizedAttributeVariance = attributeVariance./max(attributeVariance);
[attributeWeightage, attributeRank] = sort(normalizedAttributeVariance, 'descend');

figure, bar(attributeRank, attributeWeightage,'FaceColor',[0 .5 .5],'EdgeColor',[0 .6 .6],'LineWidth',0.5),
ytickformat('%.1f');
title('Predictor Importance Estimates');
ylabel('Estimates');
xlabel('Predictors');
h = gca;
h.XTickLabel = attributeRank;
h.XTickLabelRotation = 45;
h.TickLabelInterpreter = 'none';

srNo = [1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24;25;26;27;28;29;30;31;32;33;34];
attributeRank = transpose(attributeRank);
attributeWeightage = transpose(attributeWeightage);
dlmwrite('attributeRanking.csv', [srNo, attributeRank, attributeWeightage], 'delimiter',';');
