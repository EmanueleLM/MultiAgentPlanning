(define (problem meet_william_specific_instance)
  (:domain meet_william_san_francisco_day)

  (:objects
    nob_hill the_castro - place
    william - person
    t0900 t0917 t1215 t1330 t2200 - timepoint
  )

  (:init
    (at nob_hill)
    (friend_at william the_castro)
    (current_time t0900)
    (available william t1215)

    (next_time t0900 t0917)
    (next_time t0917 t1215)
    (next_time t1215 t1330)
    (next_time t1330 t2200)

    (travel_arrival nob_hill the_castro t0900 t0917)
  )

  (:goal
    (and
      (met_minimum william)
      (met_with william)
      (at the_castro)
      (current_time t1330)
    )
  )
)