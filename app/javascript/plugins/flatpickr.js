import flatpickr from "flatpickr";

import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

flatpickr("#range_start", {
  altInput: true,
  plugins: [new rangePlugin({ input: "#range_end" })],

});

flatpickr("#latest_arrival", {
  altInput: true,
  enableTime: true
});

flatpickr("#earliest_departure", {
  altInput: true,
  enableTime: true
});