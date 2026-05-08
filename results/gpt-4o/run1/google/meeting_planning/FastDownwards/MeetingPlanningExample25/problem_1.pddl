(define (problem meeting_schedule)
  (:domain friend_meeting)
  (:objects 
    golden_gate_park chinatown - location
    t9am t4pm t945pm - time_point
    david - person
  )
  (:init
    (at david chinatown)
    (is_at golden_gate_park t9am)
    (can_travel golden_gate_park chinatown)
    (can_travel chinatown golden_gate_park)
    (before t9am t4pm)
    (before t4pm t945pm)
  )
  (:goal (and
    (met david)
  ))
)