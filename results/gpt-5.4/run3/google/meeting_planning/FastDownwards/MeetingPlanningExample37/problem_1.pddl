(define (problem san_francisco_meet_jeffrey_instance)
  (:domain san_francisco_meet_jeffrey)

  (:objects
    bayview financial_district - location
    t_0900 t_0919 t_1400 - time
  )

  (:init
    (at bayview)

    (route bayview financial_district)
    (route financial_district bayview)

    (travel_departure bayview financial_district t_0900)
    (travel_arrival bayview financial_district t_0919)

    (current_time t_0900)
    (next_time t_0900 t_0919)
    (next_time t_0919 t_1215)
    (next_time t_1215 t_1345)
    (next_time t_1345 t_1400)

    (person_at jeffrey financial_district)
    (available_start jeffrey t_1215)
    (can_end_meeting jeffrey t_1345)
  )

  (:goal
    (and
      (met jeffrey)
    )
  )
)