(define (problem european_trip_11_days_instance)
  (:domain european_trip_11_days)

  (:objects
    traveler - person

    dubrovnik istanbul venice - city

    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day

    db0 db1 db2 db3 db4 - dubrovnik_count
    is0 is1 is2 is3 - istanbul_count
    ve0 ve1 ve2 ve3 ve4 ve5 ve6 - venice_count
  )

  (:init
    (at traveler dubrovnik)

    (direct_flight dubrovnik istanbul)
    (direct_flight istanbul dubrovnik)
    (direct_flight istanbul venice)

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
    (last_day d11)

    (dubrovnik_count_at db0)
    (next_dubrovnik_count db0 db1)
    (next_dubrovnik_count db1 db2)
    (next_dubrovnik_count db2 db3)
    (next_dubrovnik_count db3 db4)

    (istanbul_count_at is0)
    (next_istanbul_count is0 is1)
    (next_istanbul_count is1 is2)
    (next_istanbul_count is2 is3)

    (venice_count_at ve0)
    (next_venice_count ve0 ve1)
    (next_venice_count ve1 ve2)
    (next_venice_count ve2 ve3)
    (next_venice_count ve3 ve4)
    (next_venice_count ve4 ve5)
    (next_venice_count ve5 ve6)
  )

  (:goal
    (and
      (trip_complete)
      (dubrovnik_count_at db4)
      (istanbul_count_at is3)
      (venice_count_at ve6)
    )
  )
)