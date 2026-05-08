(define (problem monday_meeting_schedule_instance_problem)
  (:domain monday_meeting_schedule_instance)

  (:objects
    s_09_00 s_09_30 s_10_00 s_10_30
    s_11_00 s_11_30 s_12_00 s_12_30
    s_13_00 s_13_30 s_14_00 s_14_30
    s_15_00 s_15_30 s_16_00 s_16_30 - slot
  )

  (:init
    (start_unset)

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

    (free bobby s_09_00)
    (free bobby s_09_30)
    (free bobby s_10_00)
    (free bobby s_10_30)
    (free bobby s_11_00)
    (free bobby s_11_30)
    (free bobby s_12_00)
    (free bobby s_12_30)
    (free bobby s_13_00)
    (free bobby s_13_30)
    (free bobby s_14_00)
    (free bobby s_14_30)
    (free bobby s_15_00)
    (free bobby s_15_30)
    (free bobby s_16_00)
    (free bobby s_16_30)

    (free scott s_09_00)
    (free scott s_09_30)
    (free scott s_10_00)
    (free scott s_10_30)
    (free scott s_11_00)
    (free scott s_12_00)
    (free scott s_12_30)
    (free scott s_13_00)
    (free scott s_13_30)
    (free scott s_14_00)
    (free scott s_14_30)
    (free scott s_15_00)
    (free scott s_16_00)
    (free scott s_16_30)

    (free kimberly s_09_00)
    (free kimberly s_09_30)
    (free kimberly s_10_00)
    (free kimberly s_10_30)
    (free kimberly s_12_00)
    (free kimberly s_13_00)
    (free kimberly s_14_00)
    (free kimberly s_15_00)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)