(define (problem composite-meeting-problem)
  (:domain composite-meeting-scheduling)

  (:objects
    diana ethan janet - person
    slot1 slot2 slot3 - slot
  )

  (:init
    (available diana slot1)
    (available diana slot2)
    (available diana slot3)

    (available ethan slot1)
    (available ethan slot2)
    (available ethan slot3)

    (janet_before12 slot1)
    (janet_before12 slot2)
    (available janet slot1)
    (available janet slot2)
  )

  (:goal (janet_scheduled slot2))
)