 //var bounds = ol.proj.transformExtent([126.87114715576169,37.63734433906191, 127.22064971923827,37.480579692661436], 'EPSG:4326', 'EPSG:3857');
 var geojsonFormat = new ol.format.GeoJSON();
 
 
 window.loadFeatures = function(response) {
     vectorSourceC.addFeatures(geojsonFormat.readFeatures(response));
 };

                                                 
/*천안주요 인구밀집지역 wms,wfs */
 
 var vectorSourceC= new ol.source.Vector({
		
	    loader: function(extent, resolution, projection) {
	        var url = 'http://localhost:8080/geoserver/group_prj3/ows?service=WFS&' +
	            'version=1.1.0&request=GetFeature&typename=group_prj3:seoulartcoords&'+
	            'outputFormat=text/javascript&format_options=callback:loadFeatures' +
	            '&srsname=EPSG:3857&bbox=' + extent.join(',') + ',EPSG:3857';
	        $.ajax({
	            url: url,
	            dataType: 'jsonp',
	            jsonp: false
	        });
	    },
	    strategy: ol.loadingstrategy.tile(ol.tilegrid.createXYZ({
	        //maxZoom: 10
	    }))
	});
	var pCampsiteWFSlayerC= new ol.layer.Vector({
	    source: vectorSourceC

	});
 var imagesourceWMS2 = new ol.source.ImageWMS({
	 //ratio: 1,
	 url: 'http://localhost:8080/geoserver/group_prj3/wms/',
	 params: {'FORMAT': 'image/png', LAYERS:'seoulartcoords',WIDTH:'100'}
 
 });
 var untiled2 = new ol.layer.Image({
	 source: imagesourceWMS2
 });
 
 /*오픈레이어스 기본레이어*/
 var osmlayer = new ol.layer.Tile({
     source: new ol.source.OSM()
 });
 var zoom=10.5;
 var center= ol.proj.fromLonLat([126.97838,37.56661])
 var view = new ol.View({
	  center:center,
	  zoom:zoom
	});
 //마지막으로 설정한 레이어와 view 등 map에 입력, map에 지금까지 설정한 모든 지도의 정보가 들어있음
 var map = new ol.Map({
     /*controls: ol.control.defaults({
         attribution: true
     }),*/
	 loadTilesWhileAnimating: true,
     target: 'map',
     layers: [osmlayer],
     view:view
 });
 //화면크기에 알맞게 지도띄우기
 //map.getView().fit(bounds, map.getSize());

 function flyTo(location, done) {
     var duration = 2000;
     var parts = 2;
     var called = false;
     function callback(complete) {
       --parts;
       if (called) {
         return;
       }
       if (parts === 0 || !complete) {
         called = true;
         done(complete);
       }
     }
     view.animate({
       center: location,
       duration: duration
     }, callback);
     view.animate({
       zoom: zoom -1.5,
       duration: duration / 2
     }, {
       zoom: zoom+5.0,
       duration: duration / 2
     }, callback);
   }
 var lonlat = null;
 var lon=0;
 var lat=0;
 map.on('singleclick', function(evt) {
     lonlat=ol.proj.transform(evt.coordinate, 'EPSG:3857', 'EPSG:4326');
      lon= lonlat[0];
      lat = lonlat[1];
     displayFeatureInfo(evt.pixel);
 });
 
 
 var displayFeatureInfo = function(pixel) {
     var feature = map.forEachFeatureAtPixel(pixel, function(feature, layer) {
         return feature;
     });

     if (feature) 
     {	
         FeatureInfoLoad(feature);
         var bern = ol.proj.fromLonLat([lon,lat]);
         	
         function bounce(t) {
           var s = 7.5625, p = 2.75, l;
           if (t < (1 / p)) {
             l = s * t * t;
           } else {
             if (t < (2 / p)) {
               t -= (1.5 / p);
               l = s * t * t + 0.75;
             } else {
               if (t < (2.5 / p)) {
                 t -= (2.25 / p);
                 l = s * t * t + 0.9375;
               } else {
                 t -= (2.625 / p);
                 l = s * t * t + 0.984375;
               }
             }
           }
           return l;
         }
           flyTo(bern, function(){});
     } 
     else 
     {
         FeatureInfoWndClose();
     }
     
   
     
 };
 map.addLayer(pCampsiteWFSlayerC);
 map.addLayer(untiled2);
 
 
 function setGIDList(selectgid){
	   map.getLayers().item(2)
	   var CQLFilter="p_num in("+selectgid+")";
	   imagesourceWMS2.updateParams({'CQL_FILTER':CQLFilter});
	}
 
 
    	 
