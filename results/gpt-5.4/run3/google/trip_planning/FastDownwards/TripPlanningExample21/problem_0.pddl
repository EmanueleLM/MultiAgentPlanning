(define (problem european_trip_10_days_instance_problem)
  (:domain european_trip_10_days_instance)

  (:objects
    mykonos vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
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

    (direct_flight mykonos vienna)
    (direct_flight vienna mykonos)
    (direct_flight vienna venice)
    (direct_flight venice vienna)

    (workshop_window d5)
    (workshop_window d6)
    (workshop_window d7)
    (workshop_window d8)
    (workshop_window d9)
    (workshop_window d10)
  )

  (:goal
    (and
      (start_chosen)
      (day_processed d10)
      (current_day d10)
      (attended_workshop)

      ; exact 2 days in mykonos
      (at mykonos d1)
      (at mykonos d2)
      (not (at mykonos d3))
      (not (at mykonos d4))
      (not (at mykonos d5))
      (not (at mykonos d6))
      (not (at mykonos d7))
      (not (at mykonos d8))
      (not (at mykonos d9))
      (not (at mykonos d10))

      ; exact 4 days in vienna
      (at vienna d1)
      (at vienna d2)
      (at vienna d3)
      (at vienna d4)
      (not (at vienna d5))
      (not (at vienna d6))
      (not (at vienna d7))
      (not (at vienna d8))
      (not (at vienna d9))
      (not (at vienna d10))

      ; exact 6 days in venice
      (not (at venice d1))
      (not (at venice d2))
      (not (at venice d3))
      (not (at venice d4))
      (at venice d5)
      (at venice d6)
      (at venice d7)
      (at venice d8)
      (at venice d9)
      (at venice d10)
    )
  )
)