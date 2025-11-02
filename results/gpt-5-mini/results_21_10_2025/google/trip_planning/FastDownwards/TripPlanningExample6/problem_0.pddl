(define (problem itinerary-8days)
  (:domain multiagent-travel)
  (:objects
    berlin munich dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
  )

  (:init
    ; day sequencing
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)

    ; start: in Berlin on day 1 (conference day 1)
    (in berlin d1)
  )

  ; Goals:
  ; - Must be in Berlin on day 1 and day 4 (conference constraint)
  ; - Must be in Dubrovnik for three full days (days 5,6,7) as proposed by the Dubrovnik planner
  ; - Must visit Munich at least once during the trip (we require presence in Munich on day 2 to satisfy the "visit Munich" requirement)
  (:goal (and
    (in berlin d1)
    (in berlin d4)
    (in dubrovnik d5)
    (in dubrovnik d6)
    (in dubrovnik d7)
    (in munich d2)
  ))
)