(define (problem san_francisco_meet_sandra_instance)
  (:domain san_francisco_meet_sandra)

  (:objects
    marina_district chinatown - location
    sandra - person
    t900 t915 t916 t931 t1130 t1145 - timepoint
  )

  (:init
    (at marina_district)
    (current_time t900)

    (road marina_district chinatown)
    (road chinatown marina_district)

    (friend_at sandra chinatown)

    (next t900 t915)
    (next t915 t916)
    (next t916 t931)
    (next t931 t1130)
    (next t1130 t1145)

    (travel_arrival marina_district chinatown t900 t916)

    (meeting_start_allowed sandra t900)
    (meeting_start_allowed sandra t916)
    (meeting_start_allowed sandra t1130)

    (meeting_interval t900 t915)
    (meeting_interval t916 t931)
    (meeting_interval t1130 t1145)
  )

  (:goal
    (and
      (met_minimum sandra)
    )
  )
)