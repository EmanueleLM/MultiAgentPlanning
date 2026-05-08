(define (problem european_trip_13days_instance_problem)
  (:domain european_trip_13days_instance)

  (:objects
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 - day

    florence_0 florence_1 florence_2 florence_3 florence_4 - florence_count

    amsterdam_0 amsterdam_1 amsterdam_2 amsterdam_3 amsterdam_4 amsterdam_5 amsterdam_6 - amsterdam_count

    riga_0 riga_1 riga_2 riga_3 riga_4 riga_5 - riga_count
  )

  (:init
    (connected florence amsterdam)
    (connected amsterdam florence)
    (connected amsterdam riga)
    (connected riga amsterdam)

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

    (workshop_day day_1)
    (workshop_day day_2)
    (workshop_day day_3)
    (workshop_day day_4)

    (final_day day_13)

    (florence_count_next florence_0 florence_1)
    (florence_count_next florence_1 florence_2)
    (florence_count_next florence_2 florence_3)
    (florence_count_next florence_3 florence_4)

    (amsterdam_count_next amsterdam_0 amsterdam_1)
    (amsterdam_count_next amsterdam_1 amsterdam_2)
    (amsterdam_count_next amsterdam_2 amsterdam_3)
    (amsterdam_count_next amsterdam_3 amsterdam_4)
    (amsterdam_count_next amsterdam_4 amsterdam_5)
    (amsterdam_count_next amsterdam_5 amsterdam_6)

    (riga_count_next riga_0 riga_1)
    (riga_count_next riga_1 riga_2)
    (riga_count_next riga_2 riga_3)
    (riga_count_next riga_3 riga_4)
    (riga_count_next riga_4 riga_5)

    (current_day day_1)
    (day_assigned day_1)
    (in_city florence day_1)
    (workshop_attended)

    (florence_count_at florence_1)
    (amsterdam_count_at amsterdam_0)
    (riga_count_at riga_0)
  )

  (:goal
    (and
      (current_day day_13)
      (day_assigned day_13)
      (workshop_attended)
      (florence_count_at florence_4)
      (amsterdam_count_at amsterdam_6)
      (riga_count_at riga_5)
      (final_day day_13)
    )
  )
)