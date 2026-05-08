(define (problem visit_san_francisco)
  (:domain san_francisco_schedule)
  (:objects
    golden_gate_park pacific_heights - location
    morning evening night - time_window
    john - person
  )

  (:init
    (at golden_gate_park)
    (can_meet john evening)
    (next_window morning evening)
    (next_window evening night)
    (available_during john pacific_heights evening)
  )

  (:goal 
    (and
      (visited pacific_heights)
      (not (can_meet john evening))
    )
  )
)