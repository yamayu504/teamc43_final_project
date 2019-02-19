$(document).on('turbolinks:load', function(){
  $(function(){
    var form = $("#charge-form");
    form.submit(function(e) {
      e.preventDefault();
      Payjp.setPublicKey('pk_test_fa121efa0f38b35e9322e06a');
      // カード情報生成
      const card = {
        number: document.getElementById('card_number').value,
        cvc: document.getElementById('cvv').value,
        exp_month: document.getElementById('exp_month').value,
        exp_year: document.getElementById('exp_year').value
      };
      // appendしてsubmitしてtokenをコントーラーで受け取れるようにする
      Payjp.createToken(card, function(s, response) {
        if (response.error) {
          form.find('.payment-errors').text(response.error.message);
          form.find('button').prop('disabled', false);
        }
        else {
          $(".number").removeAttr("name");
          $(".cvc").removeAttr("name");
          $(".exp_month").removeAttr("name");
          $(".exp_year").removeAttr("name");
          var token = response.id;
          form.append($('<input type="hidden" name="payjpToken" />').val(token));
          form.get(0).submit();
        }
      });
    });
  });
});

