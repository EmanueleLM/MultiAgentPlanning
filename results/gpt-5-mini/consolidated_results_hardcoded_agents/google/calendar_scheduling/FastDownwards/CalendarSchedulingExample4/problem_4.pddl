(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    donna john billy - participant
    slot_10_00 - timeslot
  )

  (:init
    ;; The auditor determined the only mutually available 30-minute slot is 10:00-10:30.
    ;; Declare that slot as within work hours and do not assert any busy facts for it,
    ;; so all three participants are explicitly free at this declared slot.
    (within-work slot_10_00)
  )

  ;; Goal: schedule the meeting at the auditor-provided feasible slot.
  (:goal (scheduled slot_10_00))
)