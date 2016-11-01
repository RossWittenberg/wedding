var RSVP = {
	addListeners: function(){
		console.log("RSVP js loaded");
		$('.rsvp__radio--cirle').click(function(event) {
			var selectedCircle = $(this);
			var selectedRow = $(this).data("row");
			var circlesOfSelectedRow = $('form').find('span[data-row='+ $(this).data('row') +']');
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
		var statusContainer = $('form').find('.rsvp__status--update__message--wrapper[data-guestid='+ data.guest_id +']');
		$(statusContainer).empty();
		var successString = data.rsvp_message + data.rsvp_status;
		$(statusContainer).append( $('<p>').text(successString) );
	}

}

$(document).ready(function(){
	RSVP.addListeners();
});