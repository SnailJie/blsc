
 function over(obj,a)
 { 
 obj.src='/images/n/'+obj.id+'.gif';
 for(var i=1;i<10;i++)
 {
if(a+i!=obj.id)
 { 
    document.getElementById("l"+i).style.display="none";
    document.getElementById("m"+i).src='/images/m/m'+i+'.gif';
 
 }
 else
 { 
    document.getElementById("l"+i).style.display="block"; 
 }
 }
 }

