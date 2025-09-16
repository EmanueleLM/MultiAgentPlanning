(define (problem multi-party-meeting-problem)
  (:domain multi-party-meeting-domain)

  (:objects
     slot_9_10 slot_11_12 slot_15_16 - slot
  )

  (:init
    (free-arthur slot_15_16)

    (free-michael slot_15_16)
    (free-samantha slot_15_16)
  )

  (:goal
    (and
      (meeting-at slot_15_16)
      (scheduled-arthur slot_15_16)
      (scheduled-michael slot_15_16)
      (scheduled-samantha slot_15_16)
    )
  )
)