(define (problem schedule-meeting-instance)
  (:domain multi-agent-scheduling)
  (:objects
    alice bob - agent
    room1 - room
    slot1 slot2 slot3 - slot
    meeting1 - meeting
  )

  (:init
    (free-slot slot1)
    (free-slot slot2)
    (free-slot slot3)
    (room-free room1 slot1)
    (room-free room1 slot2)
    (room-free room1 slot3)
    (available alice slot1)
    (available alice slot2)
    (available alice slot3)
    (available bob slot2)
    (available bob slot3)
    (required meeting1 alice)
    (required meeting1 bob)
  )

  (:goal (and
    (scheduled meeting1 slot2 room1)
    (attending alice meeting1)
    (attending bob meeting1)
  ))
)