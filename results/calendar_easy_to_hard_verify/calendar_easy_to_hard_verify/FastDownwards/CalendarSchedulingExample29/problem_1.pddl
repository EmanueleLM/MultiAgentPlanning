(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)
  (:objects
    michael samuel aaron judith kevin - agent
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )
  (:init
    (free michael t0) (free michael t1) (free michael t2)
    (free michael t4) (free michael t5) (free michael t6) (free michael t7) (free michael t8) (free michael t9) (free michael t10)
    (free michael t12) (free michael t13) (free michael t14) (free michael t15)

    (free samuel t0) (free samuel t1) (free samuel t2)
    (free samuel t4) (free samuel t5) (free samuel t6)
    (free samuel t8)
    (free samuel t11) (free samuel t12)
    (free samuel t14)

    (free aaron t0) (free aaron t1) (free aaron t2) (free aaron t3)
    (free aaron t5) (free aaron t6)
    (free aaron t8)
    (free aaron t10) (free aaron t11)
    (free aaron t13)

    (free judith t1) (free judith t2)
    (free judith t5)
    (free judith t7) (free judith t8) (free judith t9)
    (free judith t12)
    (free judith t14)

    (free kevin t4)
    (free kevin t8)
    (free kevin t10)
    (free kevin t12)
    (free kevin t14) (free kevin t15)
  )
  (:goal (meeting-scheduled))
)