var RSVP = {
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
	},
	updateAttendenceStatus: function(value, guestID) {
		console.log(value);
		$.ajax({
			url: '/guests/'+ guestID +'/rsvp-update',
			type: 'PUT',
			data: {guest: 
				{
					attending: value
				}
			},
		})
		.always(function(data) {
			if ( data.rsvp_message.length ) {
				RSVP.renderRSVPSuccessMessage(data);
			}
		});
	},
	renderRSVPSuccessMessage: function(data) {
		var statusContainer = $('.rsvp__status--update__message--inner-wrapper[data-guestid='+ data.guest_id +']');
		$(statusContainer).empty();
		var successString = (data.rsvp_status).toUpperCase();
		$(statusContainer).append( $('<p>').text(successString).addClass('pressura--reg wide light-blue__text smaller') );
	},
	displayLogo: function(){
		$('.header__name--wrapper').fadeIn(800, function() {
			var sectionOneOffset = 200;
			setTimeout( function(){
				console.log(sectionOneOffset);
			    $('html, body').animate({
			        scrollTop: $(".section__two").offset().top + 2
			    }, 500);
			}, 2000 );
		});
	}

}

$(document).ready(function(){
	RSVP.addListeners();
	setTimeout( RSVP.displayLogo, 500 );
});