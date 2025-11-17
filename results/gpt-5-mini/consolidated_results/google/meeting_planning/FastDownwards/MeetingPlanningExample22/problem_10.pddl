(define (problem meet-andrew-problem)
  (:domain meet-andrew)

  (:objects
    presidio union_square - location

    ;; explicit time points (minutes from midnight) used to enforce contiguous durations exactly
    t540 t600 t630 t645 t653 t675 t780 - time
  )

  (:init
    ;; start at Presidio at 09:00 (540)
    (at presidio t540)
    (now t540)

    ;; mark which location objects correspond to Presidio and Union Square
    (is_presidio presidio)
    (is_union_square union_square)

    ;; Allowed contiguous waiting increments at Presidio: 540 -> 600 (+60) -> 630 (+30) -> 645 (+15) -> 653 (+8)
    (succ60  t540 t600)
    (succ30  t600 t630)
    (succ15  t630 t645)
    (succ8   t645 t653)

    ;; Travel Presidio -> Union Square: departure at 653 -> arrive 675 (+22)
    (succ22  t653 t675)

    ;; Meeting contiguous occupancy: meeting blocks of 105 minutes starting at allowed starts.
    ;; Andrew's availability is [675,1035]; meeting must be contiguous 105 minutes within that window.
    ;; Provided here: start at 675 -> end 780 (+105) (this enforces meeting starting at 11:15 and finishing at 13:00)
    (succ105 t675 t780)
  )

  ;; Goal: have performed the contiguous 105-minute meeting with Andrew
  (:goal (met-andrew))
)