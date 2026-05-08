(define (problem meeting_scheduling_monday_instance_problem)
  (:domain meeting_scheduling_monday_instance)

  (:objects
    brian billy patricia - participant
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
    t_16_30_17_00 - timeslot
    meeting_1 - meeting
  )

  (:init
    (unscheduled meeting_1)

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
    (allowed_slot t_14_30_15_00)
    (allowed_slot t_15_00_15_30)
    (allowed_slot t_15_30_16_00)

    (free brian t_09_00_09_30)
    (free brian t_09_30_10_00)
    (free brian t_10_00_10_30)
    (free brian t_10_30_11_00)
    (free brian t_11_00_11_30)
    (free brian t_11_30_12_00)
    (free brian t_12_00_12_30)
    (free brian t_12_30_13_00)
    (free brian t_13_00_13_30)
    (free brian t_13_30_14_00)
    (free brian t_14_00_14_30)
    (free brian t_14_30_15_00)
    (free brian t_15_00_15_30)
    (free brian t_15_30_16_00)
    (free brian t_16_00_16_30)
    (free brian t_16_30_17_00)

    (free billy t_09_00_09_30)
    (free billy t_09_30_10_00)
    (free billy t_10_30_11_00)
    (free billy t_11_00_11_30)
    (free billy t_12_00_12_30)
    (free billy t_12_30_13_00)
    (free billy t_13_00_13_30)
    (free billy t_13_30_14_00)
    (free billy t_14_30_15_00)
    (free billy t_15_00_15_30)
    (free billy t_15_30_16_00)
    (free billy t_16_00_16_30)

    (free patricia t_12_30_13_00)
    (free patricia t_13_00_13_30)
    (free patricia t_14_00_14_30)
    (free patricia t_16_00_16_30)
  )

  (:goal
    (and
      (meeting_scheduled meeting_1)
    )
  )
)