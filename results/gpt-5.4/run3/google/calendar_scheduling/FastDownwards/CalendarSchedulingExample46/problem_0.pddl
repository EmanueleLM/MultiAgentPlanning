(define (problem schedule_meeting_monday_instance)
  (:domain schedule_meeting_monday_halfhour)

  (:objects
    arthur theresa carl - participant
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )

  (:init
    (free arthur t_09_00)
    (free arthur t_10_00)
    (free arthur t_10_30)
    (free arthur t_11_00)
    (free arthur t_11_30)
    (free arthur t_12_00)
    (free arthur t_12_30)
    (free arthur t_13_00)
    (free arthur t_13_30)
    (free arthur t_14_30)
    (free arthur t_15_00)
    (free arthur t_15_30)
    (free arthur t_16_00)
    (free arthur t_16_30)

    (free theresa t_09_30)
    (free theresa t_10_00)
    (free theresa t_10_30)
    (free theresa t_11_00)
    (free theresa t_11_30)
    (free theresa t_13_00)
    (free theresa t_13_30)
    (free theresa t_14_00)
    (free theresa t_14_30)
    (free theresa t_16_30)

    (free carl t_11_30)
    (free carl t_14_00)
  )

  (:goal
    (and
      (meeting_planned)
      (scheduled t_11_30)
    )
  )
)