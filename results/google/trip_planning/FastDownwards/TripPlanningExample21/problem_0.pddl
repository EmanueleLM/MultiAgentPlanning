(define (problem travel-ten-day-instance)
  (:domain travel-ten-day)
  (:objects
    mykonos vienna venice - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    (current-day d1)
    (at mykonos)
    (visited mykonos)

    (direct mykonos vienna)
    (direct vienna mykonos)
    (direct vienna venice)
    (direct venice vienna)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)
    (next d9 d10)

    (window d5)
    (window d6)
    (window d7)
    (window d8)
    (window d9)
    (window d10)
  )
  (:goal (and
    (current-day d10)
    (visited mykonos)
    (visited vienna)
    (visited venice)
    (attended)
  ))
)