(define (problem sf_day_meeting_stephanie_instance)
  (:domain sf_day_meeting_stephanie)

  (:objects
    marina_district mission_district - location
    stephanie - person
    t900 t920 t1030 t1230 - timepoint
  )

  (:init
    (at marina_district)
    (current_time t900)

    (person_at stephanie mission_district)

    (travel_edge marina_district mission_district t900 t920)

    (wait_edge mission_district t920 t1030)

    (available_for_meeting stephanie mission_district t1030 t1230)
  )

  (:goal
    (and
      (met_minimum stephanie)
      (at mission_district)
      (current_time t1230)
    )
  )
)