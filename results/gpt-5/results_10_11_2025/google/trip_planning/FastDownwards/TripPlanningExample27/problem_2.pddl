(define (problem TripPlanningExample27)
  (:domain tripplanning)
  (:objects
    amsterdam santorini istanbul - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 - day
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
    (next d8 d9)
    (next d9 d10)
    (next d10 d11)
    (next d11 d12)
    (next d12 d13)
    (next d13 d14)

    ; direct flight network
    (direct amsterdam santorini)
    (direct santorini amsterdam)
    (direct amsterdam istanbul)
    (direct istanbul amsterdam)

    ; start at day 1 in Amsterdam
    (assigned d1)
    (at d1 amsterdam)
    (current d1)
  )
  (:goal
    (and
      (assigned d14)
      (at d1 amsterdam)
      (at d2 amsterdam)
      (at d3 amsterdam)
      (at d4 amsterdam)
      (at d5 istanbul)
      (at d6 istanbul)
      (at d7 istanbul)
      (at d8 istanbul)
      (at d9 amsterdam)
      (at d10 amsterdam)
      (at d11 amsterdam)
      (at d12 santorini)
      (at d13 santorini)
      (at d14 santorini)
    )
  )
)