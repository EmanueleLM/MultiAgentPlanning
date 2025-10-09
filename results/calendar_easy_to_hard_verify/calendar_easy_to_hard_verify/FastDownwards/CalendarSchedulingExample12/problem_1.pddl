(define (problem CalendarSchedulingExample12)
  (:domain calendar-scheduling)
  (:objects
    dylan kathryn hannah anna - person
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )
  (:init
    (next t0 t1) (next t1 t2) (next t2 t3) (next t3 t4)
    (next t4 t5) (next t5 t6) (next t6 t7) (next t7 t8)
    (next t8 t9) (next t9 t10) (next t10 t11) (next t11 t12)
    (next t12 t13) (next t13 t14) (next t14 t15)

    ; Dylan: busy t10,t11
    (slot_free dylan t0) (slot_free dylan t1) (slot_free dylan t2)
    (slot_free dylan t3) (slot_free dylan t4) (slot_free dylan t5)
    (slot_free dylan t6) (slot_free dylan t7) (slot_free dylan t8)
    (slot_free dylan t9) (slot_free dylan t12) (slot_free dylan t13)
    (slot_free dylan t14) (slot_free dylan t15)

    ; Kathryn: busy t0,t2
    (slot_free kathryn t1) (slot_free kathryn t3) (slot_free kathryn t4)
    (slot_free kathryn t5) (slot_free kathryn t6) (slot_free kathryn t7)
    (slot_free kathryn t8) (slot_free kathryn t9) (slot_free kathryn t10)
    (slot_free kathryn t11) (slot_free kathryn t12) (slot_free kathryn t13)
    (slot_free kathryn t14) (slot_free kathryn t15)

    ; Hannah: busy t0,t1,t2 and t7,t8,t9,t10,t11,t12 and t14
    (slot_free hannah t3) (slot_free hannah t4) (slot_free hannah t5)
    (slot_free hannah t6) (slot_free hannah t13) (slot_free hannah t15)

    ; Anna: busy t0,t1,t2,t3 and t6,t7,t8,t9 and t11 and t14
    (slot_free anna t4) (slot_free anna t5) (slot_free anna t10)
    (slot_free anna t12) (slot_free anna t13) (slot_free anna t15)
  )
  (:goal (meeting_scheduled))
)