var HOME = {
	addListeners: function(){
		console.log("RSVP js loaded");
		$('.rsvp__radio--cirle').click(function(event) {
			var selectedCircle = $(this);
			var selectedRow = $(this).data("row");
			var circlesOfSelectedRow = $('span[data-row='+ $(this).data('row') +']');
			$(circlesOfSelectedRow).removeClass('selected');
			$(selectedCircle).addClass('selected');
			var selectedCircleVal = $(selectedCircle).data('value');
			var guestID = $(selectedCircle).data('guestid');
			RSVP.updateAttendenceStatus(selectedCircleVal, guestID);
		});
		$('#emailLookUp').click(function(evt){
			evt.preventDefault;
			var data = $('form#lookUpByEmail').serialize();
			$.ajax({
				url: '/look-up-by-email',
				type: 'POST',
				data: data
			})
			.done(function(data) {
				var errorMessageWrapper = $('#errorMessage');
				if (data.error) {
					(errorMessageWrapper).empty();
					errorMessageWrapper.prepend(data.error);
					$('#emailInput').addClass('error');
				}
			})
		})
		$(window).keydown(function(event){
		    if(event.keyCode == 13) {
		    	event.preventDefault();
		    	return false;
			}
	  	});
	},
	displayLogo: function(){
		$('.header__name--wrapper.rsvp').fadeIn(800, function() {
			var sectionOneOffset = 200;
			if ( $(window).scrollTop() == 0 ){

				setTimeout( function(){
					console.log(sectionOneOffset);
				    $('html, body').animate({
				        scrollTop: $(".section__two").offset().top + 2
				    }, 700);
				}, 500 );
			};	
		});
		$('.header__name--wrapper.home').fadeIn(800);
		$('.header__thank-you--wrapper').fadeIn(800);
	}
}

/*! Backstretch - v2.0.4 - 2013-06-19
* http://srobbin.com/jquery-plugins/backstretch/
* Copyright (c) 2013 Scott Robbin; Licensed MIT */

$(document).on('turbolinks:load', function() {
	HOME.addListeners();
	setTimeout( HOME.displayLogo, 500 );
});

