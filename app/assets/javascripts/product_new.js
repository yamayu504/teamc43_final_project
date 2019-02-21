$(document).on('turbolinks:load', function(){
    // product_idを取り込む
  var before_li = $('.product__sell__form__images__container__preview li').length;
  $('.product__sell__form__images__container__guide div').removeClass();
  $('.product__sell__form__images__container__guide div').addClass('have__image--' + before_li).trigger("create");
  //image_uploader
  function buildImage(loadedImageUri){
    var html =
    `<li>
      <img src=${loadedImageUri}>
      <div class="product__sell__form__images__container__preview__box">
        <div class="product__sell__form__images__container__preview__box__edit" >
          編集
        </div>
        <div>
          <a class="product__sell__form__images__container__preview__box__delete">削除</a>
        </div>
      </div>
    </li>`
    return html
  };
  var url = location.href
  // editように初期値でliが存在する場合のclassを付与
  var files_array = [];
  // ドラッグ&ドロップ
  $('.product__sell__form__images__container__guide').on('dragover',function(e){
      e.preventDefault();
  });
  $('.product__sell__form__images__container__guide').on('drop',function(event){
    event.preventDefault();
    // e.dataTransfer = e.originalEvent.dataTransfer;
    var count_li = $('.product__sell__form__images__container__preview li').length;
    files = event.originalEvent.dataTransfer.files;
    var limit    = 4 - count_li;
    var total_li = count_li + files.length;
    if (files.length > limit){
      $("ファイルの数が多すぎます。").appendTo(".product__sell__form__images__container__guide__error");
    }else{
      $(".product__sell__form__images__container__guide__error").children().remove();
      // ファイルフォームの追加
      for (var i=0; i<files.length; i++) {
        files_array.push(files[i])
        var fileReader = new FileReader();
        fileReader.onload = function( event ) {
          var loadedImageUri = event.target.result;
          $(buildImage(loadedImageUri,)).appendTo(".product__sell__form__images__container__preview ul").trigger("create");
        };
        fileReader.readAsDataURL(files[i]);
      }
    }
    $('.product__sell__form__images__container__guide div').removeClass();
    $('.product__sell__form__images__container__guide div').addClass('have__image--' + total_li).trigger("create");
  });

  //削除の記述
  $(document).on('click','.product__sell__form__images__container__preview a', function(){
    var index = $(".product__sell__form__images__container__preview a").index(this);
    // 既存のimagesか、新規のimagesかをbefore_liとindexで区別する。
    if (before_li >= (index + 1)){
      // paramsから持ってきた値を削除する。
      input = (index + 1)
      var image_id = $(this).parent().parent().parent().attr("data-id");
      $.ajax({
        url:         "/p_images/" + image_id,
        type:        "DELETE",
        data:        input,
        contentType: false,
        processData: false,
        dataType:   'json',
      })
      .done(function(data){
       before_li = before_li - 1
      })
      .fail(function(XMLHttpRequest, textStatus, errorThrown){
      });
    }else{

      files_array.splice((index - before_li), 1);
    };
    $(this).parent().parent().parent().remove();
    var after_li = $('.product__sell__form__images__container__preview li').length;
    $('.product__sell__form__images__container__guide div').removeClass();
    $('.product__sell__form__images__container__guide div').addClass('have__image--' + after_li).trigger("create");
  });

  // newの際の分岐
  $('#new_product').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    var i = 0
    files_array.forEach(function(p_file){
     formData.append("p_image[p_images][]" , p_file)
     i = i + 1
    });
    $.ajax({
      url:         '/products',
      type:        "POST",
      data:        formData,
      contentType: false,
      processData: false,
      dataType:   'json',
      // 送る前に、disabledを追加する
    })
    .done(function(data){
      // 正しく、遷移した場合の処理
      alert('出品に成功しました！');
      window.location.href = "/";
    })
    // failは通信処理ができなかった時の処理
    .fail(function(XMLHttpRequest, textStatus, errorThrown){
      $('.product__sell__form__title div').remove();
      $('<div class="flash flash__alert">入力に不備があります。 再度入力してください。</div>').appendTo(".product__sell__form__title").trigger("create");
      $('.sell__product__done').prop('disabled', false);
      $('html,body').animate({scrollTop: 0}, 500, 'swing');
    });
  });
  // updateの時の動き。
  $('#new_product__edit').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData($(this).get(0));
    var i = 0
    files_array.forEach(function(p_file){
     formData.append("p_image[p_images][]" , p_file)
     i = i + 1
    });
     var url = location.href
     var product_id = url.match(/products\/(\d+)\/edit/)
     var edit_url = "/products/" + product_id[1]
    $.ajax({
      url:         edit_url,
      type:        "PATCH",
      data:        formData,
      contentType: false,
      processData: false,
      dataType:   'json',
      // 送る前に、disabledを追加する
    })
    .done(function(data){
      // 正しく、遷移した場合の処理
      window.location.href = "/";
      alert('商品の更新に成功しました！');
    })
    // failは通信処理ができなかった時の処理
    .fail(function(XMLHttpRequest, textStatus, errorThrown){
      $('.product__sell__form__title div').remove();
      $('<div class="flash flash__alert">入力に不備があります。 再度入力してください。</div>').appendTo(".product__sell__form__title").trigger("create");
      $('.sell__product__done').prop('disabled', false);
      $('html,body').animate({scrollTop: 0}, 500, 'swing');
    });
  });




  // ドロップダウンボックスの実装.
  // カテゴリーとサイズは、カテゴリー機能実装時にテーブルから値を持ってくる想定である為仮置きです。
  function buildselect(){
    var html =
    `<select name="product[category_id]" class="select-default"><option value="">---</option><option value="1">レディース</option><option value="2">メンズ</option><option value="3">ベビー・キッズ</option><option value="4">インテリア・住まい・小物</option><option value="5">本・音楽・ゲーム</option><option value="1328">おもちゃ・ホビー・グッズ</option><option value="6">コスメ・香水・美容</option><option value="7">家電・スマホ・カメラ</option><option value="8">スポーツ・レジャー</option><option value="9">ハンドメイド</option><option value="1027">チケット</option><option value="1318">自動車・オートバイ</option><option value="10">その他</option></select>`
    return html
  };
  function buildsizeselect(){
  var html =
  `<label class="form__label">サイズ<span class="form__require">必須</span></label><select name="product[size]"class="select-default"><option value="0">---</option><option value="1">XXS以下</option><option value="2">XS(SS)</option><option value="3">S</option><option value="4">M</option><option value="5">L</option><option value="1328">XL</option><option value="6">2L</option><option value="7">3XL</option><option value="8">4XL</option><option value="9">FREE SIZE</option></select>`
  return html
  };
  function buildbrand(){
  var html =
  `<label class="form__label">
    ブランド
    <span class="form__arbitary">
      任意
    </span>
   </label>
   <input placeholder="例) シャネル" class="input__default" type="text" name="product[brand_id]" id="product_brand_id", autocomplete="off">`
  return html
  };
  $('.product__sell__form__sellcontent__detail__dropdown__category__default select').change(function(){
    $('.category__children').children().remove();
    $('.size__brand__remover').children().remove();
    var htmlselect = buildselect()
    $('.product__sell__form__sellcontent__detail__dropdown__category__child').append(htmlselect);
  });
  $(document).on('change','.product__sell__form__sellcontent__detail__dropdown__category__child select', function(){
    $('.product__sell__form__sellcontent__detail__dropdown__category__grandson').children().remove();
    var htmlselect = buildselect()
    $('.product__sell__form__sellcontent__detail__dropdown__category__grandson').append(htmlselect);
  });
  $(document).on('change',' .product__sell__form__sellcontent__detail__dropdown__category__grandson select', function(){
    $('.size__brand__remover').children().remove();
    var htmlsizeselect = buildsizeselect()
    var htmlbrand = buildbrand()
    $('.product__sell__form__sellcontent__detail__dropdown__category__size').append(htmlsizeselect);
    $('.product__sell__form__sellcontent__detail__dropdown__category__brand').append(htmlbrand);
  });

  ////// インクリメンタルサーチ
  function buildbrandlist(brands){
    var brand_lists = ""
    brands.forEach(function(brand){
    brand_lists = brand_lists +
      `<li id="${brand.id}">${brand.name}</li>`
  });
  var html =
    `<ul class="form-suggest-list">
      ${brand_lists}
    </ul>`
  return html
  };
  $(document).on("keyup","#product_brand_id", function() {
    // 入力欄の値を定義する。
    var input = $("#product_brand_id").val();
    if (input.length !== 0){
      $.ajax({
        type: 'GET',
        url:  '/products/search',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(brands){
        var brandselectlist = buildbrandlist(brands);
        $('.product__sell__form__sellcontent__detail__dropdown__category__brand__list').children().remove();
        $('.product__sell__form__sellcontent__detail__dropdown__category__brand__list').append(brandselectlist).trigger("create");

      })
      .fail(function(brands) {
        $('.product__sell__form__sellcontent__detail__dropdown__category__brand__list').children().remove();
      });
    }else{
      $('.product__sell__form__sellcontent__detail__dropdown__category__brand__list').children().remove();
    }
  });
  $(document).on('click','.product__sell__form__sellcontent__detail__dropdown__category__brand__list li',function(){
    var brandName = $(this).text()
    $('#product_brand_id').val(brandName);
    $('.product__sell__form__sellcontent__detail__dropdown__category__brand__list').children().remove();
  });


  ///////price__formの変動/////
  $('.product__sell__form__sellcontent__price__form__right input').on('keyup',function(){
    var price = Number($(this).val());
    if (price >= 100 | price <= 10000000000 ){
      $('.product__sell__form__sellcontent__price__form__commitionright span').text(Math.round(price * 0.1));
      $('.product__sell__form__sellcontent__price__form__totalright span').text(Math.round(price * 0.9))
    }else{
      $('.product__sell__form__sellcontent__price__form__commitionright span').text("-");
      $('.product__sell__form__sellcontent__price__form__totalright span').text("-");

    }
  });
});

