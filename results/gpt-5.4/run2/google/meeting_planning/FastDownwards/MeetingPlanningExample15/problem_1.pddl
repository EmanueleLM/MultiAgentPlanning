(define (problem meet_john_specific_instance)
  (:domain meet_john_san_francisco_day)

  (:objects
    russian_hill golden_gate_park - location
    john - person
    t_0900 t_1300 t_1430 t_1815 - time
  )

  (:init
    (at russian_hill)
    (current_time t_0900)
    (connected russian_hill golden_gate_park)
    (connected golden_gate_park russian_hill)
    (next_time t_0900 t_1300)
    (next_time t_1300 t_1430)
    (next_time t_1430 t_1815)
    (person_at john golden_gate_park)
  )

  (:goal
    (and
      (met_john)
    )
  )
)