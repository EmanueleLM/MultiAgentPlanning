(define (problem schedule-monday-meeting)
  (:domain meeting-scheduling)
  (:objects
    slot-monday-09-30 - slot
    arthur michael samantha - agent
  )
  (:init
    ; slot-monday-09-30 represents the one-hour slot Monday 09:30-10:30
    (free-arthur slot-monday-09-30)
    (free-michael slot-monday-09-30)
    (free-samantha slot-monday-09-30)
  )
  (:goal
    (meeting-scheduled)
  )
)