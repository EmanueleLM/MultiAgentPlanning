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
    (current_window morning)
    (available_time morning evening)
    (available_time evening night)
  )

  (:goal 
    (and
      (visited pacific_heights)
      (at pacific_heights)
      (not (can_meet john evening))
    )
  )
)