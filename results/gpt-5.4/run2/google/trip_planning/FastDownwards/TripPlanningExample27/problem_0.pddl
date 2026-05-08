(define (problem european_trip_14_days_instance_problem)
  (:domain european_trip_14_days_instance)
  (:objects
    amsterdam santorini istanbul - city

    day_1 day_2 day_3 day_4 day_5 day_6 day_7
    day_8 day_9 day_10 day_11 day_12 day_13 day_14 - day

    amsterdam_1 amsterdam_2 amsterdam_3 amsterdam_4 amsterdam_5 amsterdam_6 amsterdam_7 - slot
    istanbul_1 istanbul_2 istanbul_3 istanbul_4 istanbul_5 istanbul_6 - slot
    santorini_1 santorini_2 santorini_3 - slot
  )

  (:init
    (current_day day_1)

    (at amsterdam)
    (occupied amsterdam day_1)

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

    (direct_flight amsterdam santorini)
    (direct_flight santorini amsterdam)
    (direct_flight istanbul amsterdam)
    (direct_flight amsterdam istanbul)

    (slot_for_city amsterdam_1 amsterdam)
    (slot_for_city amsterdam_2 amsterdam)
    (slot_for_city amsterdam_3 amsterdam)
    (slot_for_city amsterdam_4 amsterdam)
    (slot_for_city amsterdam_5 amsterdam)
    (slot_for_city amsterdam_6 amsterdam)
    (slot_for_city amsterdam_7 amsterdam)

    (slot_head amsterdam amsterdam_1)
    (slot_tail amsterdam amsterdam_7)
    (slot_next amsterdam_1 amsterdam_2)
    (slot_next amsterdam_2 amsterdam_3)
    (slot_next amsterdam_3 amsterdam_4)
    (slot_next amsterdam_4 amsterdam_5)
    (slot_next amsterdam_5 amsterdam_6)
    (slot_next amsterdam_6 amsterdam_7)

    (slot_for_city istanbul_1 istanbul)
    (slot_for_city istanbul_2 istanbul)
    (slot_for_city istanbul_3 istanbul)
    (slot_for_city istanbul_4 istanbul)
    (slot_for_city istanbul_5 istanbul)
    (slot_for_city istanbul_6 istanbul)

    (slot_head istanbul istanbul_1)
    (slot_tail istanbul istanbul_6)
    (slot_next istanbul_1 istanbul_2)
    (slot_next istanbul_2 istanbul_3)
    (slot_next istanbul_3 istanbul_4)
    (slot_next istanbul_4 istanbul_5)
    (slot_next istanbul_5 istanbul_6)

    (slot_for_city santorini_1 santorini)
    (slot_for_city santorini_2 santorini)
    (slot_for_city santorini_3 santorini)

    (slot_head santorini santorini_1)
    (slot_tail santorini santorini_3)
    (slot_next santorini_1 santorini_2)
    (slot_next santorini_2 santorini_3)

    (slot_used amsterdam_1)
    (slot_open amsterdam amsterdam_2)
  )

  (:goal
    (and
      (current_day day_14)

      (slot_used amsterdam_1)
      (slot_used amsterdam_2)
      (slot_used amsterdam_3)
      (slot_used amsterdam_4)
      (slot_used amsterdam_5)
      (slot_used amsterdam_6)
      (slot_used amsterdam_7)

      (slot_used istanbul_1)
      (slot_used istanbul_2)
      (slot_used istanbul_3)
      (slot_used istanbul_4)
      (slot_used istanbul_5)
      (slot_used istanbul_6)

      (slot_used santorini_1)
      (slot_used santorini_2)
      (slot_used santorini_3)

      (occupied santorini day_12)
      (occupied santorini day_13)
      (occupied santorini day_14)
    )
  )
)