rng(42);
data = [randn(100, 2)*0.75+ones(100,2);
        randn(100, 2)*0.75-ones(100, 2);
        randn(100, 2)*0.75];
k_values = [3, 5, 7];
subplot_rows = 1;
subplot_cols = numel(k_values);
figure;

for  i = 1:numel(k_values)
    k = k_values(i);
    
    [idx, centroids] = kmeans(data, k);
    
    subplot(subplot_rows, subplot_cols, i) ;
    scatter (data ( : , 1), data(:,2), 10, idx, 'filled');
    hold on;
    scatter (centroids(:, 1), centroids(:, 2), 50, 'k', 'filled', 'MarkerEdgeColor', 'w');
    title ( [ 'K—means Clustering (k = ', num2str(k), ')']);
    hold off;
end

sgtitle ( 'K—means Clustering Results for Different k Values');