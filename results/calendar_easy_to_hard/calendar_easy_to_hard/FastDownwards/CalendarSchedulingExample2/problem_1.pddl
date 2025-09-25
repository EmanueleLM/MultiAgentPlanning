(define (problem schedule-meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    roy kathryn amy - agent
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot
  )

  (:init
    (available roy t9_30) (available roy t10_30) (available roy t11_30)
    (available roy t12_00) (available roy t13_00) (available roy t13_30)
    (available roy t14_00) (available roy t14_30) (available roy t15_00)
    (available roy t15_30) (available roy t16_00) (available roy t16_30)

    (available kathryn t9_00) (available kathryn t10_00) (available kathryn t10_30)
    (available kathryn t11_00) (available kathryn t11_30) (available kathryn t12_00)
    (available kathryn t12_30) (available kathryn t13_00) (available kathryn t13_30)
    (available kathryn t14_00) (available kathryn t14_30) (available kathryn t15_00)
    (available kathryn t15_30) (available kathryn t16_00)

    (available amy t14_30)
  )

  (:goal (meeting-scheduled))
)