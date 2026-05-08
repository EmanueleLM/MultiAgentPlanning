(define (problem meet_betty_specific_instance)
  (:domain meet_betty_san_francisco_day)

  (:objects
    richmond_district financial_district - location
    betty - person
    t_0900 t_1653 t_1715 t_1815 - time
  )

  (:init
    (at richmond_district)
    (current_time t_0900)
    (connected richmond_district financial_district)
    (connected financial_district richmond_district)
    (person_at betty financial_district)
    (available_for_meeting_at betty t_1715)
  )

  (:goal
    (and
      (met betty)
      (at financial_district)
      (current_time t_1815)
    )
  )
)