(define (problem trip_planning_example25)
  (:domain european_trip_16_days_min_init)

  (:objects
    valencia lyon split - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    (at valencia)
    (today d1)
    (visited d1 valencia)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)
    (next d14 d15)
    (next d15 d16)

    (required d1 valencia)
    (required d2 valencia)
    (required d3 valencia)
    (required d4 valencia)
    (required d5 valencia)

    (required d10 split)
    (required d11 split)
    (required d12 split)
    (required d13 split)
    (required d14 split)
    (required d15 split)
    (required d16 split)

    (required d6 lyon)
    (required d7 lyon)
    (required d8 lyon)
    (required d9 lyon)
    (required d10 lyon)
    (required d11 lyon)

    (goal_day d16)
  )

  (:goal
    (and
      (visited d1 valencia)
      (visited d2 valencia)
      (visited d3 valencia)
      (visited d4 valencia)
      (visited d5 valencia)

      (visited d6 lyon)
      (visited d7 lyon)
      (visited d8 lyon)
      (visited d9 lyon)
      (visited d10 split)
      (visited d11 split)
      (visited d12 split)
      (visited d13 split)
      (visited d14 split)
      (visited d15 split)
      (visited d16 split)

      (today d16)
    )
  )
)