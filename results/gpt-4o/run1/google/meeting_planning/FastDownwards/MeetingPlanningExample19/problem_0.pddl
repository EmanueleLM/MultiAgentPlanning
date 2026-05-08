(define (problem visit_san_francisco)
  (:domain san_francisco_schedule)
  (:objects
    golden_gate_park pacific_heights - location
    morning evening night - time_window
    john - person)

  (:init
    (at golden_gate_park)
    (can_meet john evening)
    (next morning)
    (next evening)
    (next night))

  (:goal 
    (and
      (visited pacific_heights)
      (at pacific_heights)
      (not (can_meet john evening))))
)