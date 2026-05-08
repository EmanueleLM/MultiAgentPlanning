(define (problem san_francisco_meet_david_instance)
  (:domain san_francisco_meet_david)

  (:objects
    t0900 t1537 t1600 t1623 t1745 t1808 t1953 t2145 - timepoint
  )

  (:init
    (at you golden_gate_park)
    (current_time t0900)
    (person_at david chinatown)

    (connected golden_gate_park chinatown)
    (connected chinatown golden_gate_park)

    (travel_arrival golden_gate_park chinatown t1537 t1600)
    (travel_arrival golden_gate_park chinatown t1600 t1623)
    (travel_arrival golden_gate_park chinatown t1745 t1808)

    (next_time t0900 t1537)
    (next_time t1537 t1600)
    (next_time t1600 t1623)
    (next_time t1623 t1745)
    (next_time t1745 t1808)
    (next_time t1808 t1953)
    (next_time t1953 t2145)

    (meeting_end t1600 t1745)
    (meeting_end t1623 t1808)
    (meeting_end t1808 t1953)
  )

  (:goal
    (and
      (met david)
    )
  )
)