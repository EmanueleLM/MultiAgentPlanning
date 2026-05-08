(define (problem meeting_scheduling_monday_instance_problem)
  (:domain meeting_scheduling_monday_instance)

  (:objects
    stephen edward angela - participant
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
    meeting_1 - meeting
  )

  (:init
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

    (busy stephen t_10_00)
    (busy stephen t_13_00)
    (busy stephen t_14_30)
    (busy stephen t_16_00)

    (busy edward t_09_00)
    (busy edward t_10_00)
    (busy edward t_13_30)
    (busy edward t_14_00)
    (busy edward t_15_00)
    (busy edward t_15_30)

    (busy angela t_09_00)
    (busy angela t_09_30)
    (busy angela t_10_00)
    (busy angela t_10_30)
    (busy angela t_11_00)
    (busy angela t_12_30)
    (busy angela t_13_30)
    (busy angela t_14_00)
    (busy angela t_14_30)
    (busy angela t_15_00)
    (busy angela t_16_00)
    (busy angela t_16_30)
  )

  (:goal
    (and
      (scheduled meeting_1)
    )
  )
)