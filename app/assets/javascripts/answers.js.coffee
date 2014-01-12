$(document).ready ->
  $("#answer-modal").on "shown.bs.modal", (e) ->
    $("#answer_referred_subject").remove()
    referred_subject = e.relatedTarget.dataset.subject
    hidden_field = "<input id=\"answer_referred_subject\" name=\"answer[referred_subject]\" type=\"hidden\" value=\"" + referred_subject + "\">"
    $("#new_answer").find(".modal-body").append hidden_field

  $("#answer-modal").on "show.bs.modal", (e) ->
    modal_title = e.relatedTarget.text
    $(".modal-title").html modal_title

  $("#answer-modal").on "hide.bs.modal", (e) ->
    $(".alert.alert-danger").remove()
    $(".help-block").remove()
    $('.has-error').removeClass('has-error')

  $("[data-toggle=offcanvas]").click ->
    $(".row-offcanvas").toggleClass "active"
