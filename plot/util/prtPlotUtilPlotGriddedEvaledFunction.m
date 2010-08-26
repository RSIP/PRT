function imageHandle = prtPlotUtilPlotGriddedEvaledFunction(DS, linGrid, gridSize, cMap)

nDims = size(linGrid,2);
switch nDims
    case 1
        imageHandle = plot(linGrid, DS);
        
        %imageHandle = imagesc(linGrid,ones(size(linGrid)),DS);
        %set(gca,'YTickLabel',[])
        %colormap(cMap)
    case 2
        xx = reshape(linGrid(:,1),gridSize);
        yy = reshape(linGrid(:,2),gridSize);
        imageHandle = imagesc(xx(1,:),yy(:,1),DS);
        colormap(cMap)
    case 3
        xx = reshape(linGrid(:,1),gridSize);
        yy = reshape(linGrid(:,2),gridSize);
        zz = reshape(linGrid(:,3),gridSize);
        imageHandle = slice(xx,yy,zz,DS,max(xx(:)),max(yy(:)),[min(zz(:)),mean(zz(:))]);
        set(imageHandle,'edgecolor','none')
           
        
        view(3)
        colormap(cMap)
        set(gca,'Layer','top');
        box on;
        imageHandle = imageHandle(1); % Sorry we need to throw the others away
end
axis tight;
axis xy;

end