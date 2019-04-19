import flatpickr from "flatpickr"
import "flatpickr/dist/themes/material_blue.css" // Note this is important!

flatpickr(".datetimepicker", {
  enableTime: true,
  time_24hr: true,
  dateFormat: 'Z',
  altInput: true,
  altFormat: 'd-m-Y H:i'
  
})


flatpickr(".datepicker", {
  
})