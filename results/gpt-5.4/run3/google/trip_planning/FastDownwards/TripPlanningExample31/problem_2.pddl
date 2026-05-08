(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    frankfurt reykjavik split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )

  (:init
    (at frankfurt)
    (current_day d1)

    (next_day d1 d2)
    (next_day d2 d3)
    (next_day d3 d4)
    (next_day d4 d5)
    (next_day d5 d6)
    (next_day d6 d7)
    (next_day d7 d8)
    (next_day d8 d9)
    (next_day d9 d10)
    (next_day d10 d11)

    (direct_flight frankfurt reykjavik)
    (direct_flight reykjavik frankfurt)
    (direct_flight frankfurt split)
    (direct_flight split frankfurt)

    (workshop_day d8)
    (workshop_day d9)
    (workshop_day d10)

    (stay_counted frankfurt d1)
    (stay_counted frankfurt d2)

    (stay_counted reykjavik d8)
    (stay_counted reykjavik d9)
    (stay_counted reykjavik d10)

    (stay_counted split d1)
    (stay_counted split d2)
    (stay_counted split d3)
    (stay_counted split d4)
    (stay_counted split d5)
    (stay_counted split d6)
    (stay_counted split d7)
  )

  (:goal
    (and
      (current_day d11)
      (workshop_attended)
      (at split)
    )
  )
)