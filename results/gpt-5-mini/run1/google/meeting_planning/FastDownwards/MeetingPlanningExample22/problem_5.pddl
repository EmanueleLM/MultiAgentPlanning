(define (problem meeting_planning_example22-problem)
  (:domain meeting_planning_example22)
  ;; Objects: explicit timepoints used in this instance.
  ;; Times are named as minutes-since-midnight for clarity:
  ;; t540=09:00, t562=09:22, t586=09:46, t651=10:51, t673=11:13, t675=11:15, t780=13:00, t1035=17:15
  (:objects
    visitor andrew - agent
    presidio union_square - location
    t540 t562 t586 t651 t673 t675 t780 t1035 - time
  )

  (:init
    ;; Identity markers
    (is-visitor visitor)
    (is-andrew andrew)

    ;; Initial physical/time state:
    (at visitor presidio)
    (at-time visitor t540)      ; visitor arrives at Presidio at 09:00

    (at andrew union_square)
    (at-time andrew t675)       ; Andrew is present at Union Square starting at 11:15 (t675)

    ;; Provided travel transitions (only those grounded in the input or needed for feasibility).
    ;; Presidio -> Union Square travel takes 22 minutes; the pair below encodes a departure at 10:51 (t651) -> arrive 11:13 (t673).
    (can-travel presidio union_square t651 t673)

    ;; Idle/wait transitions (precomputed allowed time advances for the visitor and small waits around arrival).
    ;; Allow the visitor to wait at Presidio from 09:00 to 10:51 so they can depart at t651.
    (can-wait t540 t651)
    ;; Allow short wait after arriving 11:13 (t673) until 11:15 (t675) to begin the meeting exactly at Andrew's start time.
    (can-wait t673 t675)

    ;; Meeting availability & minimum duration:
    ;; Andrew is available starting at 11:15 (t675) and a meeting 11:15->13:00 (t675->t780) satisfies the required 105 minutes.
    (can-meet t675 t780)
  )

  ;; Hard goal: ensure visitor meets Andrew for the required interval.
  (:goal (and (met-andrew)))
)