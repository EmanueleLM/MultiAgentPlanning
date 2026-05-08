(define (problem monday_meeting_billy_maria_william)
  (:domain monday_meeting_scheduling)

  (:objects
    billy maria william - participant
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

    (free billy s_09_00)
    (free billy s_09_30)
    (free billy s_10_00)
    (free billy s_10_30)
    (free billy s_11_00)
    (free billy s_12_00)
    (free billy s_12_30)
    (free billy s_15_00)
    (free billy s_15_30)
    (free billy s_16_30)

    (free maria s_09_30)
    (free maria s_10_30)
    (free maria s_11_00)
    (free maria s_11_30)
    (free maria s_12_00)
    (free maria s_12_30)
    (free maria s_13_30)
    (free maria s_14_30)
    (free maria s_15_00)
    (free maria s_15_30)
    (free maria s_16_00)
    (free maria s_16_30)

    (free william s_09_00)
    (free william s_10_00)
    (free william s_10_30)
    (free william s_11_00)
    (free william s_11_30)
    (free william s_12_30)
    (free william s_13_00)
    (free william s_15_00)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)