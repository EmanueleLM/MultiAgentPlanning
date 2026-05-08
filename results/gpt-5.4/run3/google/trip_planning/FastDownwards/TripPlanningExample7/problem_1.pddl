(define (problem trip_planning_example7_instance)
  (:domain trip_planning_example7)

  (:objects
    dubrovnik istanbul venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 - day
  )

  (:init
    (at dubrovnik)

    (direct dubrovnik istanbul)
    (direct istanbul dubrovnik)
    (direct istanbul venice)
    (direct venice istanbul)

    (day_cursor d1)
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
    (next_day d11 d12)
  )

  (:goal
    (and
      (day_cursor d12)

      (visited d1 dubrovnik)
      (visited d2 dubrovnik)
      (visited d3 dubrovnik)
      (visited d4 dubrovnik)

      (visited d5 istanbul)
      (visited d6 istanbul)
      (visited d7 istanbul)

      (visited d8 venice)
      (visited d9 venice)
      (visited d10 venice)
      (visited d11 venice)
    )
  )
)