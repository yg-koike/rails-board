
$(function() {
  let countIni1 = String($('#input-content1').val().length);
  $('#form-counter1').text(countIni1 + '文字');
  let countIni2 = String($('#input-content2').val().length);
  $('#form-counter2').text(countIni2 + '文字');
  $("#input-content1").on("keyup", function() {
    let countNum = String($(this).val().length);
    $("#form-counter1").text(countNum + "文字");
  });
  $("#input-content2").on("keyup", function() {
    let countNum = String($(this).val().length);
    $("#form-counter2").text(countNum + "文字");
  });
});

$(function() {
  $("#input-comment").on("keyup", function() {
    let countNum = String($(this).val().length);
    $("#comment-counter").text(countNum + "文字");
  });
});




