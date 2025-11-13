(define (problem TripPlanningExample7)
  (:domain trip_planning_example7)

  (:objects
    dubrovnik venice istanbul - city
    d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
    sd1 sd2 sd3 sd4 - slot
    sv1 sv2 sv3 sv4 sv5 sv6 sv7 - slot
  )

  (:init
    ; start in Dubrovnik on day 0
    (at dubrovnik)
    (day d0)

    ; day successor chain
    (next d0 d1)
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

    ; directed flight edges (only those explicitly provided)
    (edge dubrovnik istanbul)
    (edge dubrovnik venice)

    ; per-city required stay slots (Dubrovnik: 4, Venice: 7)
    (slot-city sd1 dubrovnik)
    (slot-city sd2 dubrovnik)
    (slot-city sd3 dubrovnik)
    (slot-city sd4 dubrovnik)

    (slot-city sv1 venice)
    (slot-city sv2 venice)
    (slot-city sv3 venice)
    (slot-city sv4 venice)
    (slot-city sv5 venice)
    (slot-city sv6 venice)
    (slot-city sv7 venice)

    (remaining sd1)
    (remaining sd2)
    (remaining sd3)
    (remaining sd4)

    (remaining sv1)
    (remaining sv2)
    (remaining sv3)
    (remaining sv4)
    (remaining sv5)
    (remaining sv6)
    (remaining sv7)
  )

  (:goal
    (and
      ; exactly 11 days elapsed
      (day d11)
      ; all required stay slots consumed: Dubrovnik 4 days and Venice 7 days
      (done sd1) (done sd2) (done sd3) (done sd4)
      (done sv1) (done sv2) (done sv3) (done sv4) (done sv5) (done sv6) (done sv7)
    )
  )
)