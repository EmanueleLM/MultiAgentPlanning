(define (problem TripPlanningExample7-problem)
  (:domain TripPlanningExample7)
  (:objects
    dubrovnik venice - city
    dubd1 dubd2 dubd3 dubd4 - day
    ven1 ven2 ven3 ven4 ven5 ven6 ven7 - day
  )
  (:init
    ; start location
    (at dubrovnik)

    ; flight edges (only the directed flight needed for the feasible plan is included;
    ; this edge is explicitly provided in the public information: from Dubrovnik to Venice)
    (edge dubrovnik venice)

    ; day tokens available initially
    (day-available dubd1)
    (day-available dubd2)
    (day-available dubd3)
    (day-available dubd4)
    (day-available ven1)
    (day-available ven2)
    (day-available ven3)
    (day-available ven4)
    (day-available ven5)
    (day-available ven6)
    (day-available ven7)

    ; each day token belongs to its city to enforce exact per-city counts
    (day-belongs dubd1 dubrovnik)
    (day-belongs dubd2 dubrovnik)
    (day-belongs dubd3 dubrovnik)
    (day-belongs dubd4 dubrovnik)
    (day-belongs ven1 venice)
    (day-belongs ven2 venice)
    (day-belongs ven3 venice)
    (day-belongs ven4 venice)
    (day-belongs ven5 venice)
    (day-belongs ven6 venice)
    (day-belongs ven7 venice)
  )
  (:goal
    (and
      ; must visit both recommended cities
      (visited dubrovnik)
      (visited venice)

      ; must consume exactly all 11 day tokens (enforces total days and per-city counts)
      (not (day-available dubd1))
      (not (day-available dubd2))
      (not (day-available dubd3))
      (not (day-available dubd4))
      (not (day-available ven1))
      (not (day-available ven2))
      (not (day-available ven3))
      (not (day-available ven4))
      (not (day-available ven5))
      (not (day-available ven6))
      (not (day-available ven7))
    )
  )
)