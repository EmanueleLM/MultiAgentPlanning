(define (problem meeting_schedule_instance_monday)
  (:domain meeting_schedule_monday_halfhour)

  (:objects
    donna john billy - participant
    t_09_00 t_09_30 t_10_00 t_10_30
    t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30
    t_15_00 t_15_30 t_16_00 t_16_30 - slot
  )

  (:init
    (free donna t_09_00)
    (free donna t_09_30)
    (free donna t_10_00)
    (free donna t_10_30)
    (free donna t_11_00)
    (free donna t_11_30)
    (free donna t_12_00)
    (free donna t_12_30)
    (free donna t_13_00)
    (free donna t_13_30)
    (free donna t_14_30)
    (free donna t_15_00)
    (free donna t_16_00)
    (free donna t_16_30)

    (free john t_09_00)
    (free john t_09_30)
    (free john t_10_00)
    (free john t_10_30)
    (free john t_11_30)
    (free john t_12_00)
    (free john t_12_30)
    (free john t_13_00)
    (free john t_13_30)
    (free john t_14_00)
    (free john t_14_30)
    (free john t_15_00)
    (free john t_15_30)
    (free john t_16_00)

    (free billy t_10_00)
    (free billy t_14_00)
  )

  (:goal
    (and
      (meeting_planned)
      (scheduled t_10_00)
    )
  )
)