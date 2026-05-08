(define (problem monday_meeting_raymond_billy_donald)
  (:domain monday_meeting_scheduling)

  (:objects
    raymond billy donald - participant
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - slot
  )

  (:init
    (free raymond t_09_30)
    (free raymond t_10_00)
    (free raymond t_10_30)
    (free raymond t_11_00)
    (free raymond t_12_00)
    (free raymond t_12_30)
    (free raymond t_13_30)
    (free raymond t_14_00)
    (free raymond t_14_30)
    (free raymond t_15_30)
    (free raymond t_16_00)
    (free raymond t_16_30)

    (free billy t_09_00)
    (free billy t_09_30)
    (free billy t_10_30)
    (free billy t_11_00)
    (free billy t_11_30)
    (free billy t_13_00)
    (free billy t_13_30)
    (free billy t_14_00)
    (free billy t_14_30)
    (free billy t_15_00)
    (free billy t_15_30)
    (free billy t_16_00)

    (free donald t_09_30)
    (free donald t_11_00)
    (free donald t_11_30)
    (free donald t_13_00)
    (free donald t_13_30)
    (free donald t_14_30)
    (free donald t_15_00)
    (free donald t_15_30)

    (allowed_slot t_09_00)
    (allowed_slot t_09_30)
    (allowed_slot t_10_00)
    (allowed_slot t_10_30)
    (allowed_slot t_11_00)
    (allowed_slot t_11_30)
    (allowed_slot t_12_00)
    (allowed_slot t_12_30)
    (allowed_slot t_13_00)
    (allowed_slot t_13_30)
    (allowed_slot t_14_00)
    (allowed_slot t_14_30)
    (allowed_slot t_15_00)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)