(define (problem integrated_schedule_problem_strips)
  (:domain integrated_scheduling_strips)
  (:objects
    russian_hill golden_gate_park - location

    john - person

    s1 s2 - schedule

    t540 t561 t780 t870 t990 t1005 t1095 t1110 - time
  )

  (:init
    (at russian_hill)
    (at-user russian_hill)
    (john-location golden_gate_park)

    (now t540)

    (john-start t780)
    (john-end t1095)

    (succ21 t540 t561)

    (le t540 t561)
    (le t540 t780)
    (le t561 t780)
    (le t780 t870)
    (le t870 t990)
    (le t990 t1005)
    (le t1005 t1095)
    (le t1095 t1110)

    (start-time s1 t780)
    (end-time s1 t870)
    (arrive-before s1)
    (fits-window s1)
    (min-duration s1)

    (start-time s2 t990)
    (end-time s2 t1110)
    (arrive-before s2)
    (min-duration s2)

    (travel-succ russian_hill golden_gate_park t540 t561)
  )

  (:goal (and
    (met john)
    (valid s1)
    (not (valid s2))
  ))
)