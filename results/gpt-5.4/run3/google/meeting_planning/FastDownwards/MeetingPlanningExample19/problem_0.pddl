(define (problem san_francisco_meet_john_instance)
  (:domain san_francisco_meet_john)

  (:objects
    golden_gate_park pacific_heights - location
    john - person
    t0900 t0916 t1945 t2000 t2045 - time
  )

  (:init
    (at golden_gate_park)
    (at_time t0900)

    (next_time t0900 t0916)
    (next_time t0916 t1945)
    (next_time t1945 t2000)
    (next_time t2000 t2045)

    (travel_edge golden_gate_park pacific_heights t0900 t0916)

    (person_at john pacific_heights)
    (available_start john t1945)
    (available_end john t2045)

    (meeting_45_edge t2000 t2045)
  )

  (:goal
    (and
      (met john)
      (at pacific_heights)
      (at_time t2045)
    )
  )
)