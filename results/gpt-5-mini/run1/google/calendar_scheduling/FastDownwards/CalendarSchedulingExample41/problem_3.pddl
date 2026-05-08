(define (problem calendar_scheduling_example41)
  (:domain calendar_scheduling)
  (:objects
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot
  )
  (:init
    (available alan t14_30)
    (available alan t15_00)
    (available alan t15_30)
    (available alan t16_00)
    (available alan t16_30)

    (available nancy t9_00)
    (available nancy t9_30)
    (available nancy t10_00)
    (available nancy t10_30)
    (available nancy t12_30)
    (available nancy t13_30)
    (available nancy t15_00)
    (available nancy t15_30)
    (available nancy t16_00)
    (available nancy t16_30)

    (available patricia t9_00)
    (available patricia t9_30)
    (available patricia t12_00)
    (available patricia t13_00)
    (available patricia t16_00)
    (available patricia t16_30)
  )
  (:goal (and
    (meeting_scheduled)
  ))
)