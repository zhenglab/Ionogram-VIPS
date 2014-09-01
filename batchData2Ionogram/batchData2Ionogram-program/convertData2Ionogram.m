function [OriginalIonogram]=convertData2Ionogram(DataFilePath)

%函数功能：完成从数据.O文件到原始电离图的转换。

FileID=fopen(DataFilePath);  %打开文件
OriginalData=fread(FileID);  %读入数据 
fclose(FileID);              %关闭文件

OriginalMatrix=OriginalData(1:207360);                       %取有效数据
ReshapedMatrix=reshape(OriginalMatrix,162,[]);               %把数据变成矩阵
OddColumnNO=1:2:length(ReshapedMatrix);                      %取矩阵的奇数列数    
DelOddColumn=transformMatrix(ReshapedMatrix, OddColumnNO);   %去掉奇数列的变换矩阵
EvenColumnNO=2:2:length(ReshapedMatrix);                     %取矩阵偶数的列数  
DelEvenColumn=transformMatrix(ReshapedMatrix,EvenColumnNO);  %去掉偶数列的变换矩阵 
OriginalIonogram=DelOddColumn+DelEvenColumn;                 %把上面的俩个矩阵相加得到原始的电离图


