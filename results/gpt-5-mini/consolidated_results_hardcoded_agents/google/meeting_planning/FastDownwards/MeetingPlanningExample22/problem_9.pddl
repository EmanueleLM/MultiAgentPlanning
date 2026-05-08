(define (problem meet-andrew-problem)
  (:domain meet-andrew)

  (:objects
    presidio union_square - location
    t540 t600 t630 t645 t653 t675 t780 - time
  )

  (:init
    ;; start at Presidio at 09:00 (540)
    (at presidio t540)
    (now t540)

    ;; mark which location objects correspond to Presidio and Union Square
    (is_presidio presidio)
    (is_union_square union_square)

    ;; Explicit, ordered successor facts encoding allowed contiguous time progressions (durations enforced structurally)
    ;; wait chain at Presidio: 540 -> 600 (+60) -> 630 (+30) -> 645 (+15) -> 653 (+8)
    (succ60  t540 t600)
    (succ30  t600 t630)
    (succ15  t630 t645)
    (succ8   t645 t653)

    ;; travel Presidio -> Union Square: 653 -> 675 (+22)
    (succ22  t653 t675)

    ;; meeting contiguous occupancy: start 675 -> end 780 (+105)
    ;; This pair is provided only if the meeting starts at or after Andrew's availability start (675) and finishes by 1035.
    (succ105 t675 t780)
  )

  ;; goal: have performed the contiguous 105-minute meeting with Andrew
  (:goal (met-andrew))
)