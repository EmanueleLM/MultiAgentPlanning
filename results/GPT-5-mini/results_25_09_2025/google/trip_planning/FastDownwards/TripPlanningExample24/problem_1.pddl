(define (problem itinerary-13-days)
  (:domain multi-agent-itinerary-orch)
  (:objects
    florence amsterdam riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 - day
  )
  (:init
    (direct-flight florence amsterdam)
    (direct-flight amsterdam florence)
    (direct-flight amsterdam riga)
    (direct-flight riga amsterdam)

    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)

    (workshop-allowed d1) (workshop-allowed d2) (workshop-allowed d3) (workshop-allowed d4)

    (f-q4)
    (a-q6)
    (r-q5)
  )
  (:goal (and
    (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
    (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10)
    (assigned d11) (assigned d12) (assigned d13)
    (f-q0) (a-q0) (r-q0)
    (workshop-attended)
  ))
)