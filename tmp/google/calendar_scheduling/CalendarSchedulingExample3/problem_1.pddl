(define (problem schedule-collective-meeting)
  (:domain collective-scheduling)

  (:objects
    Arthur Michael Samantha - participant
    time_9_10 time_10_11 time_11_12 time_12_13
    time_13_14 time_14_15 time_15_16 time_16_17 - time_slot
  )

  (:init
    ;; Arthur's schedule
    (busy Arthur time_9_10)
    (busy Arthur time_10_11)
    (busy Arthur time_11_12)
    (busy Arthur time_15_16)
    (available Arthur time_12_13)
    (available Arthur time_13_14)
    (available Arthur time_14_15)

    ;; Michael's schedule
    (available Michael time_9_10)
    (available Michael time_10_11)
    (available Michael time_11_12)
    (available Michael time_12_13)
    (busy Michael time_13_14)
    (busy Michael time_14_15)
    (available Michael time_15_16)
    (available Michael time_16_17)

    ;; Samantha's schedule
    (busy Samantha time_9_10)
    (busy Samantha time_10_11)
    (available Samantha time_11_12)
    (busy Samantha time_12_13)
    (busy Samantha time_13_14)
    (available Samantha time_14_15)
    (busy Samantha time_15_16)
    (busy Samantha time_16_17)
  )

  (:goal
    (exists (?t - time_slot) (meeting_scheduled ?t)))
)