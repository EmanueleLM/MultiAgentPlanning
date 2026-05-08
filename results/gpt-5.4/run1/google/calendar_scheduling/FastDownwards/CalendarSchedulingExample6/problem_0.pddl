(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    thomas dylan jerry - participant
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

    (free thomas s_09_00)
    (free thomas s_09_30)
    (free thomas s_10_00)
    (free thomas s_10_30)
    (free thomas s_11_00)
    (free thomas s_11_30)
    (free thomas s_12_00)
    (free thomas s_12_30)
    (free thomas s_13_00)
    (free thomas s_13_30)
    (free thomas s_14_00)
    (free thomas s_14_30)
    (free thomas s_15_00)
    (free thomas s_15_30)
    (free thomas s_16_00)
    (free thomas s_16_30)

    (free dylan s_09_00)
    (free dylan s_09_30)
    (free dylan s_10_00)
    (free dylan s_11_00)
    (free dylan s_11_30)
    (free dylan s_12_00)
    (free dylan s_12_30)
    (free dylan s_13_00)
    (free dylan s_14_00)
    (free dylan s_14_30)
    (free dylan s_15_00)
    (free dylan s_15_30)
    (free dylan s_16_00)
    (free dylan s_16_30)

    (free jerry s_11_00)
    (free jerry s_15_00)
    (free jerry s_15_30)
  )

  (:goal
    (and
      (meeting_scheduled)
    )
  )
)