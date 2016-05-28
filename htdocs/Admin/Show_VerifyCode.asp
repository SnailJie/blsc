<%
Sub VerifyCode(num)
    Dim image, width, height, digtal, length, sort, digital,hc,j, imgdata(10,10)
	imgdata(0,1)="0x3c":imgdata(0,2)="0x42":imgdata(0,3)="0x42":imgdata(0,4)="0x42":imgdata(0,5)="0x42":imgdata(0,6)="0x42":imgdata(0,7)="0x42":imgdata(0,8)="0x42":imgdata(0,9)="0x42":imgdata(0,10)="0x3c"
    imgdata(1,1)="0x20":imgdata(1,2)="0x30":imgdata(1,3)="0x28":imgdata(1,4)="0x20":imgdata(1,5)="0x20":imgdata(1,6)="0x20":imgdata(1,7)="0x20":imgdata(1,8)="0x20":imgdata(1,9)="0x20":imgdata(1,10)="0x20"
    imgdata(2,1)="0x3c":imgdata(2,2)="0x66":imgdata(2,3)="0x60":imgdata(2,4)="0x60":imgdata(2,5)="0x30":imgdata(2,6)="0x18":imgdata(2,7)="0x0c":imgdata(2,8)="0x06":imgdata(2,9)="0x06":imgdata(2,10)="0x7e"
    imgdata(3,1)="0x3c":imgdata(3,2)="0x42":imgdata(3,3)="0x40":imgdata(3,4)="0x40":imgdata(3,5)="0x38":imgdata(3,6)="0x40":imgdata(3,7)="0x40":imgdata(3,8)="0x40":imgdata(3,9)="0x42":imgdata(3,10)="0x3c"
    imgdata(4,1)="0x20":imgdata(4,2)="0x30":imgdata(4,3)="0x30":imgdata(4,4)="0x28":imgdata(4,5)="0x28":imgdata(4,6)="0x24":imgdata(4,7)="0x24":imgdata(4,8)="0x7e":imgdata(4,9)="0x20":imgdata(4,10)="0x20"
    imgdata(5,1)="0x7c":imgdata(5,2)="0x04":imgdata(5,3)="0x04":imgdata(5,4)="0x02":imgdata(5,5)="0x3e":imgdata(5,6)="0x42":imgdata(5,7)="0x40":imgdata(5,8)="0x40":imgdata(5,9)="0x42":imgdata(5,10)="0x3c"
    imgdata(6,1)="0x3c":imgdata(6,2)="0x42":imgdata(6,3)="0x02":imgdata(6,4)="0x02":imgdata(6,5)="0x3a":imgdata(6,6)="0x46":imgdata(6,7)="0x42":imgdata(6,8)="0x42":imgdata(6,9)="0x42":imgdata(6,10)="0x3c"
    imgdata(7,1)="0x7e":imgdata(7,2)="0x20":imgdata(7,3)="0x20":imgdata(7,4)="0x10":imgdata(7,5)="0x10":imgdata(7,6)="0x08":imgdata(7,7)="0x08":imgdata(7,8)="0x04":imgdata(7,9)="0x04":imgdata(7,10)="0x04"
    imgdata(8,1)="0x3c":imgdata(8,2)="0x42":imgdata(8,3)="0x42":imgdata(8,4)="0x42":imgdata(8,5)="0x3c":imgdata(8,6)="0x42":imgdata(8,7)="0x42":imgdata(8,8)="0x42":imgdata(8,9)="0x42":imgdata(8,10)="0x3c"
    imgdata(9,1)="0x3c":imgdata(9,2)="0x42":imgdata(9,3)="0x42":imgdata(9,4)="0x42":imgdata(9,5)="0x5c":imgdata(9,6)="0x40":imgdata(9,7)="0x40":imgdata(9,8)="0x40":imgdata(9,9)="0x22":imgdata(9,10)="0x1c"

    length = 4 '验证码长度
    ReDim sort( length )
    digital =right(string(length,"0")&num,length)

    For i = 1 To len( digital )
        sort(i) = mid( digital, i, 1 )
    Next
    width = 8 * len( digital )   '图像的宽度
    height = 10  '图像的高度，在本例中为固定值
    response.contenttype="image/x-xbitmap"
    hc=chr(13) & chr(10) 
    image = "#define counter_width " & width & hc
    image = image & "#define counter_height " & height & hc
    image = image & "static unsigned char counter_bits[]={" & hc
    For i = 1 To height
        For j = 1 To length
            image = image & imgdata(sort(j),i) & ","
        Next
    Next
    image = left( image, len( image ) - 1 ) '去掉最后一个逗号
    image = image & "};" & hc
    response.write image
End Sub

Call VerifyCode(Session("Rand"))
%>