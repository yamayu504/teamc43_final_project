$(document).on('turbolinks:load', function(){
  $('.to-step1').on('click',function(e){
    $(".registrations__wrapper__step0").hide();
    $(".registrations__wrapper__step-head").show();
    $(".registrations__wrapper__step1").show();
  });
  $('.to-step2').on('click',function(e){
  // $('.member-info').find('input,select').on('change',function(e){
    let check = 0;
    $('.member-info').find('input,select').each(function(){
      $(this).css('border','1px solid #ccc');
      $(".error-message").remove();
    });
    $('.member-info').find('input,select').each(function(){
      let error;
      let value = ($(this).val());
      if(value == ""){
        error = true;
      }
      else if(!value.match(/[^\s\t]/)){
        error = true;
      }
      if(error){
        $(this).css('border','1px solid red');
        $(this).parent().append('<div class="error-message">必要事項を入力してください</div>');
        check++
      }
    });
    $('.member-info').find('#user_nickname').each(function(){
      let error;
      let value = ($(this).val());
      if(!value.match(/^.{0,20}$/)){
        error = true;
      }
      console.log(error)
      if(error){
        $(this).css('border','1px solid red');
        $(this).parent().append('<div class="error-message">20 文字以下で入力してください</div>');
        check++
      }
    });
    $('.member-info').find('#user_first_name').each(function(){
      let error;
      let value = ($(this).val());
      if(!value.match(/^[a-zA-Zぁ-んァ-ン一-龥]+$/)){
        error = true;
      }
      if(value){
        if(error){
          $(this).css('border','1px solid red');
          $(this).parent().append('<div class="error-message">姓 に数字や特殊文字は使用できません</div>');
          check++
        }
      }
    });
    $('.member-info').find('#user_last_name').each(function(){
      let error;
      let value = ($(this).val());
      if(!value.match(/^[a-zA-Zぁ-んァ-ン一-龥]+$/)){
        error = true;
      }
      if(value){
        if(error){
          $(this).css('border','1px solid red');
          $(this).parent().append('<div class="error-message">名 に数字や特殊文字は使用できません</div>');
          check++
        }
      }
    });
    $('.member-info').find('#user_first_name_kana').each(function(){
      let error;
      let value = ($(this).val());
      if(!value.match(/^[a-zA-Zァ-ン]+$/)){
        error = true;
      }
      if(value){
        if(error){
          $(this).css('border','1px solid red');
          $(this).parent().append('<div class="error-message">姓カナ を入力してください</div>');
          check++
        }
      }
    });
    $('.member-info').find('#user_last_name_kana').each(function(){
      let error;
      let value = ($(this).val());
      if(!value.match(/^[a-zA-Zァ-ン]+$/)){
        error = true;
      }
      if(value){
        if(error){
          $(this).css('border','1px solid red');
          $(this).parent().append('<div class="error-message">名カナ を入力してください</div>');
          check++
        }
      }
    });
    $('.member-info').find('#user_email').each(function(){
      let error;
      let value = ($(this).val());
      if(!value.match(/^\S+@\S+\.\S+$/)){
        error = true;
      }
      if(value){
        if(error){
          $(this).css('border','1px solid red');
          $(this).parent().append('<div class="error-message">フォーマットが不適切です</div>');
          check++
        }
      }
    });
    $('.member-info').find('#user_password').each(function(){
      let error;
      let value = ($(this).val());
      var password = value
      if(!value.match(/^(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,128}$/i)){
        error = true;
      }
      if(value){
        if(error){
          $(this).css('border','1px solid red');
          $(this).parent().append('<div class="error-message">パスワードは6文字以上128文字以下で入力してください</div>');
          check++
        }
      }
      $('.member-info').find('#user_password_confirmation').each(function(){
        let error;
        let value = ($(this).val());
        if(value !== password){
          error = true;
        }
        if(value){
          if(error){
            $(this).css('border','1px solid red');
            $(this).parent().append('<div class="error-message">パスワードとパスワード (確認) が一致しません</div>');
            check++
          }
        }
      });
    });
    if(check >= 1){
      check = 0
    }
    else{
      $(".registrations__wrapper__step1").hide();
      $(".registrations__wrapper__step2").show();
      $('.bar-step1').addClass('active-after');
      $('.bar-step2').addClass('active');
      $('.bar-step2').addClass('active-before');
    }
  });

  $('.member-info').find('#user_nickname').on('change',function(e){
    $('.member-info').find('#user_nickname').each(function(){
      $(this).css('border','1px solid #ccc');
      $(this).next(".error-message").remove();
    });
    let error;
    let value = ($(this).val());
    if(!value.match(/^.{0,20}$/)){
      error = true;
    }
    console.log(error)
    if(error){
      $(this).css('border','1px solid red');
      $(this).parent().append('<div class="error-message">20 文字以下で入力してください</div>');
    }
  });
  $('.member-info').find('#user_first_name').on('change',function(e){
    $('.member-info').find('#user_first_name').each(function(){
      $(this).css('border','1px solid #ccc');
      $(this).next(".error-message").remove();
    });
    let error;
    let value = ($(this).val());
    if(!value.match(/^[a-zA-Zぁ-んァ-ン一-龥]+$/)){
      error = true;
    }
    console.log(error)
    if(error){
      $(this).css('border','1px solid red');
      $(this).parent().append('<div class="error-message">姓 に数字や特殊文字は使用できません</div>');
    }
  });
  $('.member-info').find('#user_last_name').on('change',function(e){
    $('.member-info').find('#user_last_name').each(function(){
      $(this).css('border','1px solid #ccc');
      $(this).next(".error-message").remove();
    });
    let error;
    let value = ($(this).val());
    if(!value.match(/^[a-zA-Zぁ-んァ-ン一-龥]+$/)){
      error = true;
    }
    console.log(error)
    if(error){
      $(this).css('border','1px solid red');
      $(this).parent().append('<div class="error-message">名 に数字や特殊文字は使用できません</div>');
    }
  });
  $('.member-info').find('#user_first_name_kana').on('change',function(e){
    $('.member-info').find('#user_first_name_kana').each(function(){
      $(this).css('border','1px solid #ccc');
      $(this).next(".error-message").remove();
    });
    let error;
    let value = ($(this).val());
    if(!value.match(/^[a-zA-Zァ-ン]+$/)){
      error = true;
    }
    console.log(error)
    if(error){
      $(this).css('border','1px solid red');
      $(this).parent().append('<div class="error-message">姓カナ を入力してください</div>');
    }
  });
  $('.member-info').find('#user_last_name_kana').on('change',function(e){
    $('.member-info').find('#user_last_name_kana').each(function(){
      $(this).css('border','1px solid #ccc');
      $(this).next(".error-message").remove();
    });
    let error;
    let value = ($(this).val());
    if(!value.match(/^[a-zA-Zァ-ン]+$/)){
      error = true;
    }
    console.log(error)
    if(error){
      $(this).css('border','1px solid red');
      $(this).parent().append('<div class="error-message">名カナ を入力してください</div>');
    }
  });
  $('.member-info').find('#user_email').on('change',function(e){
    $('.member-info').find('#user_email').each(function(){
      $(this).css('border','1px solid #ccc');
      $(this).next(".error-message").remove();
    });
    let error;
    let value = ($(this).val());
    if(!value.match(/^\S+@\S+\.\S+$/)){
      error = true;
    }
    console.log(error)
    if(error){
      $(this).css('border','1px solid red');
      $(this).parent().append('<div class="error-message">フォーマットが不適切です</div>');
    }
  });
  $('.member-info').find('#user_password').on('change',function(e){
    $('.member-info').find('#user_password').each(function(){
      $(this).css('border','1px solid #ccc');
      $(this).next(".error-message").remove();
    });
    let error;
    let value = ($(this).val());
    var password = value
    if(!value.match(/^(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,128}$/i)){
      error = true;
    }
    console.log(error)
    if(error){
      $(this).css('border','1px solid red');
      $(this).parent().append('<div class="error-message">パスワードは6文字以上128文字以下で入力してください</div>');
    }
  });
  $('.member-info').find('#user_password_confirmation').on('keyup',function(e){
    $('.member-info').find('#user_password_confirmation').each(function(){
      $(this).css('border','1px solid #ccc');
      $(this).next(".error-message").remove();
    });
    var password = ($('.member-info').find('#user_password').val());
    let error;
    let value = ($(this).val());
    if(value !== password){
      error = true;
    }
    console.log(error)
    if(error){
      $(this).css('border','1px solid red');
      $(this).parent().append('<div class="error-message">パスワードとパスワード (確認) が一致しません</div>');
    }
  });

  $('.to-step3').on('click',function(e){
    let check = 0;
    $('.sms').find('input,select').each(function(){
      $(this).css('border','1px solid #ccc');
      $(".error-message").remove();
    });
    $('.sms').find('input,select').each(function(){
      let error;
      let value = ($(this).val());
      if(value == ""){
        error = true;
      }
      else if(!value.match(/[^\s\t]/)){
        error = true;
      }
      if(error){
        $(this).css('border','1px solid red');
        $(this).parent().append('<div class="error-message">必要事項を入力してください</div>');
        check++
      }
    });
    if(check >= 1){
      check = 0
    }
    else{
      $(".registrations__wrapper__step2").hide();
      $(".registrations__wrapper__step3").show();
    }
  });
  $('.to-step4').on('click',function(e){
    let check = 0;
    $('.sms-confirmation').find('input,select').each(function(){
      $(this).css('border','1px solid #ccc');
      $(".error-message").remove();
    });
    $('.sms-confirmation').find('input,select').each(function(){
      let error;
      let value = ($(this).val());
      if(value == ""){
        error = true;
      }
      else if(!value.match(/[^\s\t]/)){
        error = true;
      }
      if(error){
        $(this).css('border','1px solid red');
        $(this).parent().append('<div class="error-message">必要事項を入力してください</div>');
        check++
      }
    });
    if(check >= 1){
      check = 0
    }
    else{
      $(".registrations__wrapper__step3").hide();
      $(".registrations__wrapper__step4").show();
      $('.bar-step2').addClass('active-after');
      $('.bar-step4').addClass('active');
      $('.bar-step4').addClass('active-before');
    }
  });
  $('.to-step5').on('click',function(e){
    let check = 0;
    $('.address').find('#user_postal_code,#user_cities,#user_address,#user_prefecture,#user_phone_number').each(function(){
      $(this).css('border','1px solid #ccc');
      $(".error-message").remove();
    });
    $('.address').find('#user_postal_code,#user_cities,#user_address,#user_prefecture').each(function(){
      let error;
      let value = ($(this).val());
      if(value == "" || value == "---"){
        error = true;
      }
      else if(!value.match(/[^\s\t]/)){
        error = true;
      }
      if(error){
        $(this).css('border','1px solid red');
        $(this).parent().append('<div class="error-message">必要事項を入力してください</div>');
        check++
      }
    });
    $('.address').find('#user_postal_code').each(function(){
      let error;
      let value = ($(this).val());
      if(!value.match(/^\d{7}$/)){
        error = true;
      }
      if(value){
        if(error){
          $(this).css('border','1px solid red');
          $(this).parent().append('<div class="error-message">7 文字で入力してください</div>');
          check++
        }
      }
    });
    $('.address').find('#user_phone_number').each(function(){
      let error;
      let value = ($(this).val());
      if(!value.match(/^\d{11}$/)){
        error = true;
      }
      if(value){
        if(error){
          $(this).css('border','1px solid red');
          $(this).parent().append('<div class="error-message">11 文字で入力してください</div>');
          check++
        }
      }
    });
    if(check >= 1){
      check = 0
    }
    else{
      $(".registrations__wrapper__step4").hide();
      $(".registrations__wrapper__step5").show();
      $('.bar-step4').addClass('active-after');
      $('.bar-step5').addClass('active-after');
      $('.bar-step5').addClass('active');
      $('.bar-step5').addClass('active-before');
    }
  });
  $('.address').find('#user_postal_code').on('change',function(e){
    $('.address').find('#user_postal_code').each(function(){
      $(this).css('border','1px solid #ccc');
      $(this).next(".error-message").remove();
    });
    let error;
    let value = ($(this).val());
    if(!value.match(/^\d{7}$/)){
      error = true;
    }
    console.log(error)
    if(error){
      $(this).css('border','1px solid red');
      $(this).parent().append('<div class="error-message">7 文字で入力してください</div>');
    }
  });
  $('.address').find('#user_phone_number').on('change',function(e){
    $('.address').find('#user_phone_number').each(function(){
      $(this).css('border','1px solid #ccc');
      $(this).next(".error-message").remove();
    });
    let error;
    let value = ($(this).val());
    if(!value.match(/^\d{11}$/)){
      error = true;
    }
    console.log(error)
    if(error){
      $(this).css('border','1px solid red');
      $(this).parent().append('<div class="error-message">11 文字で入力してください</div>');
    }
  });
});
