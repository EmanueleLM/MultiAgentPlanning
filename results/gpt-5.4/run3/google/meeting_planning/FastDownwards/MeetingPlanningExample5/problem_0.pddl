(define (problem meet_william_specific_instance)
  (:domain meet_william_san_francisco_day)

  (:objects
    nob_hill the_castro - location
    william - person
    t0900 t1215 t1231 t1248 t1303 t1323 t2200 - timepoint
  )

  (:init
    (at nob_hill)
    (current_time t0900)

    (person_at william the_castro)

    (next_time t0900 t1215)
    (next_time t1215 t1231)
    (next_time t1231 t1248)
    (next_time t1248 t1303)
    (next_time t1303 t1323)
    (next_time t1323 t2200)

    (travel_time nob_hill the_castro t1215 t1231)
    (travel_time nob_hill the_castro t1231 t1248)

    (meeting_interval_75 william the_castro t1215 t2200)
    (meeting_interval_75 william the_castro t1231 t2200)
    (meeting_interval_75 william the_castro t1248 t2200)
    (meeting_interval_75 william the_castro t1303 t2200)
    (meeting_interval_75 william the_castro t1323 t2200)
  )

  (:goal
    (and
      (met_75 william)
    )
  )
)