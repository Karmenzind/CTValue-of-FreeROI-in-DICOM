
*2017年4月11日 19点48分*
### Dicom
>   在dicom图像上画个不规则的区域，
然后计算这个区域的平均CT值，中位CT值，以及标准差

————————————————————————————
#####    步骤
1.  DICOM图像显示骨窗
2.  勾画骨窗上的病灶
3.  计算病灶范围内的平均CT值，中位CT值，以及标准差


*  一共50个病人，每个病人3张Dicom
*  窗位

————————————————————————————

>	
1.	用从DICOM文件中读取的rescaleslope值和rescale intercept值可以将每个像素的灰度值转换成CT值。
metadata=dicominfo ('***.dcm')
Hu=pixel_val*rescale_slope+rescale_intercept;
pixel_val是第i个像素的灰度值
Hu是第i个像素的CT值
2.	uint是0到255范围吧，你可以用uint函数进行转化，也可以数据归一化后都乘以256.