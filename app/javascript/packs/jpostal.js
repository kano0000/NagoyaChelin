import "jquery-jpostal-ja";
// import $ from "jquery"; // jQueryがインポートされていることを確認

// function jpostal() {
//   console.log("jpostal function called");
//   $('#zipcode').jpostal({
//     postcode: ['#zipcode'],
//     address: {
//       '#store_address': '%3%4%5'
//     }
//   });
// }

// $(document).on("turbolinks:load", function() {
//   console.log("Turbolinks load event fired");
//   jpostal();
// });

function jpostal() {
  $('#zipcode').jpostal({   
    postcode : ['#zipcode'],
    address : {
      '#store_address': '%3%4%5'
    }
  });
}
$(document).on("turbolinks:load", jpostal);