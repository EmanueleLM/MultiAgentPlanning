(define (problem san_francisco_meet_betty_instance)
  (:domain san_francisco_meet_betty)

  (:objects
    richmond_district financial_district - location
    traveler betty - person
    t_9_00_am t_9_22_am t_5_15_pm t_6_15_pm t_9_45_pm - timepoint
  )

  (:init
    (at traveler richmond_district)
    (at betty financial_district)
    (current_time t_9_00_am)

    (next_time t_9_00_am t_9_22_am)
    (next_time t_9_22_am t_5_15_pm)
    (next_time t_5_15_pm t_6_15_pm)
    (next_time t_6_15_pm t_9_45_pm)

    (travel_arrives richmond_district financial_district t_9_00_am t_9_22_am)

    (available betty t_5_15_pm t_9_45_pm)

    (meeting_slot betty financial_district t_5_15_pm t_6_15_pm)
  )

  (:goal
    (and
      (met betty)
      (current_time t_6_15_pm)
      (at traveler financial_district)
    )
  )
)