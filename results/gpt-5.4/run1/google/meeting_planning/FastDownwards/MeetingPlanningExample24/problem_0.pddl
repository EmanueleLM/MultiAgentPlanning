(define (problem meet_matthew_instance)
  (:domain meet_matthew_san_francisco)

  (:objects
    nob_hill presidio - location
    matthew - person
    t_900 t_917 t_1100 t_1130 t_1515 - timepoint
  )

  (:init
    (at nob_hill)
    (current_time t_900)

    (travel_slot nob_hill presidio t_900 t_917)
    (wait_slot presidio t_917 t_1100)

    (available_start matthew presidio t_1100)
    (meeting_end matthew t_1100 t_1130)
  )

  (:goal
    (and
      (met_minimum matthew)
      (at presidio)
      (current_time t_1130)
    )
  )
)