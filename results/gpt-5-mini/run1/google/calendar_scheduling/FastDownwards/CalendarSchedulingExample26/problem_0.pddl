(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  ;; Half-hour atomic slots from 09:00 to 16:30 (slots represent [start, start+30min) intervals).
  (:objects
    s09_00 s09_30 s10_00 s10_30 s11_00 s11_30 s12_00 s12_30
    s13_00 s13_30 s14_00 s14_30 s15_00 s15_30 s16_00 s16_30 - slot
  )

  (:init
    ;; Successor (immediate next half-hour) relations
    (successor s09_00 s09_30) (successor s09_30 s10_00)
    (successor s10_00 s10_30) (successor s10_30 s11_00)
    (successor s11_00 s11_30) (successor s11_30 s12_00)
    (successor s12_00 s12_30) (successor s12_30 s13_00)
    (successor s13_00 s13_30) (successor s13_30 s14_00)
    (successor s14_00 s14_30) (successor s14_30 s15_00)
    (successor s15_00 s15_30) (successor s15_30 s16_00)
    (successor s16_00 s16_30)

    ;; Consolidated availability (intersection of all participants), given as atomic half-hour slots:
    ;; From the cleaned combined availability: ["10:00-10:30", "11:30-12:00", "15:30-16:30"]
    ;; Mark the corresponding half-hour slots as available.
    (available-slot s10_00)
    (available-slot s11_30)
    (available-slot s15_30)
    (available-slot s16_00)

    ;; Meeting not yet scheduled
    (meeting-unscheduled)

    ;; Note: blocked-by-earlier facts are not asserted for any slot. If a start slot should be disallowed
    ;; because an earlier feasible start must be chosen, that would be asserted here (none in this input).
  )

  ;; Goal: meeting scheduled and all three participants have confirmed.
  ;; Because the meeting duration is 60 minutes (two consecutive half-hour slots),
  ;; and only slots s15_30 + s16_00 provide two consecutive available half-hours,
  ;; the goal fixes the scheduled start at s15_30 and requires ordered confirmation p1->p2->p3.
  (:goal (and
    (meeting-scheduled s15_30)
    (confirmed p1)
    (confirmed p2)
    (confirmed p3)
  ))
)