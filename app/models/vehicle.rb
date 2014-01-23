class Vehicle < ActiveRecord::Base
	
	def use_test_data 
    	use_test_data = true      
  	end	
  	def get_current_vehicles 
    	get_current_vehicles = true      
  	end

	# def averagePrice(name)
	# 	totalPrice = 0
	# 	vehicles = Vehicle.where("name like ?", "%#{name}%") 
	# 	vehicles.each do |vehicle|
	# 		if vehicle.price_usd.include?("USD")
	# 			totalPrice = totalPrice + vehicle.price_usd.to_i
	# 		else
	# 			totalPrice = totalPrice + vehicle.price_other.to_i
	# 		end
	# 	end
	# 	return totalPrice/vehicles.count
	# end	
	# def maxPrice(name)
		
	# 	maxPrice = 0
	# 	vehicles = Vehicle.where("name like ?", "%#{name}%") 
	# 	vehicles.each do |vehicle|
	# 		if vehicle.price_usd.include?("USD")
	# 			if maxPrice < vehicle.price_usd.to_i
	# 				maxPrice = vehicle.price_usd.to_i
	# 			end
	# 		else
	# 			if maxPrice < vehicle.price_other.to_i
	# 				maxPrice = vehicle.price_other.to_i
	# 			end
	# 		end
	# 	end
	# 	return maxPrice
	# end	
	# def minPrice(name)
		
	# 	minPrice = 999999
	# 	vehicles = Vehicle.where("name like ?", "%#{name}%") 
	# 	vehicles.each do |vehicle|
	# 		if vehicle.price_usd.include?("USD")
	# 			if minPrice > vehicle.price_usd.to_i
	# 				minPrice = vehicle.price_usd.to_i
	# 			end
	# 		else
	# 			if minPrice > vehicle.price_other.to_i
	# 				minPrice = vehicle.price_other.to_i
	# 			end
	# 		end
	# 	end
	# 	return minPrice
	# end
	
	def getAllVehiclesAndBuses
		all_auction_results = []
		auction_results = []

		if get_current_vehicles
			auctionIDs = [4294503638]
		else
		 	auctionIDs = [4293991126]
		# auctionIDs = [4293984121,4293984129,4293984039,4293984236,4293985848,4293985336,4293985846,4293985925,4293988744,
		# 	4293988768,4293991276,4293991126,4293991141,4293991460,4293992792,4293992934,4293992795,4293992929,4293993408,
		# 	4293994033,4293994913,4293995045,4293997358,4293997347,4293997349,4293998889,4293998699,4293998249,4294000283,
		# 	4294000306,4294000295,4294001368,4294001936,4294002687,4294002699,4294003147,4294002672,4294003637,4294003619,
		# 	4294006326,4294005305,4294006322,4294006957,4294007102,4294007129,4294007615,4294007662,4294007856,4294008250,
		# 	4294008108,4294008414,4294009148,4294009320,4294009637,4294009800,4294009928,4294010195,4294010341,4294011759,
		# 	4294013515,4294013260,4294013744,4294013299,4294013783,4294013852,4294013899,4294015160,4294014726,4294013994,
		# 	4294015222,4294015955,4294016909,4294016973,4294016163,4294017057,4294017002,4294017201,4294017128,4294017095,
		# 	4294017248,4294017726,4294017752,4294018095,4294019209,4294019366,4294019395,4294019403,4294018924,4294020528,
		# 	4294020559,4294020627,4294020957,4294021126,4294021551,4294022611,4294022280,4294022693,4294027264,4294026509,
		# 	4294028304,4294028564,4294027605,4294028439,4294028747,4294029945,4294030203,4294032457,4294032571,4294029612,
		# 	4294032823,4294031287,4294032250,4294033190,4294033351,4294033027,4294035142,4294034826,4294034764,4294035905,
		# 	4294034425,4294035605,4294036195,4294037429,4294036853,4294037681,4294038186,4294038551,4294038756,4294039219,
		# 	4294039132,4294040876,4294042624,4294042147,4294042783,4294043477,4294043720,4294044116,4294044281,4294044588,
		# 	4294044737,4294044816,4294045022,4294044887,4294045083,4294045205,4294045422,4294045566,4294046132,4294046054,
		# 	4294046478,4294046727,4294046624,4294046936,4294047847,4294048311,4294048834,4294048896,4294049255,4294049616,
		# 	4294049888,4294050115,4294050868,4294050359,4294051386,4294051929,4294052439,4294052700,4294052811,4294052929,
		# 	4294053178,4294053138,4294053101,4294053474,4294055776,4294053875,4294055764,4294054115,4294056124,4294055420,
		# 	4294056354,4294055096,4294056253,4294056315,4294056854,4294057203,4294056589,4294057739,4294057874,4294057986,
		# 	4294058271,4294058076,4294058737,4294058821,4294059272,4294060345,4294060145,4294062275,4294061854,4294061456,
		# 	4294062343,4294062474,4294061354,4294062711,4294063150,4294062838,4294063226,4294062946,4294063708,4294064765,
		# 	4294066775,4294067041,4294066406,4294064636,4294067069,4294066909,4294067286,4294067205,4294066191,4294068164,
		# 	4294067413,4294067497,4294067754,4294068374,4294068454,4294069989,4294069845,4294070976,4294070275,4294072120,
		# 	4294071493,4294072868,4294073183,4294073742,4294074205,4294074142,4294074680,4294075021,4294076411,4294076227,
		# 	4294076456,4294077434,4294077022,4294077811,4294078261,4294078513,4294080900,4294079214,4294080316,4294081244,
		# 	4294081657,4294081835,4294081899,4294082026,4294082264,4294082142,4294085521,4294085682,4294087102,4294087140,
		# 	4294087242,4294086982,4294087488,4294087439,4294087584,4294087656,4294088624,4294088475,4294088245,4294088213,
		# 	4294088671,4294088363,4294090578,4294089141,4294090488,4294090611,4294088763,4294091052,4294090434,4294090804,
		# 	4294090735,4294091161,4294091108,4294091340,4294091436,4294091641,4294091542,4294091795,4294091786,4294091774,
		# 	4294091716,4294092531,4294092687,4294092393,4294093475,4294092876,4294093517,4294093117,4294093394,4294093947,
		# 	4294093648,4294094142,4294094188,4294094243,4294094304,4294094536,4294094432,4294094599,4294094663,4294094883,
		# 	4294095023,4294094989,4294095115,4294095160,4294095323,4294095428,4294095509,4294095783,4294096280,4294096087,
		# 	4294096872,4294096759,4294097078,4294097953,4294098232,4294097652,4294099202,4294099852,4294100297,4294099142,
		# 	4294101566,4294101189,4294102489,4294103244,4294102973,4294103951,4294104282,4294106525,4294105513,4294106406,
		# 	4294105248,4294106065,4294106136,4294106791,4294107768,4294108407,4294109725,4294108824,4294110374,4294110775,
		# 	4294113380,4294114214,4294115603,4294115799,4294116163,4294117090,4294119492,4294119287,4294121665,4294121595,
		# 	4294122340,4294121498,4294122178,4294122383,4294122659,4294122805,4294123978,4294124465,4294123787,4294125177,
		# 	4294125587,4294125446,4294124852,4294126064,4294125711,4294126742,4294126766,4294129013,4294128605,4294128967,
		# 	4294127459,4294128243,4294129286,4294131309,4294130872,4294130998,4294130440,4294132418,4294132123,4294133070,
		# 	4294132844,4294133488,4294133537,4294133791,4294134607,4294135038,4294137390,4294136968,4294138229,4294137228,
		# 	4294136422,4294138343,4294138553,4294138638,4294138766,4294138902,4294139078,4294140766,4294141061,4294141472,
		# 	4294141647,4294140687,4294142280,4294141773,4294142423,4294142485,4294142591,4294142871,4294143039,4294143508,
		# 	4294143206,4294143743,4294144744,4294144617,4294145042,4294145163,4294145629,4294145528,4294147186,4294147035,
		# 	4294146456,4294147442,4294148194,4294147940,4294148803,4294149266,4294148626,4294148917,4294149732,4294152115,
		# 	4294151305,4294149996,4294152336,4294154572,4294153062,4294154421,4294155856,4294154855,4294155576,4294156187,
		# 	4294156246,4294156433,4294157060,4294157300,4294157426,4294158535,4294157759,4294158443,4294158828,4294159032,
		# 	4294159284,4294159425,4294159931,4294161232,4294161092,4294161554,4294161983,4294162852,4294163377,4294163069,
		# 	4294163758,4294164155,4294163796,4294164414,4294164504,4294164893,4294164943,4294165361,4294166773,4294167419,
		# 	4294167119,4294167186,4294167855,4294167594,4294168047,4294168573,4294168461,4294168996,4294169576,4294170800,
		# 	4294171174,4294170939,4294173455,4294171853,4294171662,4294173683,4294173540,4294172241,4294173799,4294172635,
		# 	4294174028,4294173357,4294174303,4294173948,4294174816,4294175181,4294175548,4294175912,4294176573,4294176909,
		# 	4294176009,4294176377,4294177051,4294177232,4294177092,4294177268,4294177365,4294177968,4294178458,4294178185,
		# 	4294179131,4294178655,4294179016,4294179513,4294179748,4294179346,4294179884,4294179944,4294179988,4294180063,
		# 	4294180340,4294180206,4294182312,4294182412,4294181397,4294183312,4294183229,4294183484,4294183709,4294184731,
		# 	4294184984,4294185626,4294185240,4294185931,4294186013,4294186883,4294187076,4294187647,4294188073,4294189513,
		# 	4294188850,4294189788,4294189925,4294190350,4294190081,4294190663,4294190703,4294190839,4294190942,4294191242,
		# 	4294191841,4294192480,4294193268,4294193693,4294193822,4294194463,4294195054,4294194710,4294195806,4294195954,
		# 	4294196478,4294196271,4294196342,4294196160,4294197884,4294197857,4294195603,4294197995,4294198291,4294198229,
		# 	4294198539,4294197742,4294198622,4294198820,4294198900,4294199095,4294199919,4294198969,4294199802,4294200103,
		# 	4294200042,4294199947,4294199637,4294200160,4294200659,4294200811,4294200994,4294201315,4294200950,4294201518,
		# 	4294201618,4294201899,4294201807,4294202130,4294203071,4294202847,4294202977,4294202742,4294203158,4294203334,
		# 	4294203438,4294202071,4294202495,4294203284,4294204981,4294203711,4294203509,4294204035,4294203863,4294204772,
		# 	4294204985,4294205920,4294205698,4294205833,4294205531,4294206309,4294206517,4294206598,4294206665,4294206718,
		# 	4294206793,4294206886,4294206946,4294207103,4294207219,4294204990,4294207346,4294207783,4294207571,4294208145,
		# 	4294208046,4294208270,4294208634,4294208355,4294209093,4294209358,4294210008,4294210341,4294210876,4294208901,
		# 	4294210497,4294212409,4294211133,4294211779,4294213213,4294213442,4294213141,4294213967,4294213650,4294215016,
		# 	4294214478,4294214755,4294215173,4294215525,4294216590,4294216545,4294217043,4294217376,4294218929,4294218455,
		# 	4294219532,4294220636,4294220328,4294221102,4294221304,4294221749,4294223223,4294222511,4294223254,4294223916,
		# 	4294226385,4294227006,4294227383]
		end

		auctionIDs.each do |auctionID|
			auction_results = getVehicles(auctionID.to_s)
			all_auction_results = all_auction_results + auction_results
			puts "Auction ID: "+auctionID.to_s+" had "+auction_results.count.to_s+" results; currently at "+all_auction_results.count.to_s+" of ~26017"
		end
		
		#Only used to get "trim" and any other fields for user selection
		all_auction_results = getCarGuruSelections(all_auction_results)

		return all_auction_results

	end

	def getVehicles(auctionID)
		require 'open-uri'

		#determine if I should go to the internet for data or use local data
		if use_test_data
			data_id = "testing"
		else
			data_id = getDataId(auctionID)
		end

		auction_results = []
		current_query_results = [1]

		count = 48
		offset = 0
		
		total = 26017

		while !current_query_results.empty?  do
			url_to_scrap = "https://www.rbauction.com/rba-api/search/results/advanced?rbasq="+data_id.to_s+"&offset="+offset.to_s+"&count="+count.to_s+"&ccb=USD"
			# puts url_to_scrap

			# cookie = "COOKIE_SUPPORT=true; CURRENT_ACCOUNT_INDEX_e77otaYymVmLZAEy2bwiKw%3D%3D=8468652; LB_STICKY=1388769470224; dtCookie=94605B61D5D6D317224A5A6A6EE1DF9A|www.rbauction|1; cbInd=1; cbArg=1; JSESSIONID=FE6220FE420DB95F5C65743905B6066F; CHICKEN_RUN=clisyasjolddyadaidol; COMPANY_ID=10106; ID=7851774653425a7939574b73534a4631685148464a413d3d; PASSWORD=62625477514a756843546a3149724a7a387a324c685846527678494e707746546e3846566b523171415a383d; REMEMBER_ME=true; LOGIN=6a61636f6273696464616c6c407961686f6f2e636f6d; SCREEN_NAME=3239354571756a674f587a6e707862552f6d6757324f6149414b5a4234563438496b5530395750716e38314f36387a4c7468473078726e7a5a5363466a3635376b794e7763576b514e784b6833617a5933354348446e6867693546784f546654; RING_WELL=odlolibbascjmoaoloam; mdr_browser=yes; __CT_Data=gpv=150&apv_130_www09=150; WRUID=0; __utma=41976678.1956085287.1388203413.1388797367.1388811303.17; __utmb=41976678.1.10.1388811303; __utmc=41976678; __utmz=41976678.1388784256.15.5.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); __utmli=yui_3_4_0_5_1388811303351_338; dtPC=190510472_927#_load_; GUEST_LANGUAGE_ID=en_US; GUEST_COUNTRY=United+States; GUEST_LANGUAGE=English; GUEST_FLAG=us"
			cookie = "COOKIE_SUPPORT=true; CURRENT_ACCOUNT_INDEX_e77otaYymVmLZAEy2bwiKw%3D%3D=8468652; LB_STICKY=1388769470224; dtCookie=94605B61D5D6D317224A5A6A6EE1DF9A|www.rbauction|1; cbInd=1; cbArg=1; JSESSIONID=BB26D5486400BD663A0D5037F8C560E0; CHICKEN_RUN=lahmdciadajsbjaisoad; COMPANY_ID=10106; ID=7851774653425a7939574b73534a4631685148464a413d3d; PASSWORD=62625477514a756843546a3149724a7a387a324c685846527678494e707746546e3846566b523171415a383d; REMEMBER_ME=true; LOGIN=6a61636f6273696464616c6c407961686f6f2e636f6d; SCREEN_NAME=3239354571756a674f587a6e707862552f6d6757324f6149414b5a4234563438496b5530395750716e38314f36387a4c7468473078726e7a5a5363466a3635376b794e7763576b514e784b6833617a5933354348446e6867693546784f546654; RING_WELL=mllhodoochllacyloosc; __utma=41976678.1956085287.1388203413.1389040003.1389127806.19; __utmb=41976678.23.10.1389127806; __utmc=41976678; __utmz=41976678.1389127806.19.7.utmcsr=google|utmccn=(organic)|utmcmd=organic|utmctr=(not%20provided); GUEST_LANGUAGE_ID=en_US; GUEST_COUNTRY=United+States; GUEST_LANGUAGE=English; GUEST_FLAG=us; __CT_Data=gpv=194&apv_130_www09=194; WRUID=0; dtPC=509688373_726#_load_; __utmli=yui_3_4_0_1_1389130488557_26"
			
			if use_test_data
				#long dataset
				json = '{"rbasq":"Y2k3fE49NDI5NDc0NzA1MCs0Mjk0NTAzNjM4JlBzPTQ4","offset":0,"count":48,"total":28,"price":{"low":"","median":"","high":""},"results":[{"id":"3984688","name":"2001 CHEVROLET 1500 LS 4 Door Extended Cab Pickup","url":"/2001-chevrolet-1500-ls-4-door-extended-cab?invId=3984688&id=ci","img":"/equipment_images/2014149/large/3984688_1.jpg","photoCount":22,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"174688 Mi","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"2GCEC19V311134850","cw":"V8, A/T","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3981340","name":"2008 CHEVROLET 1500 Extended Cab Pickup","url":"/2008-chevrolet-1500-extended-cab?invId=3981340&id=ci","img":"/equipment_images/2014149/large/3981340_1.jpg","photoCount":21,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1GCEC19X28Z298139","cw":"4.3 L, V6, A/T","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3978820","name":"2008 CHEVROLET 1500 Extended Cab Pickup","url":"/2008-chevrolet-1500-extended-cab?invId=3978820&id=ci","img":"/equipment_images/2014149/large/3978820_1.jpg","photoCount":20,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"134893 Mi","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1GCEC19C68Z223439","cw":"4.8 L, V8, A/T","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3982961","name":"2007 DODGE 1500 Crew Cab Pickup","url":"/2007-dodge-1500-crew-cab?invId=3982961&id=ci","img":"/equipment_images/2014149/large/3982961_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":true,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1D7HA18K57J624172","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3973191","name":"2006 DODGE DAKOTA Extended Cab Pickup","url":"/2006-dodge-dakota-extended-cab?invId=3973191&id=ci","img":"/equipment_images/2014149/large/3973191_1.jpg","photoCount":22,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"29602 Mi","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1D7HE42K765599959","cw":"V6, A/T","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3979580","name":"2008 FORD F250 XL Pickup","url":"/2008-ford-f250-xl?invId=3979580&id=ci","img":"/equipment_images/2014149/large/3979580_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"121635 Mi","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTSX20508EB82910","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3979579","name":"2008 FORD F250 XL Pickup","url":"/2008-ford-f250-xl?invId=3979579&id=ci","img":"/equipment_images/2014149/large/3979579_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"146300 Mi","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTSX20578EC49468","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3973224","name":"2006 FORD F250 Crew Cab Pickup","url":"/2006-ford-f250-crew-cab?invId=3973224&id=ci","img":"/equipment_images/2014149/large/3973224_1.jpg","photoCount":23,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"177386 Mi","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTSW20546ED23008","cw":"5.4 L, V8, A/T","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3984689","name":"2005 FORD F250 4 Door Extended Cab Pickup","url":"/2005-ford-f250-4-door-extended-cab?invId=3984689&id=ci","img":"/equipment_images/2014149/large/3984689_1.jpg","photoCount":22,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"175183 Mi","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTSX20575EB72676","cw":"V8, A/T","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3979582","name":"2011 FORD F250  Pickup","url":"/2011-ford-f250?invId=3979582&id=ci","img":"/equipment_images/2014149/large/3979582_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"76233 Mi","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FT7W2A69BEB08750","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3979581","name":"2010 FORD F250  Pickup","url":"/2010-ford-f250?invId=3979581&id=ci","img":"/equipment_images/2014149/large/3979581_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"149000 Mi","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTSW2BRXAEB35635","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3979574","name":"2006 FORD F250  Pickup","url":"/2006-ford-f250?invId=3979574&id=ci","img":"/equipment_images/2014149/large/3979574_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"150505 Mi","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTSX20516EB68849","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3979573","name":"2005 FORD F250  Pickup","url":"/2005-ford-f250?invId=3979573&id=ci","img":"/equipment_images/2014149/large/3979573_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"109764 Mi","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTSX20P25EB43278","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3979567","name":"2002 FORD F250  Pickup","url":"/2002-ford-f250?invId=3979567&id=ci","img":"/equipment_images/2014149/large/3979567_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"228844 Mi","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTNX20F62EB11174","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3973193","name":"2001 FORD F250  Pickup","url":"/2001-ford-f250?invId=3973193&id=ci","img":"/equipment_images/2014149/large/3973193_1.jpg","photoCount":24,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"207256 Mi","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTNF20L41EA94060","cw":"5.4 L, 8 cyl, A/T","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3985658","name":"2006 FORD F150 Extended Cab Pickup","url":"/2006-ford-f150-extended-cab?invId=3985658&id=ci","img":"/equipment_images/2014149/large/3985658_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":true,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTRX14W56NB78618","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3973194","name":"2004 FORD F150 4 Door Extended Cab Pickup","url":"/2004-ford-f150-4-door-extended-cab?invId=3973194&id=ci","img":"/equipment_images/2014149/large/3973194_1.jpg","photoCount":18,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"163862 Mi","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTRF12W24NC56940","cw":"8 cyl, A/T","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3981342","name":"2004 FORD F150  Pickup","url":"/2004-ford-f150?invId=3981342&id=ci","img":"/equipment_images/2014149/large/3981342_1.jpg","photoCount":20,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"2FTRF17214CA15060","cw":"4.2 L, V6, A/T","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3973192","name":"2004 FORD F150  Pickup","url":"/2004-ford-f150?invId=3973192&id=ci","img":"/equipment_images/2014149/large/3973192_1.jpg","photoCount":21,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"76478 Mi","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"2FTRF17234CA41143","cw":"8 cyl, A/T","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3981341","name":"2003 FORD F150  Pickup","url":"/2003-ford-f150?invId=3981341&id=ci","img":"/equipment_images/2014149/large/3981341_1.jpg","photoCount":20,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"2FTRF17203CA94624","cw":"4.2 L, V6, 5 spd","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3979583","name":"2003 FORD F150  Pickup","url":"/2003-ford-f150?invId=3979583&id=ci","img":"/equipment_images/2014149/large/3979583_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1FTRX17W03NB94409","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3984680","name":"2010 GMC 1500 Crew Cab 4x4 Pickup","url":"/2010-gmc-1500-crew-cab-4x4?invId=3984680&id=ci","img":"/equipment_images/2014149/large/3984680_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"27149","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3984679","name":"2010 GMC 1500 Crew Cab 4x4 Pickup","url":"/2010-gmc-1500-crew-cab-4x4?invId=3984679&id=ci","img":"/equipment_images/2014149/large/3984679_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"48212","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3984650","name":"2011 GMC YUKON Denali Sport Utility Vehicle","url":"/2011-gmc-yukon-denali?invId=3984650&id=ci","img":"/equipment_images/2014149/large/3984650_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"Not Available","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3984669","name":"2004 NISSAN PATHFINDER  Sport Utility Vehicle","url":"/2004-nissan-pathfinder?invId=3984669&id=ci","img":"/equipment_images/2014149/large/3984669_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"JN8DR09XX4W803137","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3984681","name":"2013 TOYOTA TUNDRA Crew Cab 4x4 Pickup","url":"/2013-toyota-tundra-crew-cab-4x4?invId=3984681&id=ci","img":"/equipment_images/2014149/large/3984681_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"5TFDW5F19DX287381","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3985659","name":"2010 TOYOTA TUNDRA  Pickup","url":"/2010-toyota-tundra?invId=3985659&id=ci","img":"/equipment_images/2014149/large/3985659_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":true,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"5TFDW5F1SAX100701","cw":"","notes":"","saleNo":"2014149","currency":"USD"},{"id":"3984672","name":"2006 TOYOTA TUNDRA  Pickup","url":"/2006-toyota-tundra?invId=3984672&id=ci","img":"/equipment_images/2014149/large/3984672_1.jpg","photoCount":0,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":false,"dei":false,"warranty":false,"price":{"foreign":"","sale":""},"sn":"5TBET34156S550214","cw":"","notes":"","saleNo":"2014149","currency":"USD"}]}'

				#short dataset
				#json = '{"rbasq":"Y2k3fE49NDI5NDc0NzA1MCs0Mjk0NTAzNjM4JlBzPTQ4","offset":0,"count":48,"total":28,"price":{"low":"","median":"","high":""},"results":[{"id":"3981340","name":"2008 CHEVROLET 1500 Extended Cab Pickup","url":"/2008-chevrolet-1500-extended-cab?invId=3981340&id=ci","img":"/equipment_images/2014149/large/3981340_1.jpg","photoCount":21,"auction":{"name":"Houston, TX, USA","date":"Wednesday Feb 5, 2014 - Thursday Feb 6, 2014","url":"/heavy-equipment-auctions/houston-tx-2014149"},"lot":"","meter":"","inYard":true,"dei":true,"warranty":false,"price":{"foreign":"","sale":""},"sn":"1GCEC19X28Z298139","cw":"4.3 L, V6, A/T","notes":"","saleNo":"2014149","currency":"USD"}]}'
			else
				json = open(url_to_scrap, "cookie"=>cookie).read
			end

			current_query_results = JSON.parse(json)['results']

			#We know that this method only works for counts less than 3300, so if the # of vehicles is over that we need to alert to the issue
			if JSON.parse(json)['total'].to_i > 3300 then
				puts "Houston, we have a problem: auction ID " +auctionID+" is greater than 3300"
			end

			auction_results = auction_results + current_query_results
		    
		    offset = offset + count
		    count = 32

			if use_test_data 
				current_query_results = []
			end
		end
		
		## here is where we call the function to save vehicles ONLY do this for historical items
		#saveVehiclesToDB(auction_results)

		return auction_results
	end
	
	# function used for saving vehicles
	def saveVehiclesToDB(auction_results)
		
		auction_results.each do |result|
			vehicle = Vehicle.new

			vehicle.name = result["name"].upcase.split(" ").uniq.join(" ")
			vehicle.richie_id = result["id"]
		    vehicle.auction_location = result["auction"]["name"]
		    vehicle.auction_date = DateTime.parse(result["auction"]["date"])
		    vehicle.meter = result["meter"]
		    if result["price"]["sale"].include?("USD")
			    vehicle.price_usd = result["price"]["sale"]
			    vehicle.price_other = result["price"]["foreign"]
			    puts "sale is USD"
			else
			    vehicle.price_usd = result["price"]["foreign"].to_i
			    vehicle.price_other = result["price"]["sale"].to_i
			    puts "sale is not USD"
			end    
		    vehicle.save
		end
	end

	def getDataId(auctionID)

		require 'open-uri'

		if get_current_vehicles
			vehicle_type_selection = "4294747050"
			selection_type = "ci"
		else
			vehicle_type_selection = "4294237252"
			selection_type = "ar"
		end

		url_request_for_data_id = "https://www.rbauction.com/rba-api/rbasq/
			get?indexName="+selection_type+"
			&locale=en
			&txtSelectKeywords=
			&dropSelectIndustry="+vehicle_type_selection+"
			&dropSelectCategory=
			&dropSelectMasterCategory=
			&dropSelectRegion=
			&dropSelectAuction="+auctionID+"
			&txtSelectMake=
			&txtSelectModel=
			&makeDimId=
			&modelDimId=
			&txtSelectLotStart=
			&txtSelectLotEnd=
			&txtSerialNo=
			&dropSelectPriceStart=
			&txtSelectPriceStart=
			&txtSelectPriceEnd=
			&dropSelectDate=
			&txtSelectManuYearStart=
			&txtSelectManuYearEnd="


		# puts url_request_for_data_id.gsub(/\s+/, "")

		json = open(url_request_for_data_id.gsub(/\s+/, "")).read

		data_id = JSON.parse(json)['rbasq']
		# puts data_id
	end

	# function used to scrape CarGuru and get possible TRIM values (from there I will run the query)
	def getCarGuruSelections(all_auction_results)
		require 'nokogiri'
		require 'open-uri'

		all_auction_results.each do |vehicle|

			if use_test_data 
				dropdownValues=	'<option>Select Trim</option>
				<option value="t32582">LS Crew Cab</option>
				<option value="t32583">LS Crew Cab 4WD</option>
				<option value="t32594">LT1</option>
				<option value="t32595">LT1 4WD</option>
				<option value="t32584">LT1 Crew Cab</option>
				<option value="t32585">LT1 Crew Cab 4WD</option>
				<option value="t32588">LT1 Extended Cab</option>
				<option value="t32589">LT1 Extended Cab 4WD</option>
				<option value="t32586">LT1 Extended Cab LB</option>
				<option value="t32587">LT1 Extended Cab LB 4WD</option>
				<option value="t32590">LT1 Extended Cab SB</option>
				<option value="t32591">LT1 Extended Cab SB 4WD</option>
				<option value="t32592">LT1 LB</option>
				<option value="t32593">LT1 LB 4WD</option>
				<option value="t32596">LT2 Crew Cab</option>
				<option value="t32597">LT2 Crew Cab 4WD</option>
				<option value="t32603">LT2 Extended Cab 4WD</option>
				<option value="t32601">LT2 Extended Cab SB 4WD</option>
				<option value="t32604">LTZ Crew Cab</option>
				<option value="t32605">LTZ Crew Cab 4WD</option>
				<option value="t32610">LTZ Extended Cab</option>
				<option value="t32611">LTZ Extended Cab 4WD</option>
				<option value="t32607">LTZ Extended Cab LB 4WD</option>
				<option value="t32608">LTZ Extended Cab SB</option>
				<option value="t32609">LTZ Extended Cab SB 4WD</option>
				<option value="t32622">Work Truck</option>
				<option value="t32623">Work Truck 4WD</option>
				<option value="t32612">Work Truck Crew Cab</option>
				<option value="t32613">Work Truck Crew Cab 4WD</option>
				<option value="t32618">Work Truck Extended Cab</option>
				<option value="t32619">Work Truck Extended Cab 4WD</option>
				<option value="t32615">Work Truck Extended Cab LB 4WD</option>
				<option value="t32616">Work Truck Extended Cab SB</option>
				<option value="t32617">Work Truck Extended Cab SB 4WD</option>
				<option value="t32620">Work Truck LB</option>
				<option value="t32621">Work Truck LB 4WD</option>'
			else
				if vehicle['sn'].to_s.length == 17
					url = "http://www.cargurus.com/Cars/instantMarketValueFromVIN.action?startUrl=%2F&carDescription.vin=#{vehicle["sn"]}"
					doc = Nokogiri::HTML(open(url))
					dropdownValues = doc.css(".trim-select-dropdown option").to_s;
					# pairsArray = buildPairsArray(dropdownValues)
					vehicle["trim"] = dropdownValues #pairsArray
				end
			end
			if dropdownValues
				dropdownArray = getDropdownArray(dropdownValues)
				vehicle["trim"] = dropdownArray
			end
		end
	end
	
	def getDropdownArray(dropdownValues)
		dropdownArray= []

		optionsArray = dropdownValues.split("\n")
		optionsArray.shift
		optionsArray.each_with_index do |option, index|
			
			#parses out the selections from CarGuru
			value = option.split('"')[1]
			text = option.split('>')[1].split('<')[0]

			dropdownArray << [text,value]
		end
		dropdownArray
	end
	
	def getValuation1value(trim, vin)

		require 'nokogiri'

		url_for_valuation_1 = 'http://www.cargurus.com
			/Cars
			/priceCalculatorReportAjaxResearchPriceView.action?carDescription.
			autoEntityId='+trim+'
			&carDescription.postalCode=
			&carDescription.mileage=
			&carDescription.price=
			&carDescription.radius=75
			&carDescription.transmissionType=AUTOMATIC_TRANSMISSION
			&selectedEntity='+trim+'
			&carDescription.vin='+vin
			
		if use_test_data
			valuation1 = "$99"
		else
		 	doc = Nokogiri::HTML(open(url_for_valuation_1.gsub(/\s+/, "")))
			valuation1 = doc.css(".instantMarketValue").text;
		end
		return valuation1
	end

	def getSimilarVehicles
		Vehicle.where("name like ?", self.name)
	end
	def good_purchase?
		similar_vehicles = self.getSimilarVehicles
		if self.price_usd < similar_vehicles.average(:price_usd)
			self.good_purchase = true
			self.save
		end
	end
end