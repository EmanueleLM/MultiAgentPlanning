(define (problem multi-party-meeting-problem)
  (:domain multi-party-meeting-domain)

  (:objects
     slot_9_10 slot_11_12 slot_15_16 - slot
  )

  (:init
    (free-arthur slot_15_16)

    (free-michael slot_9_10)
    (free-michael slot_11_12)
    (free-michael slot_15_16)

    (free-samantha slot_9_10)
    (free-samantha slot_11_12)
  )

  (:goal
    (and
      (meeting-at slot_9_10)
      (scheduled-arthur slot_9_10)
      (scheduled-michael slot_9_10)
      (scheduled-samantha slot_9_10)
    )
  )
)