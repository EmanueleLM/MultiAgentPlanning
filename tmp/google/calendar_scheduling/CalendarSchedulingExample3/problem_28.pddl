(define (problem schedule-collective-meeting)
  (:domain collective-scheduling)

  (:objects
    time_9_10 time_10_11 time_11_12 time_12_13
    time_13_14 time_14_15 time_15_16 time_16_17 - time_slot
  )

  (:init
    (busy arthur time_9_10)
    (busy arthur time_10_11)
    (busy arthur time_16_17)
    (free arthur time_11_12)
    (free arthur time_12_13)
    (free arthur time_13_14)
    (free arthur time_14_15)
    (free arthur time_15_16)

    (free michael time_9_10)
    (free michael time_10_11)
    (free michael time_11_12)
    (free michael time_12_13)
    (busy michael time_13_14)
    (busy michael time_14_15)
    (free michael time_15_16)
    (free michael time_16_17)
    
    (free samantha time_9_10)
    (busy samantha time_10_11)
    (busy samantha time_11_12)
    (busy samantha time_12_13)
    (busy samantha time_13_14)
    (free samantha time_14_15)
    (free samantha time_15_16)
    (busy samantha time_16_17)

    (next time_9_10 time_10_11)
    (next time_10_11 time_11_12)
    (next time_11_12 time_12_13)
    (next time_12_13 time_13_14)
    (next time_13_14 time_14_15)
    (next time_14_15 time_15_16)
    (next time_15_16 time_16_17)
  )

  (:goal
    (exists (?t1 ?t2 - time_slot)
      (and (meeting_scheduled ?t1 ?t2)
           (next ?t1 ?t2)))))