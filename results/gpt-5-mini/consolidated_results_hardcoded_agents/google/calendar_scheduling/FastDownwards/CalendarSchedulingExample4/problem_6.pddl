(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    donna john billy - participant
    slot_10_00 - timeslot
  )

  (:init
    ;; The auditor determined the only mutually available 30-minute slot is 10:00-10:30.
    (within-work slot_10_00)
    ;; No (busy ...) facts for slot_10_00 are declared for any participant,
    ;; enforcing that all three are free at this slot.
  )

  (:goal (scheduled slot_10_00))
)