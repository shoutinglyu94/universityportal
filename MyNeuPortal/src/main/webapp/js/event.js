/**
 * 
 */

$(document).ready(function() {
	$('#datepicker').datepicker();
    $('#create_event_form').bootstrapValidator({
        // To use feedback icons, ensure that you use Bootstrap v3.1.0 or later
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        	event_title: {
                validators: {
                        stringLength: {
                        min: 2,
                    },
                        notEmpty: {
                        message: 'Please supply your event title'
                    }
                }
            },
            event_description: {
                validators: {
                     stringLength: {
                        min: 2,
                    },
                    notEmpty: {
                        message: 'Please supply your event description'
                    }
                }
            },
            event_address: {
                validators: {
                     stringLength: {
                        min: 8,
                    },
                    notEmpty: {
                        message: 'Please supply your event address'
                    }
                }
            },
            event_date: {
                validators: {
                    notEmpty: {
                        message: 'Please supply your event date'
                    },
                    date: {
                        format: 'MM/DD/YYYY',
                        message: 'The value is not a valid date'
                    }
                }
            }

        }
        });
    
        $("#submit").on("click", function(e){

        	var bootstrapValidator = $('#create_event_form').data('bootstrapValidator');
        	
        	bootstrapValidator.validate();
        	
            if(bootstrapValidator.isValid()){
            	$('#success_message').slideDown({ opacity: "show" }, "slow");
            	// Prevent form submission
            	//e.preventDefault();
            	//url
            	var url = $('#create_event_form').attr('action');
                // Send the data using post
                var posting = $.post( 
                		url, 
                		$('#create_event_form').serialize());
                var t = setTimeout('$("#success_message").slideUp({ opacity: "show" }, "slow")',1000);
            }
        });

});

