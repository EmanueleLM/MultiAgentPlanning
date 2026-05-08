(define (problem trip_problem)
  (:domain trip_planning)

  (:objects
    oslo dublin valencia - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
  )

  (:init
    ;; Defining the chronological order of 9 days.
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    ;; Direct flight network as described in the specification.
    (conn oslo dublin)
    (conn dublin oslo)
    (conn dublin valencia)
    (conn valencia dublin)

    ;; Starting state: At Oslo on Day 1.
    (at oslo)
    (current_day d1)
    (spent oslo d1)
  )

  (:goal
    (and
      ;; Explicit requirement to spend 3 days in Oslo.
      (spent oslo d1)
      (spent oslo d2)
      (spent oslo d3)

      ;; Explicit requirement to stay in Dublin for 3 days.
      (spent dublin d3)
      (spent dublin d4)
      (spent dublin d5)

      ;; Explicit requirement to spend 5 days in Valencia.
      ;; Also covers the visit to relatives between day 5 and day 9.
      (spent valencia d5)
      (spent valencia d6)
      (spent valencia d7)
      (spent valencia d8)
      (spent valencia d9)

      ;; Ensure the itinerary reaches the final day.
      (current_day d9)
    )
  )
)