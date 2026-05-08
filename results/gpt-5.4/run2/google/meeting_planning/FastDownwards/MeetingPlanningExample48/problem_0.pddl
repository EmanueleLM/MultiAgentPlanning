(define (problem san_francisco_joseph_day_instance)
  (:domain san_francisco_joseph_day)

  (:objects
    financial_district union_square - location
    joseph - person
    t_0900 t_0909 t_0930pm t_0939pm t_0945pm t_1000pm - time
  )

  (:init
    (at financial_district)
    (current_time t_0900)

    (next_time t_0900 t_0909)
    (next_time t_0909 t_0930pm)
    (next_time t_0930pm t_0939pm)
    (next_time t_0939pm t_0945pm)
    (next_time t_0945pm t_1000pm)

    (travel_9 financial_district union_square t_0900 t_0909)
    (travel_9 financial_district union_square t_0930pm t_0939pm)
    (travel_9 union_square financial_district t_0930pm t_0939pm)
    (travel_9 union_square financial_district t_0939pm t_0945pm)

    (available joseph t_0930pm t_0945pm)
  )

  (:goal
    (and
      (met joseph)
    )
  )
)