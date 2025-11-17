(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    donna john billy - participant
    slot_10_00 - timeslot
  )

  (:init
    ;; Only the auditor-provided feasible timeslot is declared within work hours.
    (within-work slot_10_00)
  )

  ;; Goal: schedule the meeting at the auditor-provided slot.
  (:goal (scheduled slot_10_00))
)