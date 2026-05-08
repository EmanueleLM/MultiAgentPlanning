(define (problem san_francisco_betty_visit_instance)
  (:domain san_francisco_betty_visit)

  (:objects
    t_0900
    t_0645pm
    t_0702pm
    t_0703pm
    t_0800pm
    t_0818pm
    t_0845pm
    t_1000pm - time
  )

  (:init
    (at you presidio)
    (current_time t_0900)

    (wait_link t_0900 t_0645pm)
    (wait_link t_0645pm t_0800pm)
    (wait_link t_0703pm t_0818pm)
    (wait_link t_0800pm t_0845pm)
    (wait_link t_0818pm t_1000pm)

    (travel_presidio_to_north_beach t_0645pm t_0703pm)
    (travel_north_beach_to_presidio t_0645pm t_0702pm)

    (betty_available_start t_0645pm)
    (betty_available_start t_0703pm)
    (betty_available_start t_0800pm)
    (betty_available_start t_0818pm)
    (betty_available_start t_0845pm)

    (valid_meeting_interval t_0645pm t_0800pm)
    (valid_meeting_interval t_0703pm t_0818pm)
    (valid_meeting_interval t_0800pm t_1000pm)
    (valid_meeting_interval t_0818pm t_1000pm)
    (valid_meeting_interval t_0845pm t_1000pm)
  )

  (:goal
    (and
      (met_betty)
    )
  )
)