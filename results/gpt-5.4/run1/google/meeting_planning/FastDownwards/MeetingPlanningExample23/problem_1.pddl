(define (problem meet_john_specific_instance)
  (:domain meet_john_san_francisco_day)

  (:objects
    you - agent
    john - person
    bayview russian_hill - location
    t_900 t_923 t_930 t_1700 t_1730 t_1845 - time
  )

  (:init
    (at you bayview)
    (current_time t_900)

    (connected bayview russian_hill)
    (connected russian_hill bayview)

    (next_time t_900 t_923)
    (next_time t_923 t_930)
    (next_time t_930 t_1700)
    (next_time t_1700 t_1730)
    (next_time t_1730 t_1845)

    (plus_23 t_900 t_923)

    (plus_75 t_1730 t_1845)

    (john_at russian_hill)
    (john_available_at t_1730)
  )

  (:goal
    (and
      (met_john)
    )
  )
)