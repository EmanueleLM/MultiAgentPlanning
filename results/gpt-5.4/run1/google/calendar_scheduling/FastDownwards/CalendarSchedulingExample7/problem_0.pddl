(define (problem monday_meeting_instance)
  (:domain monday_meeting_scheduling)

  (:objects
    heather nicholas zachary - participant
    t_09_00_09_30
    t_09_30_10_00
    t_10_00_10_30
    t_10_30_11_00
    t_11_00_11_30
    t_11_30_12_00
    t_12_00_12_30
    t_12_30_13_00
    t_13_00_13_30
    t_13_30_14_00
    t_14_00_14_30
    t_14_30_15_00
    t_15_00_15_30
    t_15_30_16_00
    t_16_00_16_30
    t_16_30_17_00 - slot
  )

  (:init
    (unscheduled)

    (available nicholas t_09_00_09_30)
    (available nicholas t_09_30_10_00)
    (available nicholas t_10_00_10_30)
    (available nicholas t_10_30_11_00)
    (available nicholas t_11_00_11_30)
    (available nicholas t_11_30_12_00)
    (available nicholas t_12_00_12_30)
    (available nicholas t_12_30_13_00)
    (available nicholas t_13_00_13_30)
    (available nicholas t_13_30_14_00)
    (available nicholas t_14_00_14_30)
    (available nicholas t_14_30_15_00)
    (available nicholas t_15_00_15_30)
    (available nicholas t_15_30_16_00)
    (available nicholas t_16_00_16_30)
    (available nicholas t_16_30_17_00)

    (available heather t_09_30_10_00)
    (available heather t_10_00_10_30)
    (available heather t_11_00_11_30)
    (available heather t_11_30_12_00)
    (available heather t_12_00_12_30)
    (available heather t_12_30_13_00)
    (available heather t_14_00_14_30)
    (available heather t_15_00_15_30)
    (available heather t_15_30_16_00)
    (available heather t_16_30_17_00)

    (available zachary t_10_30_11_00)
    (available zachary t_12_00_12_30)
    (available zachary t_13_00_13_30)
    (available zachary t_16_30_17_00)

    (allowed_slot t_09_00_09_30)
    (allowed_slot t_09_30_10_00)
    (allowed_slot t_10_00_10_30)
    (allowed_slot t_10_30_11_00)
    (allowed_slot t_11_00_11_30)
    (allowed_slot t_11_30_12_00)
    (allowed_slot t_12_00_12_30)
    (allowed_slot t_12_30_13_00)
    (allowed_slot t_13_00_13_30)
    (allowed_slot t_13_30_14_00)
    (allowed_slot t_14_00_14_30)
  )

  (:goal
    (and
      (meeting_scheduled t_12_00_12_30)
    )
  )
)