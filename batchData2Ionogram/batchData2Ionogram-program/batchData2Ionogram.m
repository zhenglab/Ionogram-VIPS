function  batchData2Ionogram(InputDir,OutDir)

%函数的主要功能：
%利用递归思想对一个嵌套文件夹里的文件进行批量处理，
%InputDir是待处理文件夹的路径，OutDir是处理后的文件要保存的路径

SubDir=dir(InputDir);
for i=1:length( SubDir )
      if( isequal(SubDir( i ).name(1), '.' ) )
        continue;
      end
      if SubDir(i,1).isdir==1  %如果是文件夹，保存路径
         mkdir(strcat(OutDir,SubDir(i,1).name,'/'));
         batchData2Ionogram(strcat(InputDir , SubDir(i,1).name,'/'),strcat(OutDir,SubDir(i,1).name,'/'));
      else
         imgfile=fullfile(InputDir ,SubDir(i,1).name);
         if isequal(SubDir(i,1).name((end-1):end),'.O')
            OriginalIonogram=convertData2Ionogram(imgfile);
            OriginalIonogramGray=mat2gray(OriginalIonogram);
            OriginalIonogramGrayUnit8=im2uint8(OriginalIonogramGray);
            imwrite(OriginalIonogramGrayUnit8,strcat(OutDir,SubDir(i,1).name(1:end-9),'.bmp'));
         end
      end  
end        
