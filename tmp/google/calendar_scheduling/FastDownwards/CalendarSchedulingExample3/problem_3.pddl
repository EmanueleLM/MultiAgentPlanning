(define (problem multi-party-meeting-problem)
  (:domain multi-party-meeting-domain)

  (:objects
     slot_9_30_10_30 slot_12_00_13_00 slot_13_00_14_00 slot_14_00_15_00 slot_15_00_16_00 - slot
  )

  (:init
    (free-arthur slot_9_30_10_30)
    (free-michael slot_9_30_10_30)
    (free-samantha slot_9_30_10_30)
  )

  (:goal
    (and
      (meeting-at slot_9_30_10_30)
      (scheduled-arthur slot_9_30_10_30)
      (scheduled-michael slot_9_30_10_30)
      (scheduled-samantha slot_9_30_10_30)
    )
  )
)