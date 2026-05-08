(define (problem meet_david_specific_instance)
  (:domain meet_david_san_francisco_day)

  (:objects
    you - agent
    david - friend
    golden_gate_park chinatown - location
    t_9_00am t_9_23am t_4_00pm t_5_45pm t_9_45pm - time
  )

  (:init
    (at you golden_gate_park)
    (current_time t_9_00am)

    (connected golden_gate_park chinatown)
    (connected chinatown golden_gate_park)

    (travel_arrival golden_gate_park chinatown t_9_00am t_9_23am)

    (next_time t_9_23am t_4_00pm)
    (next_time t_5_45pm t_9_45pm)

    (friend_at david chinatown)
    (available_start david t_4_00pm)
    (available_end david t_9_45pm)
    (meeting_duration_slot t_4_00pm t_5_45pm)
  )

  (:goal
    (and
      (met david)
    )
  )
)