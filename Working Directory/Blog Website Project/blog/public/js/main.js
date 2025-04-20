function newsletterEmail(e) {
  e.preventDefault();
  var form = $("#formNewsletter").get(0);
  var formData = new FormData(form);

  $.ajax({
    url: "/newsletter",
    type: "post",
    dataType: "text",
    data: formData,
    contentType: false,
    processData: false,
    success: function(res) {
      let result = JSON.parse(res);
      let msg = `<div class="alert alert-success mx-4 text-center"> <strong><i class="fas fa-check"></i> Success! </strong> ${result.msg}</div>`;
      $("#msg").html(msg);
    },
    error: function(res) {
      let result = JSON.parse(res.responseText);
      let msg = `<div class="alert alert-danger mx-4 text-center"> <strong><i class="fas fa-times"></i> Error! </strong> ${result.msg}</div>`;
      $("#msg").html(msg);
    }
  });
}


$('#author-submit').click(function(e) {
  e.preventDefault();
  let name = $('#name').val();
  let username = $('#username').val();
  let password = $('#password').val();
  let email = $('#email').val();
  

  $.ajax({
    
    url: "/author",
    type: "post",
    dataType: "text",
    data: {'name' : name, 'username': username,'password': password,'email': email,

    },
    success: function(res) {
      let result = JSON.parse(res);
      $("#formContact").trigger("reset");
      $("#modal-author").modal("hide");
      $("#msgForAuthor").html(
        '<div class="alert alert-success" style="text-align:center"><strong><span class="fa fa-check"></span>  </strong>' +
          result.msg +
          "</div>"
      );
      
    },
    error: function(res) {
      let result = JSON.parse(res.responseText);
      $("#e-name").html(result.name);
      $("#e-username").html(result.username);
      $("#e-password").html(result.password);
      $("#e-email").html(result.email);
    }

  })
})


$('#btn-submit').click(function(e) {
  e.preventDefault();
  let name = $('#c-name').val();
  let email = $('#c-email').val();
  let message = $('#message').val();

  $.ajax({
    
    url: "/contact",
    type: "post",
    dataType: "text",
    data: {'name' : name, 'email': email, 'message': message

    },
    success: function(res) {
      let result = JSON.parse(res);

      $("#formContact").trigger("reset");
      $("#modal-contact").modal("hide");
      $("#msgForContact").html(
        '<div class="alert alert-success" style="text-align:center"><strong><span class="fa fa-check"></span>  </strong>' +
          result.msg +
          "</div>"
      );
      
    },
    error: function(res) {
      let result = JSON.parse(res.responseText);

      $("#namee").html(result.name);
      $("#emaill").html(result.email);
      $("#messag").html(result.message);
    }

  })
})


function loadMorePost(obj) {
  const skipValue = obj.getAttribute("data-skip");

  $("#load-more-label").text("Loading...");
  $("#load-more").addClass("spinner");

  $.ajax({
    url: "/post/skip",
    type: "post",
    dataType: "text",
    data: { skip: skipValue },
    success: function(res) {
      let result = JSON.parse(res);
      if (result.length > 0) {
        $("#post-container").append(result.join(""));
        $(".new-post").fadeIn(1000);
        obj.setAttribute(
          "data-skip",
          Number(skipValue) + Number(result.length)
        );
        $("#load-more").removeClass("spinner");
        $("#load-more-label").text("Load more...");
      } else {
        $("#load-more").removeClass("spinner");
        $("#load-more-label").text("No more post to load");
      }
    },
    error: function(res) {
      let result = JSON.parse(res.responseText);
      $("#load-more").removeClass("spinner");
      $("#load-more-label").text(
        "Something went wrong, please try again later"
      );
    }
  });
}
