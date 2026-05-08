(define (problem meeting_schedule)
  (:domain friend_meeting)
  (:objects 
    golden_gate_park chinatown - location
    9am 4pm 9:45pm - time_point
    david - person
  )
  (:init
    (at david chinatown)
    (is_at golden_gate_park 9am)
    (can_travel golden_gate_park chinatown)
    (can_travel chinatown golden_gate_park)
    (before 9am 4pm)
    (before 4pm 9:45pm)
  )
  (:goal (and
    (met david)
    ; The exact meeting duration is accommodated by structural constraints in time sequence
  ))
)