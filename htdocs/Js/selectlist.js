function setDynaList(arrNLists){

 var oList1 = document.forms[arrNLists[2]].elements[arrNLists[1]];
 var oList2 = document.forms[arrNLists[4]].elements[arrNLists[3]];
 var arrList = arrNLists[5];
 
 clearDynaList(oList2);
 
 if (oList1.selectedIndex == -1){
  oList1.selectedIndex = 0;
 }

 populateDynaList(oList2, oList1[oList1.selectedIndex].value, arrList);
 return true;
}
 
function clearDynaList(oList){

 for (var i = oList.options.length; i >= 0; i--){
  oList.options[i] = null;
 }
 
 oList.selectedIndex = -1;
}
 
function populateDynaList(oList, nIndex, aArray){

 for (var i = 0; i < aArray.length; i= i + 3){
  if (aArray[i] == nIndex){
   oList.options[oList.options.length] = new Option(aArray[i + 1], aArray[i + 2]);
   if (aArray[i+2] == nclassid )
   {
	   //alert(oList.options.length);
	   oList.selectedIndex = oList.options.length-1;
   }
  }
 }

 if (oList.options.length == 0){
  oList.options[oList.options.length] = new Option("→ 无二级分类",0);
 }
 else{
  oList.options[oList.options.length] = new Option('→ 无二级分类', 0);
 }
	
 if (nclassid == 0)
 {
  oList.selectedIndex = oList.options.length-1;
//oList.selectedIndex = 2;
}

}
function Kermy_JS(jsStr) { 
  return eval(jsStr)
}


var arrNList = new Array();
var arrNSet = new Array();

arrNSet[1] = "ClassID";              // Name of parent list box
arrNSet[2] = "myform";                      // Name of form containing parent list box
arrNSet[3] = "NClassID";               // Name of child list box
arrNSet[4] = "myform";                      // Name of form containing child list box
arrNSet[5] = arrNList;