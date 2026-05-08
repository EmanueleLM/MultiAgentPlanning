(define (problem schedule_meeting_monday_instance_problem)
  (:domain schedule_meeting_monday_instance)

  (:objects
    madison diana shirley - participant
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - slot
    meeting_1 - meeting
  )

  (:init
    (unscheduled meeting_1)

    (next_slot t_09_00 t_09_30)
    (next_slot t_09_30 t_10_00)
    (next_slot t_10_00 t_10_30)
    (next_slot t_10_30 t_11_00)
    (next_slot t_11_00 t_11_30)
    (next_slot t_11_30 t_12_00)
    (next_slot t_12_00 t_12_30)
    (next_slot t_12_30 t_13_00)
    (next_slot t_13_00 t_13_30)
    (next_slot t_13_30 t_14_00)
    (next_slot t_14_00 t_14_30)
    (next_slot t_14_30 t_15_00)
    (next_slot t_15_00 t_15_30)
    (next_slot t_15_30 t_16_00)
    (next_slot t_16_00 t_16_30)

    (busy madison t_09_30)
    (busy madison t_11_30)

    (busy diana t_11_00)
    (busy diana t_13_00)

    (busy shirley t_09_00)
    (busy shirley t_09_30)
    (busy shirley t_10_00)
    (busy shirley t_10_30)
    (busy shirley t_11_00)
    (busy shirley t_11_30)
    (busy shirley t_13_30)
    (busy shirley t_14_00)
    (busy shirley t_14_30)
    (busy shirley t_15_30)
    (busy shirley t_16_00)
    (busy shirley t_16_30)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)