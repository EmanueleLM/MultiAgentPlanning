(define (problem meet-mary-120min)
  (:domain meeting-scheduling)
  (:objects
    visitor mary - agent
    Nob_Hill Marina_District - location
    t540 t1189 t1200 t1320 - time
  )

  (:init
    (at visitor Nob_Hill)
    (at mary Marina_District)
    (current t540)

    (time-le t540 t1189)
    (time-le t540 t1200)
    (time-le t540 t1320)
    (time-le t1189 t1200)
    (time-le t1189 t1320)
    (time-le t1200 t1320)

    (time-next t1189 t1200)
    (time-next t1200 t1320)

    (mary-available t1200 t1320)

    (= (total-cost) 0)
  )

  (:goal (met))

  (:metric minimize (total-cost))
)