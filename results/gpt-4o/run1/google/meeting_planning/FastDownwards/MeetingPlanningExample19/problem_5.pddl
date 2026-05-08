(define (problem visit_san_francisco)
  (:domain san_francisco_schedule)
  (:objects
    golden_gate_park pacific_heights - location
    morning lunchtime evening night - time_interval
    john - person
  )

  (:init
    (at golden_gate_park)
    (can_meet john evening)
    (next_interval morning lunchtime)
    (next_interval lunchtime evening)
    (next_interval evening night)
    (available_during john pacific_heights evening)
  )

  (:goal 
    (and
      (visited pacific_heights)
      (not (can_meet john evening))
    )
  )
)