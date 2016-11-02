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
			var sectionOneOffset = 
			setTimeout( function(){ }, 1500 );
		});
	}

}

$(document).ready(function(){
	RSVP.addListeners();
	setTimeout( RSVP.displayLogo, 500 );
});


var EMAIL = {
	formRowWrapper: $('.form__row--wrapper'),
	addListeners: function() {
		console.log("Email.js has been loaded.")
		var guestCount = 1;
		$('#addGuest').click(function(e) {
			guestCount++;
			e.preventDefault();
			EMAIL.addGuest(guestCount);
		});
		$('#emailSubmit').click(function(e) {
			e.preventDefault();
			var rsvpForm = $(this).parent();
			$(rsvpForm).submit();
		});
	},
	addGuest: function(guestCount){
		console.log(guestCount);
		$('.form__row--wrapper').append( $('<div>').addClass('form__row--inner-wrapper').append('<input type="text" name="name'+guestCount+'" placeholder="Name"><input type="email" name="email'+guestCount+'" placeholder="Email"><select type="text" name="meal'+guestCount+'" placeholder="Meal"><option value="Chicken">Chicken</option><option value="Meat">Meat</option><option value="Veggie">Veggie</option></select>') )
	}
}

$(document).ready(function(){
	EMAIL.addListeners();
});