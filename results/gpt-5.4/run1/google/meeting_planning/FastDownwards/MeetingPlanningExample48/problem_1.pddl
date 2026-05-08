(define (problem san_francisco_joseph_visit_instance)
  (:domain san_francisco_joseph_visit)

  (:objects
    joseph - person
    t_0900 t_0909 t_0930pm t_0945pm t_1000pm - timepoint
  )

  (:init
    (at financial_district)
    (current_time t_0900)
    (travel_link financial_district union_square t_0900 t_0909)
    (next_time t_0909 t_0930pm)
    (next_time t_0930pm t_0945pm)
    (next_time t_0945pm t_1000pm)
    (joseph_available_segment union_square t_0930pm t_0945pm)
    (joseph_available_segment union_square t_0945pm t_1000pm)
  )

  (:goal
    (and
      (met_joseph)
    )
  )
)