(define (problem meet_barbara_embarcadero_instance)
  (:domain meet_friend_san_francisco_day)

  (:objects
    marina_district embarcadero - location
    barbara - person
    t0900 t0912 t0914 t1330 t1430 t2045 - time
  )

  (:init
    (at marina_district)
    (current_time t0900)

    (next_time t0900 t0912)
    (next_time t0900 t0914)
    (next_time t0912 t1330)
    (next_time t0914 t1330)
    (next_time t1330 t1430)
    (next_time t1430 t2045)

    (travel_edge marina_district embarcadero t0900 t0914)

    (available_for_meeting barbara embarcadero t1330 t1430)
  )

  (:goal
    (and
      (met barbara)
    )
  )
)