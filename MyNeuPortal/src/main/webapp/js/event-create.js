/**
 * 
 */

$(document)
		.ready(
				function() {
					$('#create_event_form')
							.bootstrapValidator(
									{
										// To use feedback icons, ensure that
										// you use Bootstrap v3.1.0 or later
										feedbackIcons : {
											valid : 'glyphicon glyphicon-ok',
											invalid : 'glyphicon glyphicon-remove',
											validating : 'glyphicon glyphicon-refresh'
										},
										fields : {
											event_title : {
												validators : {
													stringLength : {
														min : 2,
													},
													notEmpty : {
														message : 'Please supply your event title'
													}
												}
											},
											event_description : {
												validators : {
													stringLength : {
														min : 10,
														max : 200,
														message : 'Please enter at least 10 characters and no more than 200'
													},
													notEmpty : {
														message : 'Please supply a description of your event'
													}
												}
											},
											event_address : {
												validators : {
													stringLength : {
														min : 8,
													},
													notEmpty : {
														message : 'Please supply your street address'
													}
												}
											},
											event_date:{
												validators : {
													stringLength : {
														max: 10,
													},
													notEmpty : {
														message : 'Please supply your date of event'
													}
												}
											}
										}
									}).on(
									'success.form.bv',
									function(e) {
										$('#success_message').slideDown({
											opacity : "show"
										}, "slow") // Do
										// something
										// ...
										$('#contact_form').data(
												'bootstrapValidator')
												.resetForm();

										// Prevent form submission
										e.preventDefault();

										// Get the form instance
										var $form = $(e.target);

										// Get the BootstrapValidator instance
										var bv = $form
												.data('bootstrapValidator');

										// Use Ajax to submit form data
										$.post($form.attr('action'), $form
												.serialize(), function(result) {
											console.log(result);
										}, 'json');
									});
				});
