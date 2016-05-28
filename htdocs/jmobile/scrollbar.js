var myScroll;
function loaded() {
	myScroll = new iScroll('wrapper', {checkDOMChanges: true,hideScrollbar:true});
}

document.addEventListener('touchmove', function (e) { e.preventDefault(); }, true);
document.addEventListener('DOMContentLoaded', loaded, true);



