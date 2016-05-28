var HomeCountryName = "United States";
var HomeSelectedCountry;
var HomeCountryCode;
var HomePageLocale;
var HomeAgilentLocale;
var headerHeight;
var moreReturnURL;

var isIosDevice;

var scrollPosFix;
var mouseTop;
var mainHeaderTop;
var stickyHeaderTop;
var menuSelected;
var menuLeaveYes;
var menuLeaveFixYes;
var deviceMegaMenuLeave=false;

var countryHome = [];
var countryName = [];
var agLocaleArray = [];

var prodCosURLDomain="www.chem.agilent.com";
var prodURLDomain="www.agilent.com";
var prodCNURLDomain="cn.chem.agilent.com";
var genomicsDomain="www.genomics.agilent.com";

countryName[0] = ["US","United States"];countryName[1] = ["CN","中国"];countryName[2] = ["JP", "日本"];countryName[3] = ["KR", "한국"];
countryName[4] = ["VN", "Vietnam"];countryName[5] = ["BR", "Brasil"];countryName[6] = ["RU", "Россия"];countryName[7] = ["DE", "Deutschland"];
countryName[8] = ["FR", "France"];countryName[9] = ["ES", "España"];countryName[10] = ["IT", "Italia"];countryName[11] = ["TW", "Taiwan"];
countryName[12]=["AE","United Arab Emirates"];countryName[13]=["AL","Albania"];countryName[14]=["AM","Armenia"];
countryName[15]=["AN","Netherlands Antilles"];countryName[16]=["AO","Angola"];countryName[17]=["AR","Argentina"];countryName[18]=["AT","Austria"];
countryName[19]=["AU","Australia"];countryName[20]=["AW","Aruba"];countryName[21]=["AZ","Azerbaijan"];countryName[22]=["BA","Bosnia and Herzegovina"];
countryName[23]=["BD","Bangladesh"];countryName[24]=["BE","Belgium"];countryName[25]=["BE","Belgium"];countryName[26]=["BF","Burkina Faso"];
countryName[27]=["BG","Bulgaria"];countryName[28]=["BH","Bahrain"];countryName[29]=["BI","Burundi"];countryName[30]=["BJ","Benin"];
countryName[31]=["BN","Brunei Darussalam"];countryName[32]=["BO","Bolivia"];countryName[33]=["BO","Bolivia"];countryName[34]=["BW","Botswana"];
countryName[35]=["BY","Belarus"];countryName[36]=["BZ","Belize"];countryName[37]=["CA","Canada"];countryName[38]=["CA","Canada"];
countryName[39]=["CG","DR Congo"];countryName[40]=["CF","Central African Republic"];countryName[41]=["CD","Congo"];
countryName[42]=["CH","Switzerland"];countryName[43]=["CH","Switzerland"];countryName[44]=["CI","Ivory Coast"];countryName[45]=["CL","Chile"];
countryName[46]=["CM","Cameroon"];countryName[47]=["CM","Cameroon"];countryName[48]=["CO","Colombia"];countryName[49]=["CR","Costa Rica"];
countryName[50]=["CY","Cyprus"];countryName[51]=["CZ","Czech Republic"];countryName[52]=["CZ","Czech Republic"];
countryName[53]=["DJ","Djibouti"];countryName[54]=["DK","Denmark"];countryName[55]=["DO","Dominican Republic"];
countryName[56]=["DZ","Algeria"];countryName[57]=["EC","Ecuador"];countryName[58]=["EE","Estonia"];countryName[59]=["EG","Egypt"];
countryName[60]=["ER","Eritrea"];countryName[61]=["ER","Eritrea"];countryName[62]=["ET","Ethiopia"];countryName[63]=["FI","Finland"];
countryName[64]=["ER","Eritrea"];countryName[65]=["GA","Gabon"];countryName[66]=["GB","United Kingdom"];countryName[67]=["GE","Georgia"];
countryName[68]=["GH","Ghana"];countryName[69]=["GM","Gambia"];countryName[70]=["GN","Guinea"];countryName[71]=["GQ","Equatorial Guinea"];
countryName[72]=["GR","Greece"];countryName[73]=["GT","Guatemala"];countryName[74]=["GW","Guinea-Bissau"];countryName[75]=["HK","Hong Kong"];
countryName[76]=["HN","Honduras"];countryName[77]=["HR","Croatia"];countryName[78]=["HU","Hungary"];countryName[79]=["ID","Indonesia"];
countryName[80]=["IE","Ireland"];countryName[81]=["IL","Israel"];countryName[82]=["IN","India"];countryName[83]=["IQ","Iraq"];
countryName[84]=["IS","Iceland"];countryName[85]=["ER","Eritrea"];countryName[86]=["JO","Jordan"];countryName[87]=["ER","Eritrea"];
countryName[88]=["KE","Kenya"];countryName[89]=["KG","Kyrgyzstan"];countryName[90]=["ER","Eritrea"];countryName[91]=["KW","Kuwait"];
countryName[92]=["KZ","Kazakhstan"];countryName[93]=["LB","Lebanon"];countryName[94]=["LK","Sri Lanka"];countryName[95]=["LR","Liberia"];
countryName[96]=["LS","Lesotho"];countryName[97]=["LT","Lithuania"];countryName[98]=["LU","Luxembourg"];countryName[99]=["LV","Latvia"];
countryName[100]=["LY","Libya"];countryName[101]=["MA","Morocco"];countryName[102]=["MD","Moldova, Republic of"];countryName[103]=["ME","Montenegro"];
countryName[104]=["MG","Madagascar"];countryName[105]=["MK","Macedonia, Republic of"];countryName[106]=["ML","Mali"];
countryName[107]=["MR","Mauritania"];countryName[108]=["MT","Malta"];countryName[109]=["MU","Mauritius"];countryName[110]=["MW","Malawi"];
countryName[111]=["MX","Mexico"];countryName[112]=["MY","Malaysia"];countryName[113]=["MZ","Mozambique"];countryName[114]=["NA","Namibia"];
countryName[115]=["NE","Niger"];countryName[116]=["NG","Nigeria"];countryName[117]=["NI","Nicaragua"];countryName[118]=["NL","Netherlands"];
countryName[119]=["NO","Norway"];countryName[120]=["NZ","New Zealand"];countryName[121]=["OM","Oman"];countryName[122]=["PA","Panama"];
countryName[123]=["PE","Peru"];countryName[124]=["PH","Philippines"];countryName[125]=["PK","Pakistan"];countryName[126]=["PL","Poland"];
countryName[127]=["PR","Puerto Rico"];countryName[128]=["PT","Portugal"];countryName[129]=["PY","Paraguay"];countryName[130]=["QA","Qatar"];
countryName[131]=["RE","Reunion"];countryName[132]=["RO","Romania"];countryName[133]=["RS","Serbia"];countryName[134]=["ER","Eritrea"];
countryName[135]=["RW","Rwanda"];countryName[136]=["SA","Saudi Arabia"];countryName[137]=["SC","Seychelles"];countryName[138]=["SE","Sweden"];
countryName[139]=["SG","Singapore"];countryName[140]=["SI","Slovenia"];countryName[141]=["SK","Slovakia"];countryName[142]=["SL","Sierra Leone"];
countryName[143]=["SN","Senegal"];countryName[144]=["SO","Somalia"];countryName[145]=["SV","El Salvador"];countryName[146]=["SZ","Swaziland"];
countryName[147]=["TD","Chad"];countryName[148]=["TG","Togo"];countryName[149]=["TH","Thailand"];countryName[150]=["TJ","Tajikistan"];
countryName[151]=["TM","Turkmenistan"];	countryName[152]=["TN","Tunisia"];countryName[153]=["TR","Turkey"];countryName[154]=["TW","Taiwan"];
countryName[155]=["TZ","Tanzania"];countryName[156]=["UA","Ukraine"];countryName[157]=["UG","Uganda"];
countryName[158]=["ER","Eritrea"];countryName[159]=["UY","Uruguay"];countryName[160]=["UZ","Uzbekistan"];countryName[161]=["VE","Venezuela"];
countryName[162]=["YE","Yemen"];countryName[163]=["ZA","South Africa"];countryName[164]=["ZM","Zambia"];countryName[165]=["ZW","Zimbabwe"];
countryName[166]=["ZZ","Worldwide"];		

countryHome[0] = ["US","en_US"];countryHome[1] = ["CN","zh_CN"];countryHome[2] = ["JP", "ja_JP"];countryHome[3] = ["KR", "ko_KR"];
countryHome[4] = ["VN", "vi_VN"];countryHome[5] = ["BR", "pt_BR"];countryHome[6] = ["RU", "ru_RU"];countryHome[7] = ["DE", "de_DE"];
countryHome[8] = ["FR", "fr_FR"];countryHome[9] = ["ES", "es_ES"];countryHome[10] = ["IT", "it_IT"];countryHome[11] = ["TW", "zh_TW"];
countryHome[12] = ["AR", "es_ES"];countryHome[13] = ["AT", "de_DE"];countryHome[14] = ["BE", "fr_FR"];countryHome[15] = ["CA", "en_US"];
countryHome[16] = ["CH", "de_DE"];countryHome[17] = ["CH", "fr_FR"];countryHome[18] = ["MX", "es_ES"];countryHome[19] = ["VE", "es_ES"];
countryHome[20] = ["PT", "pt_BR"]; countryHome[21] = ["HK", "zh_CN"]; countryHome[22] = ["LU", "fr_FR"];countryHome[23] = ["BY", "ru_RU"]; 
countryHome[24] = ["KZ", "ru_RU"]; countryHome[25] = ["KG", "ru_RU"];countryHome[26] = ["TJ", "ru_RU"]; countryHome[27] = ["TM", "ru_RU"];
countryHome[28] = ["UA", "ru_RU"];countryHome[29] = ["BZ", "es_ES"]; countryHome[30] = ["BO", "es_ES"]; countryHome[31] = ["CL", "es_ES"];
countryHome[32] = ["CO", "es_ES"]; countryHome[33] = ["CR", "es_ES"]; countryHome[34] = ["DO", "es_ES"];countryHome[35] = ["EC", "es_ES"]; 
countryHome[36] = ["SV", "es_ES"]; countryHome[37] = ["GT", "es_ES"];countryHome[38] = ["HN", "es_ES"]; countryHome[39] = ["NI", "es_ES"];
countryHome[40] = ["PA", "es_ES"];countryHome[41] = ["PY", "es_ES"]; countryHome[42] = ["PE", "es_ES"]; countryHome[43] = ["PR", "es_ES"];
countryHome[44] = ["UY", "es_ES"]; 

agLocaleArray[0] = ["en","eng"]; agLocaleArray[1] = ["fr","fre"]; agLocaleArray[2] = ["de","ger"]; agLocaleArray[3] = ["zh","chi"]; 
agLocaleArray[4] = ["ko","kor"]; agLocaleArray[5] = ["ja","jpn"]; agLocaleArray[6] = ["vi","vie"]; agLocaleArray[7] = ["pt","por"];
agLocaleArray[8] = ["ru","rus"]; agLocaleArray[9] = ["es","spa"]; agLocaleArray[10] = ["it","ita"]; 

var langLocale = [];
var lang = [];

langLocale[0] = ["en","en_US"]; langLocale[1] = ["fr","fr_FR"]; langLocale[2] = ["de","de_DE"]; langLocale[3] = ["zh","zh_CN"]; 
langLocale[4] = ["ko","ko_KR"]; langLocale[5] = ["ja","ja_JP"]; langLocale[6] = ["vi","vi_VN"]; langLocale[7] = ["pt","pt_BR"];
langLocale[8] = ["ru","ru_RU"]; langLocale[9] = ["es","es_ES"]; langLocale[10] = ["it","it_IT"]; 

lang[0] = ["en","English"]; lang[1] = ["fr","Français"]; lang[2] = ["de","Deutsch"]; lang[3] = ["zh","简体中文"]; 
lang[4] = ["ko","한국어"]; lang[5] = ["ja","日本語"]; lang[6] = ["vi","Việt"]; lang[7] = ["pt","Português"];
lang[8] = ["ru","Русский"]; lang[9] = ["es","Español"]; lang[10] = ["it","Italiano"]; 

$(document).ready(function(){
isIosDevice= (/iphone|ipad|ipod/i.test(navigator.userAgent.toLowerCase()));


//$("#topRtNav3 #selectedCountry").text($.cookie("CountryName"));
// add new script to resolve cross domain cookie issue for agilent.com.cn
if($.cookie("CountryName")!=null){
	$("#topRtNav3 #selectedCountry").text($.cookie("CountryName"));
}else{
	$("#topRtNav3 #selectedCountry").text(HomeCountryName);
}
$("#topRtNav3").show();
$("#topRtNav").show();

  //---mega menu header new changes -----//
 	scrollPosFix = $(window).scrollTop();
	 mainHeaderTop=$("#homeMainNav").offset().top;
	//stickyHeaderTop=$("#homeMainNavFix").offset().top;	
   	 $("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
    	$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();

	$(document).mousemove(function(event) {
		
	 mouseTop=event.clientY;
	
	});

//----end---//

/* Start of Code Addition for Sapphire CR */
$('.countryList li a').click(function(){
	var parent   = jQuery(this).parent();
	var previous = jQuery('.countryShowLang');			
	if (!parent.hasClass('countryShowLang'))
	{
		// hide open element
		previous.find('.countryLanguageList').slideUp();
		previous.removeClass('countryShowLang');
		// show current element
		parent.addClass('countryShowLang');
		parent.find('.countryLanguageList').slideDown();
	}
	else
	{
		// hide element
		parent.find('.countryLanguageList').slideUp();
		parent.removeClass('countryShowLang');
	}
});

if($("#topRtNav3 li").length > 0){
	$("#triangle3").css('visibility','visible');	
}
else{
	$("#triangle3").css('visibility','hidden');
	$("#topRtNav3 #selectedCountry").attr("href","//www.agilent.com/home/more-countries");
	
}
/* End of Code Addition for Sapphire CR */
$(".highlightOne:last").addClass("lastHighlight");

$(".bxslider li:first-child").attr("target","_blank");

//Function for Preloading he images
$(function preload(){	
	var countryCode=$.cookie("CountryCode");
	if(countryCode=='US'){
	img1 = new Image();
    	img1.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_EN_normal.png";
    	img2 = new Image();
    	img2.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_EN_hover.png";
	}
	else if(countryCode=='CN'){
	img1 = new Image();
    	img1.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_CH_normal.png";
    	img2 = new Image();
    	img2.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_CH_hover.png";
	}
	else if(countryCode=='TW'){
	img1 = new Image();
    	img1.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_TW_normal.png";
    	img2 = new Image();
    	img2.src = "//"+prodURLDomain+"/cs/home_images/btn_more_TW_hover.png";
	}
	else if(countryCode=='JP'){
	img1 = new Image();
    	img1.src = "//"+prodURLDomain+"/cs/home_images/btn_more_JP_normal.png";
    	img2 = new Image();
    	img2.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_JP_hover.png";
	}
	else if(countryCode=='KR'){
	img1 = new Image();
    	img1.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_KR_normal.png";
    	img2 = new Image();
    	img2.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_KR_hover.png";
	}
	else if(countryCode=='VN'){
	img1 = new Image();
    	img1.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_VT_normal.png";
    	img2 = new Image();
    	img2.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_VT_hover.png";
	}
	else if(countryCode=='BR'){
	img1 = new Image();
    	img1.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_PT-BR_normal.png";
    	img2 = new Image();
    	img2.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_PT-BR_hover.png";
	}
	else if(countryCode=='RU'){
	img1 = new Image();
    	img1.src = "//"+prodURLDomain+"/cs/home_images/btn_more_RU_normal.png";
    	img2 = new Image();
    	img2.src = "//"+prodURLDomain+"/cs/home_images/btn_more_RU_hover.png";
	}
	else if(countryCode=='DE'){
	img1 = new Image();
    	img1.src = "//"+prodURLDomain+"/cs/home_images/btn_more_DE_normal.png";
    	img2 = new Image();
    	img2.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_DE_hover.png";
	}
	else if(countryCode=='FR'){
	img1 = new Image();
    	img1.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_FR_normal.png";
    	img2 = new Image();
    	img2.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_FR_hover.png";
	}
	else if(countryCode=='ES'){
	img1 = new Image();
    	img1.src = "//"+prodURLDomain+"/cs/home_images/btn_more_ES_normal.png";
    	img2 = new Image();
    	img2.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_ES_hover.png";
	}
	else if(countryCode=='IT'){
	img1 = new Image();
    	img1.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_IT_normal.png";
    	img2 = new Image();
    	img2.src = "//"+prodURLDomain+"/cs/home_images/btn_more_IT_hover.png";
	}
	else{
	img1 = new Image();
    	img1.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_EN_normal.png";
    	img2 = new Image();
    	img2.src =  "//"+prodURLDomain+"/cs/home_images/btn_more_EN_hover.png";
	}	
});
 
if(isIosDevice)
{

$('.homeSearchBox').css('width', '310px');
$('.tt-dropdown-menu').css('width', '323px');
}

	$(function externalintegrations() {
		/* Start of Cart Integration */
		var mycartCnt=$.cookie("CartValue");

		if(mycartCnt==null){
			mycartCnt="0";
		}else if(mycartCnt>99 && mycartCnt<999){
			mycartCnt="99+";
		}else if(mycartCnt>999){
			mycartCnt="999+";
		} 
		
		document.getElementById("homeMainNav7").querySelector("p").innerHTML=mycartCnt;
		document.getElementById("homeMainNav7Fix").querySelector("p").innerHTML=mycartCnt;
		/* End of Cart Integration */
		
		/* To decide to have the language dropdown or not  */
		var myCountry = $.cookie("CountryCode");
		// get the count of languages supported by country
		var countryLocaleList = getLocaleListForCountry(myCountry);
		var countryLocaleSplit = countryLocaleList.split(',');
		var countryLocaleCnt = countryLocaleSplit.length;
				
		if(countryLocaleCnt==1){
		$("#topRtNav3Links").html(""); //remove content for country dropdown
			$("#triangle3").css('visibility','hidden');
			$("#topRtNav3 #selectedCountry").attr("href","//www.agilent.com/home/more-countries");
		}
		/* End of code block */
		/* Start of Login/MyAccount Integration */
		var loginUser = $.cookie(".ASPXAUTH");
		if(loginUser!=null){
			$("#topRtNav3Links li:last-child").hide();
			$("#topRtNav").html(""); // remove content for Login
			$("#topRtNav").hide(); // Hide Login
			$("#selectedCountry").attr("href","#");
			if(countryLocaleCnt==1){
			$("#topRtNav3 #selectedCountry").css("cursor","text");
			}
			$("#topRtNav").css("margin-left","0px"); 
			document.getElementById("topRtNav4Links").querySelector("p").querySelector("a").innerHTML=$.cookie("SEARCH_displayName");
			$("#topRtNav4").show();
			//$("#topRtNav3").html(""); //remove content for country dropdown
			//$("#topRtNav3").hide(); //hide country dropdown
			$("#topRtNav3").css("margin-left","10px"); 
			//$("#topRtNav0").html("<a>"+$.cookie("CountryName")+"</a>");
			//$("#topRtNav0").show();
			$("#footerNav1").show();
			$("#footerNav2").show();
			/* Start of PunchOut User Integration*/
			var isPunchOutUser = $.cookie("IPU");
			if(isPunchOutUser!=null){
				var punchoutVar = document.querySelectorAll(".punchout");
				for(loopcnt=0;loopcnt<punchoutVar.length;loopcnt++){
					var tmp = punchoutVar[loopcnt];
					tmp.querySelector("a").href="#";
					tmp.querySelector("a").style.cursor="auto";
				}
				$(".topRtNav4SubLinks [class*=moreButton]").hide();
				
			}
			/* End of PunchOut user Integration*/
		}else{
			$("#topRtNav4").html(""); // remove content for MyAccount
			$("#topRtNav4").hide(); // Hide MyAccount
			$("#topRtNav4").css("margin-left","0px"); 
			$("#topRtNav0").html(""); // remove content for country name
			$("#topRtNav0").hide(); // hide country name display
			$("#topRtNav0").css("margin-left: 0px;"); 
			$("#footerNav1").html(""); // remove content of Promotions & Offers in Footer
			$("#footerNav2").html(""); // remove content of Logout in Footer
		}
		/* End of Login/MyAccount Integration */
	});
	
	//Function For Herobanner

	setTimeout(function(){
	
		$('.heroBox').each( function(){ 
			var thisBox=$(this);
			
			if(thisBox.children().first().height()==43){
				thisBox.css('margin-top','344px');
				thisBox.css('height','105px');
			}else if(thisBox.children().first().height()==86){
				thisBox.css('margin-top','305px');
				thisBox.css('height','145px');
			}else if(thisBox.children().first().height()==129){
				thisBox.css('margin-top','260px');
				thisBox.css('height','190px');
			}else if(thisBox.children().first().height()==172){
				thisBox.css('margin-top','218px');
				thisBox.css('height','230px');
			}
			if($.cookie("CountryCode")=='FR'){
				thisBox.addClass("heroBoxFR");
			}
			if($.cookie("CountryCode")=='VN'){
				thisBox.addClass("heroBoxVN");
			}
			if($.cookie("CountryCode")=='JP'){
				thisBox.addClass("heroBoxJP");
			}	
			if($.cookie("CountryCode")=='RU' || $.cookie("CountryCode")=='BR' || $.cookie("CountryCode")=='DE' || $.cookie("CountryCode")=='IT')
			{
				thisBox.addClass("heroBoxRU");
				thisBox.children().first().css('max-height','144px');

				if(thisBox.children().first().height()==36){
					thisBox.css('margin-top','352px');
					thisBox.css('height','95px');
				}else if(thisBox.children().first().height()==70){
					thisBox.css('margin-top','318px');
					thisBox.css('height','130px');
				
				}else if(thisBox.children().first().height()==105){
					thisBox.css('margin-top','290px');
					thisBox.css('height','160px');
				
				}else if(thisBox.children().first().height()==140){
					thisBox.css('margin-top','248px');
					thisBox.css('height','200px');
					
				}
			}
		});
	},390);
	
	//script for showing the sub menus on clicking the menu links
	$(function handleMenuClicks() {
		$(".topRtNav ul li").click(function(e){
			
			if($(e.target)[0].id=="selectedCountry"){
			if($('#topRtNav3Links').children('li').length > 0){
                          e.preventDefault();
                	}
			}else if($(e.target)[0].children[0] ){
				if($(e.target)[0].children[0].className=="dropDownTriangle"){
					e.preventDefault();
				}
			}
			
			$(this).addClass('activeTopNav');
			$(this).siblings().removeClass('activeTopNav');
			$("#triangle1,#triangle4").css('visibility','visible');
			$("#topRtNav1Links,#topRtNav3Links,#topRtNav4Links").hide();
		});
		if (typeof scpl_time == "undefined") {
			$("#topRtNav1").on("click",function(){
				$("#topRtNav1Links").show();
				$("#triangle1").css('visibility','hidden');
			});
		}else{
			$("#topRtNav1").live("click",function(){
				$("#topRtNav1Links").show();
				$("#triangle1").css('visibility','hidden');
			});
		}		
		$("#topRtNav3").click(function(e){
			if($('#topRtNav3Links').children('li').length > 0) {
       		$("#topRtNav3Links").show();
			$("#triangle3").css('visibility','hidden');
			}		
		});
		$("#topRtNav4").click(function(e){
			$("#topRtNav4Links").show();
			$("#triangle4").css('visibility','hidden');
		});
		$("#triangle1").click(function(e){
			$("#topRtNav1Links").show();
			$("#triangle1").css('visibility','hidden');
			e.preventDefault();
		});
		$("#triangle3").click(function(e){
			if($('#topRtNav3Links').children('li').length > 0) {
			$("#topRtNav3Links").show();
			$("#triangle3").css('visibility','hidden');
			e.preventDefault();
			}
		});		$("#triangle4").click(function(e){
			$("#topRtNav4Links").show();
			$("#triangle4").css('visibility','hidden');
			e.preventDefault();
		});

	});
 
	$(function selectLanguage(){
		$("#topRtNav3Links li").click(function(e){
			if(($(this).attr("class").indexOf("moreButton"))==-1){
				if(($(this).attr("class").indexOf("currentLanguage"))==-1){
					e.stopPropagation();
					var languageTxt= $(this).text();
					var lang = $(this).attr('id');
					var locale = getLocaleFromLang(lang);
					$.cookie("agilent_locale",locale,{ path: '/', domain: '.agilent.com', expires: 90 });
					var currUrl = location.href;
					setTimeout(function(){
						location.href = currUrl;
					}, 100);
				}
			}else{
				location.href = $(this).find("a:first").attr("href");
			}			
		});
	});

	//script for showing the auto search box.
	$(function autoSearch() {
		$("#homeSearchTextBox").keydown(function(e){
			$("#homeAutoSearch").show();
		});	
		$("#homeAutoSearch li").click(function(e){
			var selectedTxt= $(this).text();
			$("#homeSearchTextBox").val(selectedTxt);
			 $("#homeAutoSearch").hide();
		});
		$('#homeSearchTextBox').click(function(e){
			this.value = '';
		});
	});

	//script for showing the sub menus on clicking the menu links
	$(function mainMenuClicks() {

		$("#homeMainNav ul li").click(function(e){

			if($(e.target).hasClass("megaMenuALink")){
				e.preventDefault();
			}
			$(this).addClass('activeSubLink');
			$(this).siblings().removeClass('activeSubLink');
			$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
		});	
		if (typeof scpl_time == "undefined") {

			$("#homeMainNav1" ).on("touchstart click",function(e){
  
				$("#homeMainNav1Links").show();
				menuSelected = "menu1"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
        	});			
			$("#homeMainNav2" ).on("touchstart click",function(){
				$("#homeMainNav2Links").show();
				menuSelected = "menu2"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
        	});
			$("#homeMainNav3" ).on("touchstart click",function(){
				$("#homeMainNav3Links").show();
			 	menuSelected = "menu3"; menuLeaveYes = false; menuLeaveFixYes = false;
            	$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
            	$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav4" ).on("touchstart click",function(){
				$("#homeMainNav4Links").show();
				menuSelected = "menu4"; menuLeaveYes = false;	menuLeaveFixYes = false;
            	$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav5Links,#homeMainNav6Links").hide();
            	$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
        	});
			$("#homeMainNav5" ).on("touchstart click",function(){
				$("#homeMainNav5Links").show();
				menuSelected = "menu5"; menuLeaveYes = false; menuLeaveFixYes = false;
            	$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav6Links").hide();
            	$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav6LinksFix").hide();
        	});
			$("#homeMainNav6" ).on("touchstart click",function(){
				$("#homeMainNav6Links").show();
				menuSelected = "menu6"; menuLeaveYes = false; menuLeaveFixYes = false;
            	$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links").hide();
            	$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix").hide();
        	});
			$("#homeMainNav7" ).on("touchstart click",function(){
				$("#homeMainNav7Links").show();
				$("#homeMainNav7").removeClass('activeSubLink');
			 	menuSelected = "menu7"; menuLeaveYes = false; menuLeaveFixYes = false;
            	$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
            	$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
        	});		
			
		}else{
			$("#homeMainNav1" ).live("touchstart click",function(){
				$("#homeMainNav1Links").show();
			   	menuSelected = "menu1"; menuLeaveFixYes = false; menuLeaveYes = false;
				$("#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav2" ).live("touchstart click",function(){
				$("#homeMainNav2Links").show();
			  	menuSelected = "menu2"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav3" ).live("touchstart click",function(){
				$("#homeMainNav3Links").show();
			  	menuSelected = "menu3"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav4" ).live("touchstart click",function(){
				$("#homeMainNav4Links").show();
			   	menuSelected = "menu4"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
			});
			$("#homeMainNav5" ).live("touchstart click",function(){
				$("#homeMainNav5Links").show();
			 	menuSelected = "menu5"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav6LinksFix").hide();
       		 });
			$("#homeMainNav6" ).live("touchstart click",function(){
				$("#homeMainNav6Links").show();
			  	menuSelected = "menu6"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix").hide();
        		});
			$("#homeMainNav7" ).live("touchstart click",function(){
				$("#homeMainNav7Links").show();
				$("#homeMainNav7").removeClass('activeSubLink');
			 	menuSelected = "menu7"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
        	});	
		}	
	});

	//script for showing the sticky sub menus
	$(function mainMenuClicksFix() {
		$("#homeMainNavFix ul li").click(function(e){
			if($(e.target).hasClass("megaMenuALink")){
                e.preventDefault();
			}
			$(this).addClass('activeSubLinkFix');
			$(this).siblings().removeClass('activeSubLinkFix');
			$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
		});
		if (typeof scpl_time == "undefined") {
			$("#homeMainNav1Fix" ).on("touchstart click",function(){
				$("#homeMainNav1LinksFix").show();
			   	menuSelected = "menu1"; menuLeaveFixYes = false; menuLeaveYes = false;
				$("#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
			});
			$("#homeMainNav2Fix" ).on("touchstart click",function(){
				$("#homeMainNav2LinksFix").show();
				menuSelected = "menu2"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav3Fix" ).on("touchstart click",function(){
				$("#homeMainNav3LinksFix").show();
				menuSelected = "menu3"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav4Fix" ).on("touchstart click",function(){
				$("#homeMainNav4LinksFix").show();
				menuSelected = "menu4"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav5Fix" ).on("touchstart click",function(){
				$("#homeMainNav5LinksFix").show();
				menuSelected = "menu5"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav6Fix" ).on("touchstart click",function(){
				$("#homeMainNav6LinksFix").show();
				menuSelected = "menu6"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix").hide();
       		});
			$("#homeMainNav7Fix" ).on("touchstart click",function(){
				$("#homeMainNav7LinksFix").show();
				$("#homeMainNav7Fix").removeClass('activeSubLinkFix');
			   	menuSelected = "menu7"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});			
			
		}else{
			$("#homeMainNav1Fix" ).live("touchstart click",function(){
				$("#homeMainNav1LinksFix").show();
			   	menuSelected = "menu1"; menuLeaveFixYes = false; menuLeaveYes = false;
				$("#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav2Fix" ).live("touchstart click",function(){
				$("#homeMainNav2LinksFix").show();
				menuSelected = "menu2"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav3Fix" ).live("touchstart click",function(){
				$("#homeMainNav3LinksFix").show();
				menuSelected = "menu3"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav4Fix" ).live("touchstart click",function(){
				$("#homeMainNav4LinksFix").show();
				menuSelected = "menu4"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav5Fix" ).live("touchstart click",function(){
				$("#homeMainNav5LinksFix").show();
				menuSelected = "menu5"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav6LinksFix").hide();
       		});
			$("#homeMainNav6Fix" ).live("touchstart click",function(){
				$("#homeMainNav6LinksFix").show();
				menuSelected = "menu6"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix").hide();
       		});
			$("#homeMainNav7Fix" ).live("touchstart click",function(){
				$("#homeMainNav7LinksFix").show();
				$("#homeMainNav7Fix").removeClass('activeSubLinkFix');
			   	menuSelected = "menu7"; menuLeaveYes = false; menuLeaveFixYes = false;
				$("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
				$("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
       	 	});	
		}	
	});

	//script for hide the menus on moving the mouse out.
	$("#topRtNav1").mouseleave(function() {
		$("#topRtNav1Links").hide(); 
		$(".topRtNav ul li").removeClass('activeTopNav');
		$("#triangle1").css('visibility','visible');
	});
	$("#topRtNav3").mouseleave(function() {
		$("#topRtNav3Links").hide(); 
		$(".topRtNav ul li").removeClass('activeTopNav');	
		if($('#topRtNav3Links').children('li').length > 0) {
		   $("#triangle3").css('visibility','visible');
		}
		else{
			 $("#triangle3").css('visibility','hidden');
		}
	});
	$("#topRtNav4").mouseleave(function() {
		$("#topRtNav4Links").hide(); 
		$(".topRtNav ul li").removeClass('activeTopNav');	
		$("#triangle4").css('visibility','visible');
	});
	
	//script for hide the menus on moving the mouse out.

if(isIosDevice)
{

$(document).on('click',function(event) { 
    if(!$(event.target).closest('#homeMainNav ul li ').length) {
     $("#homeMainNav1Links,#homeMainNav2Links,#homeMainNav3Links,#homeMainNav4Links,#homeMainNav5Links,#homeMainNav6Links").hide();
     $("#homeMainNav ul li").removeClass('activeSubLink');
	deviceMegaMenuLeave=true;        }
      else{
       deviceMegaMenuLeave=false;   
	}		     
});
}
else
{
	if (typeof scpl_time == "undefined") {
		$("#homeMainNav1" ).on("mouseleave",function(){
			$("#homeMainNav1Links").hide(); 
			$("#homeMainNav ul li").removeClass('activeSubLink');	
			mouseLeaveMainHeader();
		});
	}else{
		$("#homeMainNav1" ).live("mouseleave",function(){
		  $("#homeMainNav1Links").hide(); 
			$("#homeMainNav ul li").removeClass('activeSubLink');	
               mouseLeaveMainHeader();
		});
	}

	$("#homeMainNav2").mouseleave(function() {
		$("#homeMainNav2Links").hide(); 
		$("#homeMainNav ul li").removeClass('activeSubLink');	
	mouseLeaveMainHeader();
	});
	$("#homeMainNav3").mouseleave(function() {
		$("#homeMainNav3Links").hide(); 
		$("#homeMainNav ul li").removeClass('activeSubLink');	
	mouseLeaveMainHeader();
	});
	$("#homeMainNav4").mouseleave(function() {
		$("#homeMainNav4Links").hide(); 
		$("#homeMainNav ul li").removeClass('activeSubLink');	
	mouseLeaveMainHeader();
	});
	$("#homeMainNav5").mouseleave(function() {
		$("#homeMainNav5Links").hide(); 
		$("#homeMainNav ul li").removeClass('activeSubLink');	
	mouseLeaveMainHeader();
	});
	$("#homeMainNav6").mouseleave(function() {
		$("#homeMainNav6Links").hide(); 
		$("#homeMainNav ul li").removeClass('activeSubLink');	
	mouseLeaveMainHeader();
	});
}	

if(isIosDevice)
{
$(document).on('click',function(event) { 

    if(!$(event.target).closest('#homeMainNavFix ul li').length) {

     $("#homeMainNav1LinksFix,#homeMainNav2LinksFix,#homeMainNav3LinksFix,#homeMainNav4LinksFix,#homeMainNav5LinksFix,#homeMainNav6LinksFix").hide();
     $("#homeMainNavFix ul li").removeClass('activeSubLinkFix');	
	deviceMegaMenuLeave=true;        }
      else{
       deviceMegaMenuLeave=false;   
	}
});
}
else
{
	//For sticky menu mouse out
	$("#homeMainNav1Fix").mouseleave(function() {
		$("#homeMainNav1LinksFix").hide(); 
		$("#homeMainNavFix ul li").removeClass('activeSubLinkFix');	
		mouseLeaveStickyHeader();
	});
	$("#homeMainNav2Fix").mouseleave(function() {
		$("#homeMainNav2LinksFix").hide(); 
		$("#homeMainNavFix ul li").removeClass('activeSubLinkFix');	
		mouseLeaveStickyHeader();
	});
	$("#homeMainNav3Fix").mouseleave(function() {
		$("#homeMainNav3LinksFix").hide(); 
		$("#homeMainNavFix ul li").removeClass('activeSubLinkFix');	
		mouseLeaveStickyHeader();
	});
	$("#homeMainNav4Fix").mouseleave(function() {
		$("#homeMainNav4LinksFix").hide(); 
		$("#homeMainNavFix ul li").removeClass('activeSubLinkFix');	
		mouseLeaveStickyHeader();
	});
	$("#homeMainNav5Fix").mouseleave(function() {
		$("#homeMainNav5LinksFix").hide(); 
		$("#homeMainNavFix ul li").removeClass('activeSubLinkFix');	
		mouseLeaveStickyHeader();
	});
	$("#homeMainNav6Fix").mouseleave(function() {
		$("#homeMainNav6LinksFix").hide(); 
		$("#homeMainNavFix ul li").removeClass('activeSubLinkFix');
		mouseLeaveStickyHeader();	
	});
}

	//mouse Leave for main header
   	 function mouseLeaveMainHeader() {
            if ($(window).scrollTop() == 0) {
                menuLeaveYes = true;
                menuLeaveFixYes = true;
            } else {
                menuLeaveYes = false;
                menuLeaveFixYes = false;
            }
        }
        //mouse Leave for main header

   	 function mouseLeaveStickyHeader() {
            if ($(window).scrollTop() > 0) {

                if ($(window).scrollTop() == scrollPosFix) {

                    menuLeaveFixYes = true;
                    menuLeaveYes = true;
                } else {
                    menuLeaveYes = false;
                    menuLeaveFixYes = false;
                }
            } else {
                menuLeaveYes = false;
                menuLeaveFixYes = false;
            }
            scrollPosFix = $(window).scrollTop();
        }

	if (typeof scpl_time == "undefined") {
		$("#searchinput").on('keyup', function(event){
			if(event.keyCode==13){
				//submitSearch();
				doSearch();
			}
		}); 
	}else{
		$("#searchinput").live('keyup', function(event){
			if(event.keyCode==13){
				//submitSearch();
				doSearch();
			}
		}); 
	}	
	
	if (typeof scpl_time == "undefined") {
		$("#searchForm").on('submit', function(e){
			doSearch();
		});
	}else{
		$("#searchForm").live('submit', function(e){
			doSearch();
		});
	}

	$(".twitter-typeahead").css("position","relative");
	$(".twitter-typeahead").css("display","block","important");
	$(".searchform").removeClass('pull-left');

	//script for hiding the mega menu on scroll.

	if (typeof scpl_time == "undefined") {
		$(window).on("scroll", function() {
          
	   if ($(this).scrollTop()) {

			/*if(scrollPosFix==0)
			{
			stickyHeaderTop=$("#homeMainNavFix").offset().top;
			if((mouseTop+$(this).scrollTop())>(stickyHeaderTop+layoutHeight))
			{
			menuLeaveYes=true;
        		menuLeaveFixYes=true;
			}
			}*/
				$("#homeHeaderDiv").fadeIn(1);
				$("#homeMainNavFix").show();
				$("#homeMainNav").hide();
				$("#homeMainNavFixWraper").show();
			if(isIosDevice)
			{

			if(deviceMegaMenuLeave)
				{
				menuLeaveYes=true;
				}
			else{
				menuLeaveYes=false;
				}
			}

			if (menuLeaveYes) {
				menuSelected = "";
				$("#homeMainNav1LinksFix").hide();
				$("#homeMainNav2LinksFix").hide();
				$("#homeMainNav3LinksFix").hide();
				$("#homeMainNav4LinksFix").hide();
				$("#homeMainNav5LinksFix").hide();
				$("#homeMainNav6LinksFix").hide();
				menuLeaveYes = false;
				menuLeaveFixYes = false;
			}
			if (menuSelected == "menu1") {
				$("#homeMainNav1LinksFix").show();
				$("#homeMainNav1Fix").addClass('activeSubLinkFix');
				$("#homeMainNav1Fix").siblings().removeClass('activeSubLinkFix');
			} else if (menuSelected == "menu2") {
				$("#homeMainNav2LinksFix").show();
				$("#homeMainNav2Fix").addClass('activeSubLinkFix');
				$("#homeMainNav2Fix").siblings().removeClass('activeSubLinkFix');
			} else if (menuSelected == "menu3") {
				$("#homeMainNav3LinksFix").show();
				$("#homeMainNav3Fix").addClass('activeSubLinkFix');
				$("#homeMainNav3Fix").siblings().removeClass('activeSubLinkFix');
			} else if (menuSelected == "menu4") {
				$("#homeMainNav4LinksFix").show();
				$("#homeMainNav4Fix").addClass('activeSubLinkFix');
				$("#homeMainNav4Fix").siblings().removeClass('activeSubLinkFix');
			} else if (menuSelected == "menu5") {
				$("#homeMainNav5LinksFix").show();
				$("#homeMainNav5Fix").addClass('activeSubLinkFix');
				$("#homeMainNav5Fix").siblings().removeClass('activeSubLinkFix');
			} else if (menuSelected == "menu6") {
				$("#homeMainNav6LinksFix").show();
				$("#homeMainNav6Fix").addClass('activeSubLinkFix');
				$("#homeMainNav6Fix").siblings().removeClass('activeSubLinkFix');
			} else if (menuSelected == "menu7") {
				$("#homeMainNav7LinksFix").show();
				$("#homeMainNav7Fix").addClass('activeSubLinkFix');
				$("#homeMainNav7Fix").siblings().removeClass('activeSubLinkFix');
			}
	   } 

	   else {
			if(mouseTop < mainHeaderTop)
			{
			menuLeaveYes=true;
			menuLeaveFixYes=true;
			}
			$("#homeMainNavFix").fadeOut(1);
			$("#homeHeaderDiv").show();
			$("#homeMainNav").show();
			$("#homeMainNavFixWraper").hide();
			if(isIosDevice)
			{

			if(deviceMegaMenuLeave)
				{
				menuLeaveFixYes=true;
				}
			else{
				menuLeaveFixYes=false;
				}
			}
                   if (menuLeaveFixYes) {
                	menuSelected = "";
                	$("#homeMainNav1Links").hide();
                	$("#homeMainNav2Links").hide();
                	$("#homeMainNav3Links").hide();
                	$("#homeMainNav4Links").hide();
               	$("#homeMainNav5Links").hide();
                	$("#homeMainNav6Links").hide();
                	menuLeaveFixYes = false;
                	menuLeaveYes = false;
            	}					 
		
            if (menuSelected == "menu1") {
                $("#homeMainNav1Links").show();
                $("#homeMainNav1").addClass('activeSubLink');
                $("#homeMainNav1").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu2") {
                $("#homeMainNav2Links").show();
                $("#homeMainNav2").addClass('activeSubLink');
                $("#homeMainNav2").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu3") {
                $("#homeMainNav3Links").show();
                $("#homeMainNav3").addClass('activeSubLink');
                $("#homeMainNav3").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu4") {
                $("#homeMainNav4Links").show();
                $("#homeMainNav4").addClass('activeSubLink');
                $("#homeMainNav4").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu5") {
                $("#homeMainNav5Links").show();
                $("#homeMainNav5").addClass('activeSubLink');
                $("#homeMainNav5").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu6") {
                $("#homeMainNav6Links").show();
                $("#homeMainNav6").addClass('activeSubLink');
                $("#homeMainNav6").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu6") {
                $("#homeMainNav7Links").show();
                $("#homeMainNav7").addClass('activeSubLink');
                $("#homeMainNav7").siblings().removeClass('activeSubLink');
            }
         }
		scrollPosFix = $(window).scrollTop();
		});
	}
       else{
		
              $(window).bind("scroll", function() {

		if ($(this).scrollTop()) {
		
				/*if(scrollPosFix==0)
			{
			stickyHeaderTop=$("#homeMainNavFix").offset().top;
			if((mouseTop+$(this).scrollTop())>(stickyHeaderTop+layoutHeight))
			{
			menuLeaveYes=true;
        		menuLeaveFixYes=true;
			}
			}*/
				$("#homeHeaderDiv").fadeIn(1);
				$("#homeMainNavFix").show();
				$("#homeMainNav").hide();
				$("#homeMainNavFixWraper").show();
		if (menuLeaveYes) {
                		menuSelected = "";
                		$("#homeMainNav1LinksFix").hide();
                		$("#homeMainNav2LinksFix").hide();
               		$("#homeMainNav3LinksFix").hide();
                		$("#homeMainNav4LinksFix").hide();
                		$("#homeMainNav5LinksFix").hide();
                		$("#homeMainNav6LinksFix").hide();
                		menuLeaveYes = false;
                		menuLeaveFixYes = false;
            	}
            if (menuSelected == "menu1") {
                $("#homeMainNav1LinksFix").show();
                $("#homeMainNav1Fix").addClass('activeSubLinkFix');
                $("#homeMainNav1Fix").siblings().removeClass('activeSubLinkFix');
            } else if (menuSelected == "menu2") {
                $("#homeMainNav2LinksFix").show();
                $("#homeMainNav2Fix").addClass('activeSubLinkFix');
                $("#homeMainNav2Fix").siblings().removeClass('activeSubLinkFix');
            } else if (menuSelected == "menu3") {
                $("#homeMainNav3LinksFix").show();
                $("#homeMainNav3Fix").addClass('activeSubLinkFix');
                $("#homeMainNav3Fix").siblings().removeClass('activeSubLinkFix');
            } else if (menuSelected == "menu4") {
                $("#homeMainNav4LinksFix").show();
                $("#homeMainNav4Fix").addClass('activeSubLinkFix');
                $("#homeMainNav4Fix").siblings().removeClass('activeSubLinkFix');
            } else if (menuSelected == "menu5") {
                $("#homeMainNav5LinksFix").show();
                $("#homeMainNav5Fix").addClass('activeSubLinkFix');
                $("#homeMainNav5Fix").siblings().removeClass('activeSubLinkFix');
            } else if (menuSelected == "menu6") {
                $("#homeMainNav6LinksFix").show();
                $("#homeMainNav6Fix").addClass('activeSubLinkFix');
                $("#homeMainNav6Fix").siblings().removeClass('activeSubLinkFix');
            } else if (menuSelected == "menu7") {
                $("#homeMainNav7LinksFix").show();
                $("#homeMainNav7Fix").addClass('activeSubLinkFix');
                $("#homeMainNav7Fix").siblings().removeClass('activeSubLinkFix');
            }
		} else {
			
			if(mouseTop < mainHeaderTop)
			{			
			menuLeaveYes=true;
			menuLeaveFixYes=true;
			}
            		$("#homeMainNavFix").fadeOut(1);
            		$("#homeHeaderDiv").show();
            		$("#homeMainNav").show();
            		$("#homeMainNavFixWraper").hide();
              	if (menuLeaveFixYes) {
                	menuSelected = "";
                	$("#homeMainNav1Links").hide();
                	$("#homeMainNav2Links").hide();
                	$("#homeMainNav3Links").hide();
                	$("#homeMainNav4Links").hide();
                	$("#homeMainNav5Links").hide();
               	$("#homeMainNav6Links").hide();
               	menuLeaveFixYes = false;
                	menuLeaveYes = false;
            		}					 
		
            if (menuSelected == "menu1") {
                $("#homeMainNav1Links").show();
                $("#homeMainNav1").addClass('activeSubLink');
                $("#homeMainNav1").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu2") {
                $("#homeMainNav2Links").show();
                $("#homeMainNav2").addClass('activeSubLink');
                $("#homeMainNav2").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu3") {
                $("#homeMainNav3Links").show();
                $("#homeMainNav3").addClass('activeSubLink');
                $("#homeMainNav3").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu4") {
                $("#homeMainNav4Links").show();
                $("#homeMainNav4").addClass('activeSubLink');
                $("#homeMainNav4").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu5") {
                $("#homeMainNav5Links").show();
                $("#homeMainNav5").addClass('activeSubLink');
                $("#homeMainNav5").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu6") {
                $("#homeMainNav6Links").show();
                $("#homeMainNav6").addClass('activeSubLink');
                $("#homeMainNav6").siblings().removeClass('activeSubLink');
            } else if (menuSelected == "menu6") {
                $("#homeMainNav7Links").show();
                $("#homeMainNav7").addClass('activeSubLink');
                $("#homeMainNav7").siblings().removeClass('activeSubLink');
            }
        }
		scrollPosFix = $(window).scrollTop();
		});
	}	
	
	/*
	if (typeof scpl_time != "undefined") {
		document.querySelectorAll(".homeSearchImg")[0].querySelectorAll("a")[0].href="javascript:submitSearch();";
	}
	*/
/*----for sticky header scroll alignment----*/
if (typeof scpl_time == "undefined") {
	$(window).on('scroll',
		function(e){
			$('#homeMainNavFix').css('left',-window.scrollX);
	});	
}else{
	$(window).bind('scroll',
		function(e){
			$('#homeMainNavFix').css('left',-window.scrollX);
    });	
}
/*----End doc. ready----*/

}); 

function doLogout(){
	$.cookie("logOutATG","atglogoutsuccess");
	setTimeout(function(){
		location.href = "//"+prodCosURLDomain+"/store/logoutUser.jsp";	
	}, 100);	
	
}

function doLogin(){
	var LoginUrl;
	var currPageUrl = location.href;
	if(currPageUrl.indexOf("ContentServer")>-1){
		currPageUrl = currPageUrl.replace(/&/g,"%26");
		LoginUrl = "//"+prodCosURLDomain+"/common/login.jsp"+"?ReturnURL="+currPageUrl;		
	}
	if(currPageUrl.indexOf("DPSLogout=true")>-1)
                {
                var index=currPageUrl.indexOf("DPSLogout=true");
                currPageUrl=currPageUrl.substring(0,index-1);
                }
	if(currPageUrl.indexOf("genomics.agilent.com")>-1){
		if(currPageUrl.indexOf(genomicsDomain)>-1){
			LoginUrl = "//"+genomicsDomain+"/common/login.jsp"+"?ReturnURL="+currPageUrl;
		}else{
			LoginUrl = "//"+genomicsDomain+"/common/login.jsp"+"?ReturnURL="+currPageUrl;
		}
	}else{
		LoginUrl = "//"+prodCosURLDomain+"/common/login.jsp"+"?ReturnURL="+currPageUrl;
	}
	location.href = LoginUrl;
}

var moreCountryUrlIdentifier = "home/more-countries";
function setHomePageCookies(HomeCountryCode,HmPageLocale,ccParam){
	var currentPageUrl = location.href;
	if(currentPageUrl.indexOf(moreCountryUrlIdentifier)==-1){
		var tempPageUrlWithoutCC = removeParamValFromUrl(currentPageUrl,"?cc=");
		$.cookie("currPageURL",tempPageUrlWithoutCC,{ path: '/', domain: '.agilent.com', expires: 90 });
	}
	if(HomeCountryCode=="US-DEFAULT" || HomeCountryCode==null || HomeCountryCode=="null"){
		//HomeCountryName = "United States";
		HomeCountryName = "Select Country";
		//$.cookie("CountryCode","US",{ path: '/', domain: '.agilent.com', expires: 90 });
		$.cookie("CountryName",HomeCountryName,{ path: '/', domain: '.agilent.com', expires: 90 });
		//$.cookie("agilent_locale","en_US",{ path: '/', domain: '.agilent.com', expires: 90 });
		//$.cookie("AG_LOCALE","USeng",{ path: '/', domain: '.agilent.com', expires: 90 });
	}else{
		var cntrycde=$.cookie("CountryCode");
		//if(cntrycde==null){
				$.cookie("CountryCode",HomeCountryCode,{ path: '/', domain: '.agilent.com', expires: 90 });
		//}
		if(isValidLocaleForCountry(HomeCountryCode,HmPageLocale)){
			defaultLocale = HmPageLocale;
		}else{
			var LocaleList = getLocaleListForCountry(HomeCountryCode);
			var defaultLocale;
			if(LocaleList==null){
				defaultLocale = "en_US";
			}else{
				var LocaleSplit = LocaleList.split(',');
				defaultLocale = LocaleSplit[0];
			}
		}
		$.cookie("agilent_locale",defaultLocale,{ path: '/', domain: '.agilent.com', expires: 90 });
		len = countryName.length;

		for( var i = 0; i < len; i++ ) {
			if( countryName[i][0] == HomeCountryCode ) {
				HomeCountryName = countryName[i][1];
				break;
			}
		}

		var agLang = defaultLocale.split("_")[0];
		var agLocale = "DEFAULT_VALUE";	
		len = agLocaleArray.length;
		for( var i = 0; i < len; i++ ) {
			if( agLocaleArray[i][0] == agLang ) {
				agLocale = agLocaleArray[i][1];
				break;
			}
		}

		if(agLocale=="DEFAULT_VALUE"){
			agLocale = HomeCountryCode+"eng";
		}else{
			agLocale = HomeCountryCode + agLocale;
		}		
		
		$.cookie("AG_LOCALE",agLocale,{ path: '/', domain: '.agilent.com', expires: 90 });
		$.cookie("CountryName",HomeCountryName,{ path: '/', domain: '.agilent.com', expires: 90 });

	}
}

function submitSearch(){
	doSearch();

}

function doSearch(){
	var currentPageURL = location.href;
	var homeLocale=$.cookie("agilent_locale");
	var SearchUrl ;
	if(currentPageURL.indexOf(prodCosURLDomain)>0 || currentPageURL.indexOf(prodCNURLDomain)>0 || currentPageURL.indexOf(prodURLDomain)>0 || currentPageURL.indexOf(genomicsDomain)>0){
		if(homeLocale!=null && homeLocale=="zh_CN"){
			SearchUrl = "//"+prodCNURLDomain+"/search/?Ntt="+encodeURIComponent($("#searchinput").val());
		}else{
			SearchUrl = "//"+prodCosURLDomain+"/search/?Ntt="+encodeURIComponent($("#searchinput").val());
		}
	}else{
		//SearchUrl = "/search/?Ntt="+encodeURIComponent($("#searchinput").val());
		SearchUrl = "//"+prodCosURLDomain+"/search/?Ntt="+encodeURIComponent($("#searchinput").val());
	}
	location.href = SearchUrl;                 
}

function setCookies(cntrycode,lang){
	
	$.cookie("CountryCode",cntrycode,{ path: '/', domain: '.agilent.com', expires: 90 });
	var cnt = langLocale.length;
	var agilentLocale = "DEFAULT_VALUE";
	for( var i = 0; i < cnt; i++ ) {
		if( langLocale[i][0] == lang ) {
			agilentLocale = langLocale[i][1];
			break;
		}
	}
	if(agilentLocale=="DEFAULT_VALUE")
		agilentLocale = "en_US";
	
	$.cookie("agilent_locale",agilentLocale,{ path: '/', domain: '.agilent.com', expires: 90 });
	cnt = agLocaleArray.length;
	var agLocale = "DEFAULT_VALUE";
	for( var i = 0; i < cnt; i++ ) {
		if( agLocaleArray[i][0] == lang ) {
			agLocale = agLocaleArray[i][1];
			break;
		}
	}
	if(agLocale=="DEFAULT_VALUE"){
		agLocale = cntrycode+"eng";
	}else{
		agLocale = cntrycode + agLocale;
	}
	$.cookie("AG_LOCALE",agLocale,{ path: '/', domain: '.agilent.com', expires: 90 });
	
	var currPageUrlCookie = $.cookie("currPageURL");
	
	var tempCurrPageURL;
	
	if(cntrycode=="CN"){
		tempCurrPageURL = currPageUrlCookie;
		if(tempCurrPageURL!=null && tempCurrPageURL.indexOf(prodCosURLDomain)>0){
			currPageUrlCookie = tempCurrPageURL.replace(prodCosURLDomain,prodCNURLDomain);	
		}
	}else{
		tempCurrPageURL = currPageUrlCookie;
		if(tempCurrPageURL!=null && tempCurrPageURL.indexOf(prodCNURLDomain)>0){
			currPageUrlCookie = tempCurrPageURL.replace(prodCNURLDomain,prodCosURLDomain);	
		}
	}
	
	if(currPageUrlCookie==null){
		currPageUrlCookie = "//www.agilent.com/home"; 	
	}
	setTimeout(function(){
		location.href = currPageUrlCookie; 	
    }, 100);	
}

var CountryLocaleMap = {"AL":"en_US","DZ":"en_US","AO":"en_US","AR":"es_ES,en_US","AM":"en_US","AW":"en_US","AU":"en_US","AT":"de_DE,en_US","AZ":"en_US","BH":"en_US","BD":"en_US","BY":"ru_RU,en_US","BE":"fr_FR,en_US,de_DE","BZ":"es_ES,en_US","BJ":"en_US","BO":"es_ES,en_US","BA":"en_US","BW":"en_US","BR":"pt_BR,en_US","BN":"en_US","BG":"en_US","BF":"en_US","BI":"en_US","CM":"en_US","CA":"en_US,fr_FR","CF":"en_US","TD":"en_US","CL":"es_ES,en_US","CN":"zh_CN,en_US","CO":"es_ES,en_US","CD":"en_US","CG":"en_US","CR":"es_ES,en_US","HR":"en_US","CY":"en_US","CZ":"en_US","DK":"en_US","DJ":"en_US","DO":"es_ES,en_US","EC":"es_ES,en_US","EG":"en_US","SV":"es_ES,en_US","GQ":"en_US","ER":"en_US","EE":"en_US","ET":"en_US","FI":"en_US","FR":"fr_FR,en_US","GA":"en_US","GM":"en_US","GE":"en_US","DE":"de_DE,en_US","GH":"en_US","GR":"en_US","GT":"es_ES,en_US","GN":"en_US","GW":"en_US","HN":"es_ES,en_US","HK":"en_US,zh_CN","HU":"en_US","IS":"en_US","IN":"en_US","ID":"en_US","IQ":"en_US","IE":"en_US","IL":"en_US","IT":"it_IT,en_US","CI":"en_US","JP":"ja_JP,en_US","JO":"en_US","KZ":"ru_RU,en_US","KE":"en_US","KR":"ko_KR,en_US","KW":"en_US","KG":"ru_RU,en_US","LV":"en_US","LB":"en_US","LS":"en_US","LR":"en_US","LY":"en_US","LT":"en_US","LU":"fr_FR,en_US","MK":"en_US","MG":"en_US","MW":"en_US","MY":"en_US","ML":"en_US","MT":"en_US","MR":"en_US","MU":"en_US","MX":"es_ES,en_US","MD":"en_US","ME":"en_US","MA":"en_US","MZ":"en_US","NA":"en_US","NL":"en_US","NZ":"en_US","NI":"es_ES,en_US","NE":"en_US","NG":"en_US","NO":"en_US","OM":"en_US","PK":"en_US","PA":"es_ES,en_US","PY":"es_ES,en_US","PE":"es_ES,en_US","PH":"en_US","PL":"en_US","PT":"pt_BR,en_US","PR":"es_ES,en_US","QA":"en_US","RO":"en_US","RU":"ru_RU,en_US","RW":"en_US","SA":"en_US","SN":"en_US","RS":"en_US","SC":"en_US","SL":"en_US","SG":"en_US","SK":"en_US","SI":"en_US","SO":"en_US","ZA":"en_US","ES":"es_ES,en_US","LK":"en_US","SZ":"en_US","SE":"en_US","CH":"de_DE,fr_FR,it_IT,en_US","TW":"en_US,zh_CN","TJ":"ru_RU,en_US","TZ":"en_US","TH":"en_US","TG":"en_US","TN":"en_US","TR":"en_US","TM":"ru_RU,en_US","UG":"en_US","UA":"ru_RU,en_US","AE":"en_US","GB":"en_US","US":"en_US","UY":"es_ES,en_US","UZ":"en_US","VE":"es_ES,en_US","VN":"vi_VN,en_US","YE":"en_US","ZM":"en_US","ZW":"en_US"};

function getLocaleListForCountry(countrycode){
	if(CountryLocaleMap[countrycode] != null){
		return CountryLocaleMap[countrycode];
	}else{
		return "en_US";
	}	
}
function removeParamValFromUrl(currentUrl,paramToRemove){
	if(currentUrl.indexOf(paramToRemove)>0){
		var tempStrFirstPart = currentUrl.substr(0,currentUrl.indexOf(paramToRemove));
		if(currentUrl.indexOf("?cc=")+7<currentUrl.length){
			var tempStrSecondPart = currentUrl.substr(currentUrl.indexOf(paramToRemove)+7,currentUrl.length);
		}
		if(tempStrSecondPart){
			currentUrl = tempStrFirstPart+"?"+tempStrSecondPart; 
		}else{
			currentUrl = tempStrFirstPart; 
		}
	}
	return currentUrl;
}
function isValidLocaleForCountry(countrycode,locale){
	var localeList = getLocaleListForCountry(countrycode);
	var localeSplit = localeList.split(',');
	var cnt = localeSplit.length;
	for(i=0;i<cnt;i++){
		if(localeSplit[i]==locale){
			return true;
		}
	}
	return false;
}

function getLocaleFromLang(lang){
	var cnt = langLocale.length;
	var locale = "en_US";
	for( var i = 0; i < cnt; i++ ) {
		if( langLocale[i][0] == lang ) {
			locale = langLocale[i][1];
			break;		
		}
	}
	return locale;
}

function buildLanguageDropdown(){
	
	var cntrycode=$.cookie("CountryCode");
	var currlocale=$.cookie("agilent_locale");
	if(currlocale==null){
		currlocale = "en_US";
	}
	
	var tmp=currlocale.split("_");
	var currlang = tmp[0];

	var cnt = lang.length;
	var currLangTxt = "English";
	for( var i = 0; i < cnt; i++ ) {
		if( lang[i][0] == currlang ) {
			currLangTxt = lang[i][1];
			break;
		}
	}

	var localeList = getLocaleListForCountry(cntrycode);
	var localeSplit = localeList.split(',');
	var cnt = localeSplit.length;
	for(i=0;i<cnt;i++){
		var loopingLang = localeSplit[i].split("_"); 
		var loopingLangTxt = getLangTextFromCode(loopingLang[0]);
		if(loopingLang[0]==currlang){
			// the user is already in current language, so display this as a disabled language
			document.write("<li id='"+loopingLang[0]+"' class='currentLanguage'><a data-link-name='"+loopingLangTxt+"' style='color: #ccc !important;cursor:default;text-decoration:none !important;' >"+loopingLangTxt+"</a></li>");
		}else{
			document.write("<li id='"+loopingLang[0]+"'><a data-link-name='"+loopingLangTxt+"' href='#'>"+loopingLangTxt+"</a></li>");
		}
	}
}

function getLangTextFromCode(language){
	var cnt = lang.length;
	var langText = "English";
	for( var i = 0; i < cnt; i++ ) {
		if( lang[i][0] == language ) {
			langText = lang[i][1];
			break;
		}
	}
	return langText;
}

function showKeySightMessage(){
	document.write('<scr' + 'ipt type="text/javascript" src="/cs/home_scripts/keysight.js"></scr' + 'ipt>');
}
