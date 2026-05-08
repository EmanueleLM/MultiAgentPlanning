(define (problem meet_sandra_day_instance)
  (:domain meet_sandra_day)

  (:objects
    marina_district - location
  )

  (:init
    (at marina_district)
    (friend_at sandra chinatown)
    (available sandra)
    (current_time t_0900)
    (travel_time marina_district chinatown t_0900 t_0916)
    (meeting_slot sandra t_0916 t_0931)
  )

  (:goal
    (and
      (met sandra)
    )
  )
)