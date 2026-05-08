(define (problem meet_jeffrey_instance)
  (:domain meet_jeffrey_san_francisco_day)

  (:objects
    bayview financial_district - location
    jeffrey - person
    t0900 t1215 t1345 t1400 - timepoint
  )

  (:init
    (at bayview)
    (current_time t0900)

    (connected bayview financial_district)
    (connected financial_district bayview)

    (next t0900 t1215)
    (next t1215 t1345)
    (next t1345 t1400)

    (travel_reaches_by bayview financial_district t0900 t1215)

    (person_at jeffrey financial_district)
    (available jeffrey t1215 t1345)
  )

  (:goal
    (and
      (met_minimum jeffrey)
    )
  )
)