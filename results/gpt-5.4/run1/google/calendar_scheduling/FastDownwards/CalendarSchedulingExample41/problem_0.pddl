(define (problem schedule_meeting_instance_monday)
  (:domain schedule_meeting_monday_half_hour)

  (:objects
    alan nancy patricia - participant
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timepoint
  )

  (:init
    (next t_09_00 t_09_30)
    (next t_09_30 t_10_00)
    (next t_10_00 t_10_30)
    (next t_10_30 t_11_00)
    (next t_11_00 t_11_30)
    (next t_11_30 t_12_00)
    (next t_12_00 t_12_30)
    (next t_12_30 t_13_00)
    (next t_13_00 t_13_30)
    (next t_13_30 t_14_00)
    (next t_14_00 t_14_30)
    (next t_14_30 t_15_00)
    (next t_15_00 t_15_30)
    (next t_15_30 t_16_00)
    (next t_16_00 t_16_30)

    (allowed_start t_14_30)
    (allowed_start t_15_00)
    (allowed_start t_15_30)
    (allowed_start t_16_00)
    (allowed_start t_16_30)

    (free alan t_09_00)
    (free alan t_09_30)
    (free alan t_10_00)
    (free alan t_10_30)
    (free alan t_11_00)
    (free alan t_11_30)
    (free alan t_12_00)
    (free alan t_12_30)
    (free alan t_13_00)
    (free alan t_13_30)
    (free alan t_14_00)
    (free alan t_14_30)
    (free alan t_15_00)
    (free alan t_15_30)
    (free alan t_16_00)
    (free alan t_16_30)

    (free nancy t_09_00)
    (free nancy t_09_30)
    (free nancy t_10_00)
    (free nancy t_10_30)
    (free nancy t_12_30)
    (free nancy t_13_30)
    (free nancy t_15_00)
    (free nancy t_15_30)
    (free nancy t_16_00)
    (free nancy t_16_30)

    (free patricia t_09_00)
    (free patricia t_09_30)
    (free patricia t_12_00)
    (free patricia t_13_00)
    (free patricia t_16_00)
    (free patricia t_16_30)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)