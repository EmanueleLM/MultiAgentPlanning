(define (problem san_francisco_meet_betty_instance)
  (:domain san_francisco_meet_betty)

  (:objects
    pacific_heights fishermans_wharf - location
    betty - person
    t_9_00 t_9_13 t_10_58 t_18_00 - timepoint
  )

  (:init
    (at pacific_heights)
    (current_time t_9_00)

    (person_at betty fishermans_wharf)

    (connected pacific_heights fishermans_wharf t_9_00 t_9_13)

    (meeting_window_105 betty t_9_13 t_10_58)
  )

  (:goal
    (and
      (met betty)
      (at fishermans_wharf)
      (current_time t_10_58)
    )
  )
)