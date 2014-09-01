function TransformedMatrix=transformMatrix(ReshapedMatrix,ColumnNO)

%函数功能：
%根据仪器的测量原理，对输入的矩阵进行转换。
%具体步骤：
%1.把输入矩阵的奇数或偶数列去掉
%2.上下翻转，复制每行，得到一个320*640的矩阵。

ReshapedMatrix(:,ColumnNO)=[];                                                     
ReshapedMatrix(1:2,:)=[];            % %把矩阵的第一、二行去掉，形成一个160*640的矩阵
UpDownMatrix=ReshapedMatrix(size(ReshapedMatrix):-1:1,1:size(ReshapedMatrix,2));   
TransformedMatrix = zeros(size(UpDownMatrix,1)*2,size(UpDownMatrix,2));            

for j = 1:size(UpDownMatrix,1)                                                    
    TransformedMatrix(2*j-1,:) = UpDownMatrix(j,:);
    TransformedMatrix(2*j,:) = UpDownMatrix(j,:);
end
