<script Language="jscript" runat="server">  
    Array.prototype.get = function(x) { return this[x]; };  
    function parseJSON(strJSON) { return eval("(" + strJSON + ")"); }  
</script>  

<%  

    '1.查看文件是否存在 2.存在查看创建日期  3.读写文件  4.解析数据

    Dim ResultPh
    Public toResultobj,toResult
    '-------------------------创建文件-----------------------------
    Set toResultobj = Server.CreateObject("Scripting.FileSystemObject")
    ResultPh = Server.MapPath("\resultData.txt")
    toResultobj.CreateTextFile ResultPh,true
    '--------------------创建时间--------------------------------------
    'Set fileInfo = objFSO.GetFile(Ph)
    ' Response.Write(fileInfo.DateCreated)
  '-------------------------获取数据----------------

     '写入格式头   
    Set toResult = toResultobj.OpenTextFile(ResultPh,2,True)
    toResult.Write "{" & """"&"status"&""""&":"&""""&"ok"&""""&","
    toResult.Write """"&"time"&""""&":"& Now &","
    toResult.Write """"&"result"&""""&":["
    
     '------------------- 解析数据---------------------- 
    '写入数据
    getDataByLocation 117.9,26.8667
    toResult.Write ","
    getDataByLocation 117.9833,27
    toResult.Write ","
    getDataByLocation 117.85            26.8833
    toResult.Write ","
    getDataByLocation 117.9667        26.8167
    toResult.Write ","
    getDataByLocation 117.8833        26.8167
    toResult.Write ","
    getDataByLocation 117.55            26.9833
    toResult.Write ","
    getDataByLocation 117.6667        26.9333
    toResult.Write ","
    getDataByLocation  117.7167        26.9333
    toResult.Write ","
    getDataByLocation 117.9              27.15
    toResult.Write ","
    getDataByLocation 117.9              27.0833
    toResult.Write ","
    getDataByLocation 117.8              27.0333
    toResult.Write ","
    getDataByLocation 117.8              26.95
    toResult.Write ","
     getDataByLocation  117.7667        26.9167
    toResult.Write ","
     getDataByLocation  118.1667        26.9333
    toResult.Write ","
     getDataByLocation 117.7833       26.6833
    toResult.Write ","
     getDataByLocation  117.9333       26.9667
    toResult.Write ","
     getDataByLocation 117.892         26.792
    toResult.Write ","
     getDataByLocation 117.917         26.796
    toResult.Write ","
     getDataByLocation 117.683         26.816
    toResult.Write ","
     getDataByLocation 117.7167      26.7667
    toResult.Write ","
     getDataByLocation 118               26.8833
    toResult.Write ","
     getDataByLocation 117.8667      27.0333

    Set obj = Nothing

    '写入结尾End write to file
    toResult.Write "]}"
    toResult.Close
    Set toResult = Nothing
    Set toResultobj = Nothing



      
   '-----------------------------------------------------------------------
  
    Sub getDataByLocation(longitude,latitude)
    
        URL = "https://api.caiyunapp.com/v2/DFAmjM1lRC4KfC-4/" & longitude & "," & latitude & "/forecast.json"
        weatherData = GetHttpPage(URL,"UTF-8")
        Set obj = parseJSON(weatherData)

        '----------------------------降雨量预测-----------------------------------
        toResult.Write "{" & """"&"location"&""""&":["&longitude &","& latitude & "],"
        toResult.Write """"&"precipitation"&""""&":{"
   
        '写入数据
         'hourly
         toResult.Write """"&"hourly"&""""&":["
         Set hou= obj.result.hourly.precipitation
         For n=0 To 47
            hourlvalue= hou.get(n).value
            hourltime = hou.get(n).datetime
            toResult.Write "{"&""""&"value"&""""&":" & hourlvalue & "," & """"&"datetime"&""""&":" & hourltime & "}" 
            If n<>47 Then
              toResult.Write ","
            End If
        Next
        toResult.Write "],"       

         'min
         toResult.Write """"&"minutely"&""""&":["
           Set minu= obj.result.minutely.precipitation
         For n=0 To 59
            minuvalue= minu.get(n)
         toResult.Write minuvalue  
            If n<>59 Then
              toResult.Write ","
            End If
         Next
        toResult.Write "],"

          'day
         toResult.Write """"&"daily"&""""&":["
         Set daily= obj.result.daily.precipitation
         For n=0 To 4
        daytime = daily.get(n).date
        daymax = daily.get(n).max
        dayavg=daily.get(n).avg
        daymin=daily.get(n).min
         toResult.Write "{"&""""&"date"&""""&":" & daytime & "," & """"&"max"&""""&":" & daymax & "," & """"&"avg"&""""&":" & dayavg & "," & """"&"min"&""""&":" & daymin & "}" 
        If n<>4 Then
         toResult.Write ","
        End If
        Next
         toResult.Write "]},"

  

          '----------------------------温度预测-----------------------------------
    
        toResult.Write """"&"temperature"&""""&":{"
            
        '写入数据
         'hourly
         toResult.Write """"&"hourly"&""""&":["
         Set houTem= obj.result.hourly.temperature
         For n=0 To 47
            hourlTemValue= houTem.get(n).value
            hourlTemTime = houTem.get(n).datetime
         toResult.Write "{"&""""&"value"&""""&":" & hourlTemValue & "," & """"&"datetime"&""""&":" & hourlTemTime & "}" 
            If n<>47 Then
              toResult.Write ","
        End If
        Next
        toResult.Write "],"       


          'day
         toResult.Write """"&"daily"&""""&":["
         Set dailyTem= obj.result.daily.temperature
         For n=0 To 4
        dayTemtime = dailyTem.get(n).date
        dayTemmax = dailyTem.get(n).max
        dayTemavg=dailyTem.get(n).avg
        dayTemmin=dailyTem.get(n).min
         toResult.Write "{"&""""&"date"&""""&":" & dayTemtime & "," & """"&"max"&""""&":" & dayTemmax & "," & """"&"avg"&""""&":" & dayTemavg & "," & """"&"min"&""""&":" & dayTemmin & "}" 
        If n<>4 Then
         toResult.Write ","
        End If
        Next
         toResult.Write "]},"

   



         '----------------------------湿度预测-----------------------------------
    
        toResult.Write """"&"humidity"&""""&":{"
     
        '写入数据
         'hourly
         toResult.Write """"&"hourly"&""""&":["
         Set houHum= obj.result.hourly.humidity
         For n=0 To 47
            hourlHumValue= houHum.get(n).value
            hourlHumTime = houHum.get(n).datetime
         toResult.Write "{"&""""&"value"&""""&":" & hourlHumValue & "," & """"&"datetime"&""""&":" & hourlHumTime & "}" 
            If n<>47 Then
              toResult.Write ","
        End If
        Next
        toResult.Write "],"       


          'day
         toResult.Write """"&"daily"&""""&":["
         Set dailyHum= obj.result.daily.humidity
         For n=0 To 4
        dayHumtime = dailyHum.get(n).date
        dayHummax = dailyHum.get(n).max
        dayHumavg=dailyHum.get(n).avg
        dayHummin=dailyHum.get(n).min
         toResult.Write "{"&""""&"date"&""""&":" & dayHumtime & "," & """"&"max"&""""&":" & dayHummax & "," & """"&"avg"&""""&":" & dayHumavg & "," & """"&"min"&""""&":" & dayHummin & "}" 
        If n<>4 Then
         toResult.Write ","
        End If
        Next
         toResult.Write "]}"

        '写入数据尾      
       

          toResult.Write "}"

    End Sub
    
    
     



Function GetHttpPage(url, charset) 
    Dim http 
    Set http = Server.createobject("Msxml2.ServerXMLHTTP")
    http.Open "GET", url, false
    http.Send() 
    If http.readystate<>4 Then
        Exit Function 
    End If 
    GetHttpPage = BytesToStr(http.ResponseBody, charset)
    Set http = Nothing
End function


Function BytesToStr(body, charset)
    Dim objStream
    Set objStream = Server.CreateObject("Adodb.Stream")
    objStream.Type = 1
    objStream.Mode = 3
    objStream.Open
    objStream.Write body
    objStream.Position = 0
    objStream.Type = 2
    objStream.Charset = charset
    BytesToStr = objStream.ReadText 
    objStream.Close
    Set objStream = Nothing
End Function
%>



   