(define (problem trip_planning_example41_problem)
  (:domain trip_planning_example41)

  (:objects
    stockholm athens mykonos - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )

  (:init
    (direct_flight stockholm athens)
    (direct_flight athens stockholm)
    (direct_flight athens mykonos)
    (direct_flight mykonos athens)

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
    (next_day d12 d13)

    (current_day d1)
    (at stockholm)
    (visited stockholm d1)
  )

  (:goal
    (and
      (done)
    )
  )
)