(define (problem san_francisco_meet_stephanie_instance)
  (:domain san_francisco_meet_stephanie)

  (:objects
    fishermans_wharf nob_hill - location
    stephanie - person
    t_0900 t_0911 t_1645 t_1845 t_2145 - time
  )

  (:init
    (at fishermans_wharf)
    (connected fishermans_wharf nob_hill)
    (connected nob_hill fishermans_wharf)
    (current_time t_0900)
    (travel_arrival fishermans_wharf nob_hill t_0900 t_0911)
    (next_time t_0911 t_1645)
    (next_time t_1845 t_2145)
    (person_at stephanie nob_hill)
    (available_from stephanie t_1645)
    (available_until stephanie t_2145)
    (meeting_completion stephanie t_1645 t_1845)
  )

  (:goal
    (and
      (met_minimum stephanie)
      (at nob_hill)
      (current_time t_1845)
    )
  )
)