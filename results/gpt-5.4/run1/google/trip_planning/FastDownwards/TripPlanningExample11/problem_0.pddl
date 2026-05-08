(define (problem european_trip_15_days_instance)
  (:domain european_trip_15_days)

  (:objects
    vienna vilnius valencia - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 day_15 day_16 - day

    vienna_0 vienna_1 vienna_2 vienna_3 vienna_4 vienna_5
    vilnius_0 vilnius_1 vilnius_2 vilnius_3 vilnius_4 vilnius_5
    valencia_0 valencia_1 valencia_2 valencia_3 valencia_4 valencia_5 valencia_6 valencia_7 - visit_count
  )

  (:init
    (current_day day_1)
    (at vienna)

    (direct_flight vienna valencia)
    (direct_flight valencia vienna)
    (direct_flight vilnius vienna)
    (direct_flight vienna vilnius)

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
    (next_day day_12 day_13)
    (next_day day_13 day_14)
    (next_day day_14 day_15)
    (next_day day_15 day_16)

    (vienna_count vienna_0)
    (next_vienna_count vienna_0 vienna_1)
    (next_vienna_count vienna_1 vienna_2)
    (next_vienna_count vienna_2 vienna_3)
    (next_vienna_count vienna_3 vienna_4)
    (next_vienna_count vienna_4 vienna_5)

    (vilnius_count vilnius_0)
    (next_vilnius_count vilnius_0 vilnius_1)
    (next_vilnius_count vilnius_1 vilnius_2)
    (next_vilnius_count vilnius_2 vilnius_3)
    (next_vilnius_count vilnius_3 vilnius_4)
    (next_vilnius_count vilnius_4 vilnius_5)

    (valencia_count valencia_0)
    (next_valencia_count valencia_0 valencia_1)
    (next_valencia_count valencia_1 valencia_2)
    (next_valencia_count valencia_2 valencia_3)
    (next_valencia_count valencia_3 valencia_4)
    (next_valencia_count valencia_4 valencia_5)
    (next_valencia_count valencia_5 valencia_6)
    (next_valencia_count valencia_6 valencia_7)
  )

  (:goal
    (and
      (current_day day_16)
      (vienna_count vienna_5)
      (vilnius_count vilnius_5)
      (valencia_count valencia_7)
      (conference_day_9_done)
      (conference_day_15_done)
    )
  )
)