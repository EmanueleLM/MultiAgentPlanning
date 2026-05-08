(define (problem meet_paul_from_richmond_to_nob_hill)
  (:domain meet_friend_san_francisco_day)

  (:objects
    you - traveler
    paul - person
    richmond_district nob_hill - location
    t_0900 t_0917 t_0930 t_0945 t_1115 - time
  )

  (:init
    (at you richmond_district)
    (current_time t_0900)

    (person_at paul nob_hill)

    (next_time t_0900 t_0917)
    (next_time t_0917 t_0930)
    (next_time t_0930 t_0945)
    (next_time t_0945 t_1115)

    (travel_arrives richmond_district nob_hill t_0900 t_0917)

    (available_start paul t_0930)
    (meeting_end paul t_0930 t_0945)
  )

  (:goal
    (and
      (met paul)
      (current_time t_0945)
      (at you nob_hill)
    )
  )
)