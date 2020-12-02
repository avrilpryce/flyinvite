import flatpickr from "flatpickr";

const initiateFlatPickr = () => {
  flatpickr(".datepicker", {dateFormat: "d/m/Y"});


  flatpickr("#latest_arrival", {
    altInput: true,
    enableTime: true
  });

  flatpickr("#earliest_departure", {
    altInput: true,
    enableTime: true
  });
}

export { initiateFlatPickr }
