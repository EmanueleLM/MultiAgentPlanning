(define (problem TripPlanningExample40-prob)
  (:domain trip-planning)
  (:objects
    oslo reykjavik manchester - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
  )
  (:init
    (flight oslo reykjavik)
    (flight reykjavik oslo)
    (flight oslo manchester)
    (flight manchester oslo)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)

    (at manchester d1)
  )
  (:goal (and
    (at manchester d1) (at manchester d2)
    (at oslo d3) (at oslo d4) (at oslo d5) (at oslo d8)
    (at reykjavik d6) (at reykjavik d7)
  ))
)