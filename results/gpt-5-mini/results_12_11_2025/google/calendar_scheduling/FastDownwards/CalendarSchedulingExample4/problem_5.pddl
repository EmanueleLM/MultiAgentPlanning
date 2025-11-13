(define (problem schedule-meeting-monday)
  (:domain calendar-scheduling)
  (:objects
    donna john billy - participant
    slot_10_00 - timeslot
  )

  (:init
    (within-work slot_10_00)
  )

  (:goal (scheduled slot_10_00))
)