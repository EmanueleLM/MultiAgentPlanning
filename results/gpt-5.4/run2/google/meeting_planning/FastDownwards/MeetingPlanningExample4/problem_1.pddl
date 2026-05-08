(define (problem san_francisco_jessica_day_problem)
  (:domain san_francisco_jessica_day)

  (:objects
    presidio marina_district - location
    jessica - person
    t_900 t_910 t_915 t_1015 - timepoint
  )

  (:init
    (at presidio)
    (current_time t_900)
    (connected presidio marina_district)
    (connected marina_district presidio)
    (jessica_at marina_district)
    (jessica_available t_915)
  )

  (:goal
    (and
      (met_jessica)
      (at marina_district)
      (current_time t_1015)
    )
  )
)