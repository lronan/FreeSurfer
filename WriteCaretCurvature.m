% This script writes a readable caretcurvature file. 

subs=dir('HCP*');
for i=1:length(subs);


%k=1;
%P=100;

[v, L, ct] = read_annotation(['',subs(i).name,'/label/lh.aparc.annot']);
[b1, c1] = size(v);
    a1 = b1 + 22;
aKcurv=csvread(['',subs(i).name,'/surf/lh.caret.curv'], 23, 1, [23, 1, a1, 1]);
  

 aKcurv=abs(aKcurv);
 amed=median(aKcurv);
 aKcurv((aKcurv >=2))=amed;
 
lhcurv=MRIread(['',subs(i).name,'/surf/lh.w-g.pct.mgh']);
lhcurv.vol=aKcurv;

cd(subs(i).name)
MRIwrite(lhcurv, 'surf/lh.CaretCurv.mgh');
cd ..    
end