(define (problem san_francisco_meeting_instance_problem)
  (:domain san_francisco_meeting_instance)

  (:objects
    you - traveler
    marina_district - location
    t_9_00 t_9_16 t_9_31 t_11_45 - timepoint
  )

  (:init
    (at you marina_district)
    (current_time t_9_00)
    (friend_at sandra chinatown)
    (connected marina_district chinatown t_9_00 t_9_16)
    (time_successor t_9_00 t_9_16)
    (time_successor t_9_16 t_9_31)
    (time_successor t_9_31 t_11_45)
    (meeting_slot_sandra t_9_16 t_9_31)
  )

  (:goal
    (and
      (met sandra)
    )
  )
)