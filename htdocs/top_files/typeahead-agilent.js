$(document).ready(function() {

    jQuery_1_10_2('#searchinput').typeahead([
    {             
	
        name: 'search-typeahead',
        minLength: 2,
        // header: '<h3>Dimensions</h3>',
        remote: {
          url: '/search/json/services/dimensionsearch?Ntk=typeahead&Ntt=%QUERY*',
          filter:
            function(resp) {

            var dataset = [];
            jQuery_1_10_2.each(resp.dimensionSearchResults.dimensionSearchGroups, function(key, prop) {
            var dimension_group = prop.displayName;
                jQuery_1_10_2.each(prop.dimensionSearchValues, function(key, dimension) {
              dataset.push({
                value: dimension.label,
                encodedValue: encodeURIComponent(dimension.label),
                group: dimension_group,
                link: dimension.siteRootPath + dimension.contentPath + dimension.navigationState
              })
            })
          });
          return dataset;
            }
        },
		
        template: '<div><a href="//www.chem.agilent.com/search/?Ntt={{encodedValue}}"><span class="value">{{value}}</span></a></div>',
        engine: Hogan
    },
    {                                    
        name: 'record-search-typeahead',
        minLength: 2,
        // header: '<h3>Records</h3>',
        remote: {
          url: '/search/json/services/guidedsearch/?Ntk=typeahead&Ntx=mode+matchall&N=0&Ntt=%QUERY*',
          filter:
            function(resp) {

              var dataset = [];
              jQuery_1_10_2.each(resp.resultsList.records, function(key, prop) {

                  dataset.push({
                    value: prop.attributes["ta_title"][0], //this may need to change if ta_title isn't unique
                    ta_title: prop.attributes["ta_title"][0],
                    link: prop.detailsAction.siteRootPath + prop.detailsAction.contentPath + prop.detailsAction.recordState
                  })

              });
              return dataset;

            }
        },
        template: '<div><a href="//www.chem.agilent.com/search/?Ntt={{ta_title}}"><span class="value">{{#ta_title}}{{ta_title}}{{/ta_title}}</span></a></div>',
        engine: Hogan
    }                 
  ]);


    /**
     * When typahead item is selected, perform the search (not just when the anchor tag inside the div is selected)
      */
    jQuery_1_10_2("#searchinput").bind("typeahead:selected", function(obj, datum){
        window.location.replace('//www.chem.agilent.com/search/?Ntt=' + encodeURIComponent(datum.value));
    });

    /**
     * Perform search when enter is pressed on searchbox
     */
    jQuery_1_10_2("#searchinput").keydown(function (event) {
        var keypressed = event.keyCode || event.which;
        if (keypressed == 13) {
            $("#imgBtnSearch").click();
        }
    });
});
