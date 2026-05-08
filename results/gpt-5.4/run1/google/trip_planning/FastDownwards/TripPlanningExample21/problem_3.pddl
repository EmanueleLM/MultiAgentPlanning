(define (problem tripplanningexample21)
  (:domain european_trip_10_days_instance)

  (:objects
    mykonos vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )

  (:init
    (at mykonos)
    (current_day d1)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (direct mykonos vienna)
    (direct vienna mykonos)
    (direct vienna venice)
    (direct venice vienna)

    (visited mykonos d1)

    (free_day d1)
    (free_day d2)
    (free_day d3)
    (free_day d4)
    (free_day d5)
    (free_day d6)
    (free_day d7)
    (free_day d8)
    (free_day d9)
    (free_day d10)

    (workshop_window d5)
    (workshop_window d6)
    (workshop_window d7)
    (workshop_window d8)
    (workshop_window d9)
    (workshop_window d10)
  )

  (:goal
    (and
      (visited mykonos d1)
      (visited mykonos d2)

      (visited vienna d3)
      (visited vienna d4)
      (visited vienna d5)
      (visited vienna d6)

      (visited venice d5)
      (visited venice d6)
      (visited venice d7)
      (visited venice d8)
      (visited venice d9)
      (visited venice d10)

      (workshop_done)
      (at venice)
      (current_day d10)
    )
  )
)