(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
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

    (spent frankfurt d1)
    (spent frankfurt d2)

    (spent reykjavik d8)
    (spent reykjavik d9)
    (spent reykjavik d10)

    (spent split d1)
    (spent split d2)
    (spent split d3)
    (spent split d4)
    (spent split d5)
    (spent split d6)
    (spent split d7)
  )

  (:goal
    (and
      (current_day d11)
      (workshop_attended)
      (at split)
    )
  )
)