(define (problem schedule-monday-30min)
  (:domain meeting-scheduling)

  (:objects
    marie janice elijah theresa - participant
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - slot
  )

  (:init
    (busy marie t4)
    (busy marie t12)
    (busy marie t13)
    (busy marie t14)

    (busy janice t7)
    (busy janice t9)
    (busy janice t10)
    (busy janice t11)

    (busy elijah t2)
    (busy elijah t3)
    (busy elijah t4)
    (busy elijah t5)
    (busy elijah t6)
    (busy elijah t7)
    (busy elijah t11)
    (busy elijah t14)

    (busy theresa t1)
    (busy theresa t2)
    (busy theresa t6)
    (busy theresa t7)
    (busy theresa t9)
    (busy theresa t11)
    (busy theresa t13)
    (busy theresa t15)

    (slot-available t0)
  )

  (:goal (scheduled))
)