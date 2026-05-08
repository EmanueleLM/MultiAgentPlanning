(define (problem european_trip_13_days_instance_problem)
  (:domain european_trip_13_days_instance)

  (:objects
    day_1 day_2 day_3 day_4 day_5 day_6 day_7 day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day

    florence_count_0 florence_count_1 florence_count_2 florence_count_3 florence_count_4 - florence_count
    amsterdam_count_0 amsterdam_count_1 amsterdam_count_2 amsterdam_count_3 amsterdam_count_4 amsterdam_count_5 amsterdam_count_6 - amsterdam_count
    riga_count_0 riga_count_1 riga_count_2 riga_count_3 riga_count_4 riga_count_5 - riga_count
  )

  (:init
    (current_day day_1)

    (at florence)
    (at amsterdam)
    (at riga)

    (direct florence amsterdam)
    (direct amsterdam florence)
    (direct amsterdam riga)
    (direct riga amsterdam)

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

    (workshop_eligible_day day_1)
    (workshop_eligible_day day_2)
    (workshop_eligible_day day_3)
    (workshop_eligible_day day_4)

    (florence_next florence_count_0 florence_count_1)
    (florence_next florence_count_1 florence_count_2)
    (florence_next florence_count_2 florence_count_3)
    (florence_next florence_count_3 florence_count_4)

    (amsterdam_next amsterdam_count_0 amsterdam_count_1)
    (amsterdam_next amsterdam_count_1 amsterdam_count_2)
    (amsterdam_next amsterdam_count_2 amsterdam_count_3)
    (amsterdam_next amsterdam_count_3 amsterdam_count_4)
    (amsterdam_next amsterdam_count_4 amsterdam_count_5)
    (amsterdam_next amsterdam_count_5 amsterdam_count_6)

    (riga_next riga_count_0 riga_count_1)
    (riga_next riga_count_1 riga_count_2)
    (riga_next riga_count_2 riga_count_3)
    (riga_next riga_count_3 riga_count_4)
    (riga_next riga_count_4 riga_count_5)

    (florence_count_at florence_count_0)
    (amsterdam_count_at amsterdam_count_0)
    (riga_count_at riga_count_0)
  )

  (:goal
    (and
      (current_day day_14)
      (workshop_attended)
      (florence_count_at florence_count_4)
      (amsterdam_count_at amsterdam_count_6)
      (riga_count_at riga_count_5)
    )
  )
)