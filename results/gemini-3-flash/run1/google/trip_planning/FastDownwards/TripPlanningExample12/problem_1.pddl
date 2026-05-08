(define (problem trip_planning_problem)
  (:domain trip_planning)
  (:objects
    valencia amsterdam tallinn - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    c0 c1 c2 c3 c4 c5 c6 c7 - count
  )
  (:init
    ;; Starting location and day
    (at valencia)
    (current_day d1)

    ;; Stay counts for each city initialized to zero
    (day_count valencia c0)
    (day_count amsterdam c0)
    (day_count tallinn c0)

    ;; Temporal ordering of days
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
    (next_day d13 d14)
    (next_day d14 d15)
    (next_day d15 d16)

    ;; Count increments for city durations
    (inc c0 c1)
    (inc c1 c2)
    (inc c2 c3)
    (inc c3 c4)
    (inc c4 c5)
    (inc c5 c6)
    (inc c6 c7)

    ;; Available flight connections
    (can_fly amsterdam tallinn)
    (can_fly tallinn amsterdam)
    (can_fly valencia amsterdam)
    (can_fly amsterdam valencia)
  )
  (:goal
    (and
      ;; Total trip duration must be 15 days (reaching d16)
      (current_day d16)

      ;; Specific visit durations for each city
      (day_count valencia c5)
      (day_count amsterdam c5)
      (day_count tallinn c7)

      ;; Friend meeting requirement in Tallinn (Day 9 to Day 15)
      (visited tallinn d9)
      (visited tallinn d10)
      (visited tallinn d11)
      (visited tallinn d12)
      (visited tallinn d13)
      (visited tallinn d14)
      (visited tallinn d15)
    )
  )
)