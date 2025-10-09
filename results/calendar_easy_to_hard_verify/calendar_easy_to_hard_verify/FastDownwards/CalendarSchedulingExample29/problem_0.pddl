(define (problem schedule-monday-09-17)
  (:domain meeting-scheduling)

  (:objects
    michael samuel aaron judith kevin - agent
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 t14 t15 - time
  )

  (:init
    ;; t0 = 09:00, t1 = 09:30, t2 = 10:00, t3 = 10:30,
    ;; t4 = 11:00, t5 = 11:30, t6 = 12:00, t7 = 12:30,
    ;; t8 = 13:00, t9 = 13:30, t10 = 14:00, t11 = 14:30,
    ;; t12 = 15:00, t13 = 15:30, t14 = 16:00, t15 = 16:30

    ;; michael free starts
    (free michael t0) (free michael t1) (free michael t2)
    (free michael t4) (free michael t5) (free michael t6) (free michael t7) (free michael t8) (free michael t9) (free michael t10)
    (free michael t12) (free michael t13) (free michael t14) (free michael t15)

    ;; samuel free starts
    (free samuel t0) (free samuel t1) (free samuel t2)
    (free samuel t4) (free samuel t5) (free samuel t6)
    (free samuel t8)
    (free samuel t11) (free samuel t12)
    (free samuel t14)

    ;; aaron free starts
    (free aaron t0) (free aaron t1) (free aaron t2) (free aaron t3)
    (free aaron t5) (free aaron t6)
    (free aaron t8)
    (free aaron t10) (free aaron t11)
    (free aaron t13)

    ;; judith free starts
    (free judith t1) (free judith t2)
    (free judith t5)
    (free judith t7) (free judith t8) (free judith t9)
    (free judith t12)
    (free judith t14)

    ;; kevin free starts
    (free kevin t4)
    (free kevin t8)
    (free kevin t10)
    (free kevin t12)
    (free kevin t14) (free kevin t15)
  )

  ;; Goal: schedule a single meeting (any valid start time)
  (:goal (meeting-scheduled))
)