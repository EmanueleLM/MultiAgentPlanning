(define (problem meeting_planning_example22-problem)
  (:domain meeting_planning_example22)
  ;; Objects: only the timepoints needed to represent feasible transitions for this instance.
  (:objects
    visitor andrew - agent
    presidio union_square - location
    t540 t562 t586 t651 t673 t675 t780 - time
  )

  (:init
    ;; Initial visitor state: at Presidio at 09:00 (t540)
    (at visitor presidio)
    (at-time visitor t540)

    ;; Precomputed travel transitions (respecting the given durations: presidio->union_square = 22, union_square->presidio = 24)
    ;; The listed pairs are sufficient for feasible itineraries that reach a meeting start at t675.
    (can-travel presidio union_square t540 t562)   ; 09:00 -> 09:22
    (can-travel union_square presidio t562 t586)   ; 09:22 -> 09:46
    (can-travel presidio union_square t651 t673)   ; 10:51 -> 11:13 (example return trip to arrive before meeting)

    ;; Allow long idle/wait transitions where the visitor stays in place between chosen timepoints.
    ;; Using a small set of jump-waits (rather than minute-by-minute next links) keeps the model compact.
    (can-wait t586 t651)  ; wait at Presidio from 09:46 -> 10:51
    (can-wait t673 t675)  ; short wait at Union Square to align with meeting start at 11:15

    ;; Meeting availability: Andrew is available from 11:15 (t675) through 17:15 (beyond our horizon).
    ;; can-meet enforces the meeting interval and minimum duration (here we include t675->t780 which is 105+ minutes).
    ;; In this instance the required minimum meeting length of 105 minutes is captured by choosing t675->t780.
    (can-meet t675 t780)
  )

  ;; Hard goal: visitor must meet Andrew for an approved interval.
  (:goal (and (met-andrew)))
)