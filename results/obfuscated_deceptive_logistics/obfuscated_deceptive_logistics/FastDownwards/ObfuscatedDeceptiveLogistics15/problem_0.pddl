(define (problem schedule-meeting-instance)
  (:domain multi-agent-scheduling)
  (:objects
    alice bob - agent
    room1 - room
    slot1 slot2 slot3 - slot
    meeting1 - meeting
  )

  (:init
    ; slots and room availability (no globally unavailable slot is marked free)
    (free-slot slot1)
    (free-slot slot2)
    (free-slot slot3)

    (room-free room1 slot1)
    (room-free room1 slot2)
    (room-free room1 slot3)

    ; agent availabilities (hard temporal constraints derived from preferences)
    ; Alice is available at all slots (prefers earliest, enforced by goal choice)
    (available alice slot1)
    (available alice slot2)
    (available alice slot3)

    ; Bob is unavailable at slot1 (cannot attend at slot1), available at slot2 and slot3
    (available bob slot2)
    (available bob slot3)

    ; meeting requirements: both agents required
    (required meeting1 alice)
    (required meeting1 bob)
  )

  ; Goal encodes earliest slot that satisfies every hard constraint (slot1 fails because Bob unavailable)
  (:goal (and
    (scheduled meeting1 slot2 room1)
    (attending alice meeting1)
    (attending bob meeting1)
  ))
)