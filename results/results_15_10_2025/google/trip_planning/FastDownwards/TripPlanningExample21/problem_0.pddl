(define (problem trip-10-days)
  (:domain multi_city_itinerary)
  (:objects
    traveler - person
    Mykonos Vienna Venice - city
    day1 day2 day3 day4 day5 day6 day7 day8 day9 day10 - day

    ;; preference slots: Mykonos 2, Vienna 4, Venice 6 (total 12 slots; over-subscription handled by relax-slot)
    myk-slot1 myk-slot2
    vienna-slot1 vienna-slot2 vienna-slot3 vienna-slot4
    venice-slot1 venice-slot2 venice-slot3 venice-slot4 venice-slot5 venice-slot6
    - slot
  )

  (:init
    ;; Direct flights (only listed direct connections permitted)
    (flight Mykonos Vienna)
    (flight Vienna Mykonos)
    (flight Vienna Venice)
    (flight Venice Vienna)

    ;; Linear day progression
    (next day1 day2)
    (next day2 day3)
    (next day3 day4)
    (next day4 day5)
    (next day5 day6)
    (next day6 day7)
    (next day7 day8)
    (next day8 day9)
    (next day9 day10)

    ;; All days initially unassigned for slot-mapping
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

    ;; Workshop allowed days (Venice workshop must be between day5 and day10 inclusive)
    (workshop-window day5)
    (workshop-window day6)
    (workshop-window day7)
    (workshop-window day8)
    (workshop-window day9)
    (workshop-window day10)

    ;; No other initial facts about visited, occupied or slots fulfilled; start action selects first-city.
    ;; Preference slots are initially unfulfilled (slot-fulfilled facts are absent).
  )

  ;; Metric: prefer plans that minimize use of relax-slot (relax-slot has cost 10)
  (:metric minimize (total-cost))

  (:goal
    (and
      ;; All preference slots must be fulfilled (either by actual day assignments via fulfill-slot, or by relax-slot)
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

      ;; The Venice workshop must be attended between day5 and day10 (fulfilled if workshop-done true)
      (workshop-done)

      ;; Traveler must occupy each day of the 10-day horizon (ensures full 10-day itinerary)
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