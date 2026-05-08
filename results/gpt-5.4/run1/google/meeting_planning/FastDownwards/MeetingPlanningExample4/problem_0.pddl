(define (problem meet_jessica_instance)
  (:domain meet_jessica_san_francisco)

  (:objects
    presidio marina_district - location
    jessica - person
    t900 t910 t915 t1015 t1745 - time
  )

  (:init
    (at presidio)
    (current_time t900)

    (road presidio marina_district)
    (road marina_district presidio)

    (person_at jessica marina_district)

    (next_time t910 t915)
    (next_time t915 t1015)
    (next_time t1015 t1745)

    (travel_time_10 presidio marina_district t900 t910)

    (available jessica t915)
    (available jessica t1015)
    (available jessica t1745)
  )

  (:goal
    (and
      (met_minimum jessica)
    )
  )
)