(define (problem meet_barbara_specific_instance)
  (:domain meet_barbara_san_francisco_day)

  (:objects
    north_beach alamo_square - place
    barbara - person
    t0900 t0945 t1030 t1115 t1200 t1245 t1330 t1415 t1500 t1545 t1630 t1715 t1800 t1845 t1930 t2015 t2100 t2130 - time
  )

  (:init
    (at north_beach)
    (current t0900)

    (connected north_beach alamo_square)
    (connected alamo_square north_beach)

    (next t0900 t0945)
    (next t0945 t1030)
    (next t1030 t1115)
    (next t1115 t1200)
    (next t1200 t1245)
    (next t1245 t1330)
    (next t1330 t1415)
    (next t1415 t1500)
    (next t1500 t1545)
    (next t1545 t1630)
    (next t1630 t1715)
    (next t1715 t1800)
    (next t1800 t1845)
    (next t1845 t1930)
    (next t1930 t2015)
    (next t2015 t2100)
    (next t2100 t2130)

    (available barbara alamo_square t1800)
    (available barbara alamo_square t1845)
    (available barbara alamo_square t1930)
    (available barbara alamo_square t2015)
  )

  (:goal
    (and
      (met_required barbara)
    )
  )
)