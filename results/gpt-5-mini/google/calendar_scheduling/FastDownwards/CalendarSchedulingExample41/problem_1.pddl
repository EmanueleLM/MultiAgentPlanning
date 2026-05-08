(define (problem calendar_scheduling_example41)
  (:domain calendar_scheduling)
  (:objects
    alan nancy patricia - person
    t9_00 t9_30 t10_00 t10_30 t11_00 t11_30 t12_00 t12_30
    t13_00 t13_30 t14_00 t14_30 t15_00 t15_30 t16_00 t16_30 - slot
  )
  (:init
    ;; alan: only available at or after 14:30 (does not want meetings before 14:30)
    (available alan t14_30)
    (available alan t15_00)
    (available alan t15_30)
    (available alan t16_00)
    (available alan t16_30)

    ;; nancy: busy 11:00-12:30 (blocks t11_00,t11_30,t12_00), busy 13:00-13:30 (t13_00), busy 14:00-15:00 (t14_00,t14_30)
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

    ;; patricia: busy 10:00-12:00 (t10_00,t10_30,t11_00,t11_30), busy 12:30-13:00 (t12_30), busy 13:30-16:00 (t13_30,t14_00,t14_30,t15_00,t15_30)
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