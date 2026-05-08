(define (problem san_francisco_meet_john_instance)
  (:domain san_francisco_meet_john)

  (:objects
    golden_gate_park pacific_heights - location
    john - person
    t0900am t0729pm t0745pm t0800pm t0815pm t0830pm t0845pm - time
  )

  (:init
    (at golden_gate_park)
    (current_time t0900am)

    (next t0900am t0729pm)
    (next t0729pm t0745pm)
    (next t0745pm t0800pm)
    (next t0800pm t0815pm)
    (next t0815pm t0830pm)
    (next t0830pm t0845pm)

    (travel_edge golden_gate_park t0729pm pacific_heights t0745pm)

    (john_available t0745pm)
    (john_available t0800pm)
    (john_available t0815pm)
    (john_available t0830pm)
    (john_available t0845pm)
  )

  (:goal
    (and
      (met_john)
      (at pacific_heights)
    )
  )
)