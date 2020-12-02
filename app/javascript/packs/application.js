// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

 //= require jquery
 //= require jquery_ujs
 
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import "../plugins/concept-plugins/switchery/switchery.min.js";
import "../plugins/concept-plugins/icomoon/style.css";
import "../plugins/concept-plugins/jquery/jquery-3.1.0.min.js";
import "../plugins/concept-plugins/bootstrap/popper.min.js";
import "../plugins/concept-plugins/bootstrap/js/bootstrap.min.js";
import "../plugins/concept-plugins/jquery-slimscroll/jquery.slimscroll.min.js";
import "../plugins/concept-plugins/apexcharts/dist/apexcharts.min.js";
import "../plugins/concept-plugins/chartjs/chart.min.js";
import "../../assets/js/concept.min.js";
import "../../assets/js/pages/dashboard.js";
import "../../assets/js/pages/profile.js";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';
import { initiateFlatPickr } from "../plugins/flatpickr";
import { flightSearch } from "../components/flight_search/flight_search.js"


// Calling imported Functions with Event Listener

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
  initiateFlatPickr();
  flightSearch();
});

//Not working 
previewImageOnFileSelect();
import { previewImageOnFileSelect } from "../plugins/photo_preview.js";

