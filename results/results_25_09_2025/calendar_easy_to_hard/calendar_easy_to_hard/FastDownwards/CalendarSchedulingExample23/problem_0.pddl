(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 t16 - time
    ;; mapping:
    ;; t0 = 9:00, t1 = 9:30, t2 = 10:00, t3 = 10:30, t4 = 11:00, t5 = 11:30,
    ;; t6 = 12:00, t7 = 12:30, t8 = 13:00, t9 = 13:30, t10 = 14:00, t11 = 14:30,
    ;; t12 = 15:00, t13 = 15:30, t14 = 16:00, t15 = 16:30, t16 = 17:00
  )

  (:init
    ;; next relations (half-hour successive ticks)
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4)
    (next t4 t5) (next t5 t6) (next t6 t7) (next t7 t8)
    (next t8 t9) (next t9 t10) (next t10 t11) (next t11 t12)
    (next t12 t13) (next t13 t14) (next t14 t15) (next t15 t16)

    ;; valid meeting start times (meeting is 60 minutes -> occupies t and next t)
    ;; must start and end within 9:00-17:00 so last valid start is t14 (16:00)
    (valid-start t0) (valid-start t1) (valid-start t2) (valid-start t3)
    (valid-start t4) (valid-start t5) (valid-start t6) (valid-start t7)
    (valid-start t8) (valid-start t9) (valid-start t10) (valid-start t11)
    (valid-start t12) (valid-start t13) (valid-start t14)

    ;; Free/Busy encoding derived from agents' private info.
    ;; Billy busy: 11:30 (t5), 13:00-15:00 (t8,t9,t10,t11), 16:00 (t14)
    ;; So free-billy on all ticks except t5,t8,t9,t10,t11,t14
    (free-billy t0) (free-billy t1) (free-billy t2) (free-billy t3)
    (free-billy t4) (free-billy t6) (free-billy t7) (free-billy t12)
    (free-billy t13) (free-billy t15) (free-billy t16)

    ;; Maria busy: 9:00 (t0), 10:00 (t2), 13:00 (t8), 14:00 (t10)
    ;; free-maria on all ticks except t0,t2,t8,t10
    (free-maria t1) (free-maria t3) (free-maria t4) (free-maria t5)
    (free-maria t6) (free-maria t7) (free-maria t9) (free-maria t11)
    (free-maria t12) (free-maria t13) (free-maria t14) (free-maria t15)
    (free-maria t16)

    ;; William busy: 9:30 (t1), 12:00 (t6), 13:30-15:00 (t9,t10,t11), 15:30-17:00 (t13,t14,t15)
    ;; free-william on all ticks except t1,t6,t9,t10,t11,t13,t14,t15
    (free-william t0) (free-william t2) (free-william t3) (free-william t4)
    (free-william t5) (free-william t7) (free-william t8) (free-william t12)
    (free-william t16)
  )

  (:goal (scheduled))
)