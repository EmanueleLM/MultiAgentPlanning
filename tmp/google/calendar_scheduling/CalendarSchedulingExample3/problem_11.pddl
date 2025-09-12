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
    (available arthur time_11_12)
    (available arthur time_12_13)
    (available arthur time_13_14)
    (available arthur time_14_15)
    (available arthur time_15_16)

    (available michael time_9_10)
    (available michael time_10_11)
    (available michael time_11_12)
    (available michael time_12_13)
    (busy michael time_13_14)
    (busy michael time_14_15)
    (available michael time_15_16)
    (available michael time_16_17)

    (available samantha time_9_10)
    (busy samantha time_10_11)
    (busy samantha time_11_12)
    (busy samantha time_12_13)
    (busy samantha time_13_14)
    (available samantha time_14_15)
    (available samanatha time_15_16)
    (busy samantha time_16_17)

    (consecutive time_11_12 time_12_13)
    (consecutive time_12_13 time_13_14)
    (consecutive time_13_14 time_14_15)
    (consecutive time_14_15 time_15_16)
    (= (total-cost) 0)
  )

  (:goal
    (meeting_scheduled))

  (:metric minimize (total-cost))
)