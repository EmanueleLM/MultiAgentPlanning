(define (problem TripPlanningExample6-problem)
  (:domain TripPlanningExample6)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 - day
  )
  (:init
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (in berlin d1)
    (occupied d1)
  )
  (:goal
    (and
      (in berlin d1)
      (in berlin d4)
      (visited-munich)
      (visited-dubrovnik)
    )
  )
)