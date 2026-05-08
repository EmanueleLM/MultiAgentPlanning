(define (problem san_francisco_day_visit_instance)
  (:domain san_francisco_day_visit)

  (:objects
    t1215 t1400 t1715 t0900 t0923 - time
  )

  (:init
    (at bayview)
    (current_time t0900)

    (next t0900 t0923)
    (next t0923 t1215)
    (next t1215 t1400)
    (next t1400 t1715)

    (bv_to_ph_pair t0900 t0923)
  )

  (:goal
    (and
      (met_thomas)
      (current_time t1400)
      (at pacific_heights)
    )
  )
)