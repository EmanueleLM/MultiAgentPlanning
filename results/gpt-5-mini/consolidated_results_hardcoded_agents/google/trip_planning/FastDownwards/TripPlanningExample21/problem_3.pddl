(define (problem trip-10-days)
  (:domain multi_city_itinerary)
  (:objects
    traveler - person
    Mykonos Vienna Venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day
    myk-slot1 myk-slot2 vienna-slot1 vienna-slot2 vienna-slot3 vienna-slot4 venice-slot1 venice-slot2 venice-slot3 venice-slot4 venice-slot5 venice-slot6 - slot
  )

  (:init
    (flight Mykonos Vienna)
    (flight Vienna Mykonos)
    (flight Vienna Venice)
    (flight Venice Vienna)

    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    (unassigned day1)
    (unassigned day2)
    (unassigned day3)
    (unassigned day4)
    (unassigned day5)
    (unassigned day6)
    (unassigned day7)
    (unassigned day8)
    (unassigned day9)
    (unassigned day10)

    (workshop-window day5)
    (workshop-window day6)
    (workshop-window day7)
    (workshop-window day8)
    (workshop-window day9)
    (workshop-window day10)

    (start-day day1)
    (workshop-city Venice)
  )

  (:metric minimize (total-cost))

  (:goal
    (and
      (slot-fulfilled myk-slot1)
      (slot-fulfilled myk-slot2)
      (slot-fulfilled vienna-slot1)
      (slot-fulfilled vienna-slot2)
      (slot-fulfilled vienna-slot3)
      (slot-fulfilled vienna-slot4)
      (slot-fulfilled venice-slot1)
      (slot-fulfilled venice-slot2)
      (slot-fulfilled venice-slot3)
      (slot-fulfilled venice-slot4)
      (slot-fulfilled venice-slot5)
      (slot-fulfilled venice-slot6)
      (workshop-done)
      (occupied day1)
      (occupied day2)
      (occupied day3)
      (occupied day4)
      (occupied day5)
      (occupied day6)
      (occupied day7)
      (occupied day8)
      (occupied day9)
      (occupied day10)
    )
  )
)