(define (problem european_trip_12_days_instance_problem)
  (:domain european_trip_12_days_instance)

  (:objects
    seville munich tallinn - city
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 - day
  )

  (:init
    (unstarted)
    (current_day day_1)

    (next_day day_1 day_2)
    (next_day day_2 day_3)
    (next_day day_3 day_4)
    (next_day day_4 day_5)
    (next_day day_5 day_6)
    (next_day day_6 day_7)
    (next_day day_7 day_8)
    (next_day day_8 day_9)
    (next_day day_9 day_10)
    (next_day day_10 day_11)
    (next_day day_11 day_12)

    (direct seville munich)
    (direct munich seville)
    (direct munich tallinn)
    (direct tallinn munich)

    (need_seville_1)
    (need_seville_2)
    (need_seville_3)
    (need_seville_4)
    (need_seville_5)
    (need_seville_6)
    (need_seville_7)

    (need_munich_1)
    (need_munich_2)
    (need_munich_3)
    (need_munich_4)
    (need_munich_5)

    (need_tallinn_1)
    (need_tallinn_2)
  )

  (:goal
    (and
      (current_day day_12)
      (met_friend)
      (done_seville_1)
      (done_seville_2)
      (done_seville_3)
      (done_seville_4)
      (done_seville_5)
      (done_seville_6)
      (done_seville_7)
      (done_munich_1)
      (done_munich_2)
      (done_munich_3)
      (done_munich_4)
      (done_munich_5)
      (done_tallinn_1)
      (done_tallinn_2)
    )
  )
)