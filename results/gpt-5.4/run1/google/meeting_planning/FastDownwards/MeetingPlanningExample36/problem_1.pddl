(define (problem san_francisco_meet_barbara_instance)
  (:domain san_francisco_meet_barbara)

  (:objects
    marina_district embarcadero - location
    barbara - person
    t0900 t0914 t1330 t1430 t1945 t2045 - time
  )

  (:init
    (at marina_district)
    (current_time t0900)
    (barbara_at embarcadero)

    (next_time t0900 t1330)
    (next_time t0914 t1330)
    (next_time t1330 t1945)

    (travel_arrival marina_district embarcadero t0900 t0914)

    (meet_end t1330 t1430)
    (meet_end t1945 t2045)
  )

  (:goal
    (and
      (met_for_required_duration barbara)
    )
  )
)