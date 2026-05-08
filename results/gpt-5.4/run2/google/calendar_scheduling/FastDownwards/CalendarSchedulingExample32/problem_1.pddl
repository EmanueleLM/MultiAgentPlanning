(define (problem meeting_schedule_monday_instance_problem)
  (:domain meeting_schedule_monday_instance)

  (:objects
    t_09_00 t_09_30 t_10_00 t_10_30 t_11_00 t_11_30 t_12_00 t_12_30
    t_13_00 t_13_30 t_14_00 t_14_30 t_15_00 t_15_30 t_16_00 t_16_30 - timeslot
  )

  (:init
    (allowed_slot t_09_00)

    (available emily t_09_00)
    (available emily t_09_30)
    (available emily t_10_30)
    (available emily t_11_00)
    (available emily t_12_30)
    (available emily t_13_00)
    (available emily t_13_30)
    (available emily t_15_00)
    (available emily t_15_30)
    (available emily t_16_30)

    (available melissa t_09_00)
    (available melissa t_10_00)
    (available melissa t_10_30)
    (available melissa t_11_00)
    (available melissa t_11_30)
    (available melissa t_12_00)
    (available melissa t_12_30)
    (available melissa t_13_00)
    (available melissa t_13_30)
    (available melissa t_14_00)
    (available melissa t_15_00)
    (available melissa t_15_30)
    (available melissa t_16_00)
    (available melissa t_16_30)

    (available frank t_09_00)
    (available frank t_09_30)
    (available frank t_10_30)
    (available frank t_11_30)
    (available frank t_12_00)
    (available frank t_13_00)
    (available frank t_14_30)
    (available frank t_16_00)
  )

  (:goal
    (and
      (scheduled)
    )
  )
)