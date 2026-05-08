(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    golden_gate_park pacific_heights - location
    john - person
    t_0900 t_0916 t_1945 t_2000 t_2030 t_2045 - timepoint
  )

  (:init
    (at golden_gate_park)
    (current_time t_0900)

    (route golden_gate_park pacific_heights)
    (route pacific_heights golden_gate_park)

    (next t_0900 t_0916)
    (next t_0916 t_1945)
    (next t_1945 t_2000)
    (next t_2000 t_2030)
    (next t_2030 t_2045)

    (travel_arrives golden_gate_park pacific_heights t_0900 t_0916)
    (travel_arrives pacific_heights golden_gate_park t_1945 t_2000)
    (travel_arrives pacific_heights golden_gate_park t_2030 t_2045)

    (available_for_meeting john pacific_heights t_1945 t_2030)
    (available_for_meeting john pacific_heights t_2000 t_2045)
  )

  (:goal
    (and
      (met john)
    )
  )
)