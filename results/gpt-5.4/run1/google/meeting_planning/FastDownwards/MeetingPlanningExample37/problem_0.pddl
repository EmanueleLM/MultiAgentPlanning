(define (problem san_francisco_jeffrey_day_instance)
  (:domain san_francisco_jeffrey_day)

  (:objects
    bayview financial_district - location
    jeffrey - person
    t0900 t0919 t1215 t1234 t1345 t1400 - time
  )

  (:init
    (at bayview)
    (current_time t0900)

    (connected bayview financial_district)
    (connected financial_district bayview)

    (next_time t0900 t0919)
    (next_time t0919 t1215)
    (next_time t1215 t1234)
    (next_time t1234 t1345)
    (next_time t1345 t1400)

    (travel_time_19 bayview financial_district t0900 t0919)
    (travel_time_19 bayview financial_district t1215 t1234)
    (travel_time_19 financial_district bayview t1215 t1234)

    (available jeffrey financial_district t1215 t1400)

    (can_complete_90 jeffrey t1215 t1345)
  )

  (:goal
    (and
      (met_minimum jeffrey)
    )
  )
)