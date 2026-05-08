(define (problem san_francisco_meet_william_instance)
  (:domain san_francisco_meet_william)

  (:objects
    nob_hill the_castro - location
    william - person
    t_0900 t_1215 t_1330 - time
  )

  (:init
    (at nob_hill)
    (current_time t_0900)
    (connected nob_hill the_castro)
    (connected the_castro nob_hill)
    (available william the_castro t_1215)
  )

  (:goal
    (and
      (met william)
      (current_time t_1330)
      (at the_castro)
    )
  )
)