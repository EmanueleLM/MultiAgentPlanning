(define (problem schedule-collective-meeting)
  (:domain collective-scheduling)

  (:objects
    arthur michael samantha - participant
    time_9_10 time_10_11 time_11_12 time_12_13
    time_13_14 time_14_15 time_15_16 time_16_17 - time_slot
  )

  (:init
    ;; Arthur's schedule
    (busy arthur time_9_10)
    (busy arthur time_10_11)
    (busy arthur time_11_12)
    (busy arthur time_15_16)
    (available arthur time_12_13)
    (available arthur time_13_14)
    (available arthur time_14_15)

    ;; Michael's schedule
    (available michael time_9_10)
    (available michael time_10_11)
    (available michael time_11_12)
    (available michael time_12_13)
    (busy michael time_13_14)
    (busy michael time_14_15)
    (available michael time_15_16)
    (available michael time_16_17)

    ;; Samantha's schedule
    (busy samantha time_9_10)
    (busy samantha time_10_11)
    (available samantha time_11_12)
    (busy samantha time_12_13)
    (busy samantha time_13_14)
    (available samantha time_14_15)
    (busy samantha time_15_16)
    (busy samantha time_16_17)
  )

  (:goal
    (exists (?t - time_slot) (meeting_scheduled ?t)))
)