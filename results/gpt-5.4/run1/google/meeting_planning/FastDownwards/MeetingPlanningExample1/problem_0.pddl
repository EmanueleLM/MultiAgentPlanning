(define (problem san_francisco_meet_betty_instance)
  (:domain san_francisco_meet_betty)

  (:objects
    you - agent
    richmond_district financial_district - location
    betty - person
    t900 t921 t922 t1715 t1815 t2145 - time
  )

  (:init
    (at you richmond_district)
    (current_time t900)

    (road richmond_district financial_district)
    (road financial_district richmond_district)

    (travel_time richmond_district financial_district t900 t922)
    (travel_time financial_district richmond_district t900 t921)

    (next_time t922 t1715)
    (next_time t1715 t1815)
    (next_time t1815 t2145)

    (person_at betty financial_district)
    (available_start betty t1715)
    (available_end betty t2145)
    (meeting_slot betty t1715 t1815)
  )

  (:goal
    (and
      (met betty)
    )
  )
)