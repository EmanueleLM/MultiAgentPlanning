(define (problem san_francisco_day_meeting_instance)
  (:domain san_francisco_day_meeting)

  (:objects
    richmond_district bayview - location
    sarah - person
    t900 t925 t926 t1415 t1500 t1730 - time
  )

  (:init
    (at richmond_district)
    (current_time t900)
    (person_at sarah bayview)

    (connected richmond_district bayview)
    (connected bayview richmond_district)

    (travel_time_from_t900 richmond_district bayview t926)
    (travel_time_from_t900 bayview richmond_district t925)

    (next_time t900 t925)
    (next_time t925 t926)
    (next_time t926 t1415)
    (next_time t1415 t1500)
    (next_time t1500 t1730)

    (available_at sarah bayview t1415 t1730)
  )

  (:goal
    (and
      (met sarah)
    )
  )
)