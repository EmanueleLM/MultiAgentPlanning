(define (problem meeting_planning_example22-problem)
  (:domain meeting_planning_example22)
  ;; Objects: timepoints chosen to represent the needed schedule.
  (:objects
    visitor andrew - agent
    presidio union_square - location
    ;; time objects (minutes since midnight): t540=09:00, t562=09:22, t586=09:46, t651=10:51, t673=11:13, t675=11:15, t780=13:00
    t540 t562 t586 t651 t673 t675 t780 - time
  )

  (:init
    ;; Initial visitor state: at Presidio at 09:00 (t540)
    (at visitor presidio)
    (at-time visitor t540)

    ;; Andrew's declared presence at Union Square starting at 11:15 (t675).
    ;; We place Andrew at union_square and at-time t675 to model his availability window structurally.
    (at andrew union_square)
    (at-time andrew t675)

    ;; Precomputed travel transitions (respecting given durations):
    ;; presidio -> union_square = 22 minutes, union_square -> presidio = 24 minutes.
    (can-travel presidio union_square t540 t562)   ; 09:00 -> 09:22
    (can-travel union_square presidio t562 t586)   ; 09:22 -> 09:46
    (can-travel presidio union_square t651 t673)   ; 10:51 -> 11:13 (arrive slightly before 11:15)

    ;; Wait (idle) transitions for the visitor to advance between key timepoints.
    (can-wait t586 t651)  ; 09:46 -> 10:51
    (can-wait t673 t675)  ; 11:13 -> 11:15

    ;; Meeting availability: Andrew is available starting at 11:15 (t675).
    ;; can-meet encodes the allowed meeting start->end interval; selecting t675->t780 ensures the meeting
    ;; lasts at least the required minimum of 105 minutes in this instance (11:15 -> 13:00 = 105 minutes).
    (can-meet t675 t780)
  )

  ;; Hard goal: visitor must meet Andrew for the approved interval.
  (:goal (and (met-andrew)))
)