(define (problem meeting_schedule_monday_halfhour_instance)
  (:domain meeting_schedule_monday_halfhour)

  (:objects
    t_09_00 t_09_30 t_10_00 t_10_30
    t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30
    t_15_00 t_15_30 t_16_00 t_16_30 - slot
  )

  (:init
    (legal_start t_09_00)
    (legal_start t_09_30)
    (legal_start t_10_00)
    (legal_start t_10_30)
    (legal_start t_11_00)
    (legal_start t_11_30)
    (legal_start t_12_00)
    (legal_start t_12_30)
    (legal_start t_13_00)
    (legal_start t_13_30)
    (legal_start t_14_00)
    (legal_start t_14_30)
    (legal_start t_15_00)
    (legal_start t_15_30)
    (legal_start t_16_00)
    (legal_start t_16_30)

    (busy donna t_14_00)
    (busy donna t_15_30)

    (busy john t_11_00)
    (busy john t_16_30)

    (busy billy t_09_00)
    (busy billy t_09_30)
    (busy billy t_10_30)
    (busy billy t_11_00)
    (busy billy t_11_30)
    (busy billy t_12_00)
    (busy billy t_12_30)
    (busy billy t_13_00)
    (busy billy t_13_30)
    (busy billy t_14_30)
    (busy billy t_15_00)
    (busy billy t_15_30)
    (busy billy t_16_00)
    (busy billy t_16_30)
  )

  (:goal
    (and
      (scheduled)
    )
  )
)