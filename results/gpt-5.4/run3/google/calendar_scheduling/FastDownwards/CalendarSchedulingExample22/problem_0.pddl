(define (problem schedule_meeting_theresa_charles_betty_monday)
  (:domain meeting_scheduler_monday_instance)

  (:objects
    theresa charles betty - participant
    s_09_00 s_09_30 s_10_00 s_10_30 s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30 s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (next_slot s_09_00 s_09_30)
    (next_slot s_09_30 s_10_00)
    (next_slot s_10_00 s_10_30)
    (next_slot s_10_30 s_11_00)
    (next_slot s_11_00 s_11_30)
    (next_slot s_11_30 s_12_00)
    (next_slot s_12_00 s_12_30)
    (next_slot s_12_30 s_13_00)
    (next_slot s_13_00 s_13_30)
    (next_slot s_13_30 s_14_00)
    (next_slot s_14_00 s_14_30)
    (next_slot s_14_30 s_15_00)
    (next_slot s_15_00 s_15_30)
    (next_slot s_15_30 s_16_00)
    (next_slot s_16_00 s_16_30)

    (free theresa s_09_30)
    (free theresa s_10_00)
    (free theresa s_10_30)
    (free theresa s_11_00)
    (free theresa s_11_30)
    (free theresa s_12_00)
    (free theresa s_13_30)
    (free theresa s_15_00)
    (free theresa s_15_30)
    (free theresa s_16_00)

    (free charles s_09_00)
    (free charles s_09_30)
    (free charles s_10_30)
    (free charles s_11_00)
    (free charles s_12_30)
    (free charles s_13_00)
    (free charles s_13_30)
    (free charles s_15_30)
    (free charles s_16_00)
    (free charles s_16_30)

    (free betty s_10_30)
    (free betty s_11_00)
    (free betty s_11_30)
    (free betty s_12_30)
    (free betty s_14_00)
    (free betty s_14_30)
    (free betty s_16_00)
    (free betty s_16_30)
  )

  (:goal
    (and
      (scheduled)
      (meeting_start s_10_30)
    )
  )
)