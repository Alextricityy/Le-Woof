

import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!


// console.log(BOOKING

const startedDates = document.getElementById("bookingStart").dataset.dates
const endedDates = document.getElementById("bookingEnd").dataset.dates
console.log(startedDates)
flatpickr(".datepicker", {
    enableTime: true,
    // dateFormat: "Y-m-d",
    disable: [
        {
            from: startedDates,
            to: endedDates
        }
    ]

})

