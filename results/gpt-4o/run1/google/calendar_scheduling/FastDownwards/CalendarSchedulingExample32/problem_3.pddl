(define (problem schedule_for_emily_melissa_frank)
  (:domain meeting_scheduling)
  (:objects
    emily melissa frank - person
    slot_9_0_to_9_30 slot_9_30_to_10_0 slot_10_0_to_10_30 slot_10_30_to_11_0
    slot_11_0_to_11_30 slot_11_30_to_12_0 slot_12_0_to_12_30 slot_12_30_to_13_0
    slot_13_0_to_13_30 slot_13_30_to_14_0 slot_14_0_to_14_30 slot_14_30_to_15_0
    slot_15_0_to_15_30 slot_15_30_to_16_0 slot_16_0_to_16_30 slot_16_30_to_17_0 - time_slot
  )
  (:init
    (busy emily slot_10_0_to_10_30)
    (busy emily slot_11_30_to_12_0)
    (busy emily slot_14_0_to_14_30)
    (busy emily slot_16_0_to_16_30)

    (busy melissa slot_9_30_to_10_0)
    (busy melissa slot_14_30_to_15_0)

    (busy frank slot_10_0_to_10_30)
    (busy frank slot_11_0_to_11_30)
    (busy frank slot_12_30_to_13_0)
    (busy frank slot_13_30_to_14_0)
    (busy frank slot_15_0_to_16_0)
    (busy frank slot_16_30_to_17_0)

    (prefers_before_9_30 frank)

    (free_to_meet emily slot_9_0_to_9_30)
    (free_to_meet emily slot_9_30_to_10_0)
    (free_to_meet emily slot_10_30_to_11_0)
    (free_to_meet emily slot_12_0_to_12_30)
    (free_to_meet emily slot_13_0_to_13_30)
    (free_to_meet emily slot_15_0_to_15_30)
    (free_to_meet emily slot_15_30_to_16_0)

    (free_to_meet melissa slot_9_0_to_9_30)
    (free_to_meet melissa slot_10_0_to_10_30)
    (free_to_meet melissa slot_10_30_to_11_0)
    (free_to_meet melissa slot_11_0_to_11_30)
    (free_to_meet melissa slot_11_30_to_12_0)
    (free_to_meet melissa slot_12_0_to_12_30)
    (free_to_meet melissa slot_12_30_to_13_0)
    (free_to_meet melissa slot_13_0_to_13_30)
    (free_to_meet melissa slot_13_30_to_14_0)
    (free_to_meet melissa slot_14_0_to_14_30)
    (free_to_meet melissa slot_15_0_to_15_30)
    (free_to_meet melissa slot_15_30_to_16_0)
    (free_to_meet melissa slot_16_0_to_16_30)
    (free_to_meet melissa slot_16_30_to_17_0)

    (free_to_meet frank slot_9_0_to_9_30)
    (free_to_meet frank slot_9_30_to_10_0)
    (free_to_meet frank slot_11_30_to_12_0)
    (free_to_meet frank slot_13_0_to_13_30)
    (free_to_meet frank slot_14_0_to_14_30)
  )
  (:goal
    (exists (?t - time_slot) (meeting_scheduled ?t))
  )
)