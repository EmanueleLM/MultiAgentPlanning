(define (problem TripPlanningExample5)
  (:domain trip-planning)
  (:objects
    oslo porto dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )
  (:init
    ;; Direct flight connectivity (as specified: Oslo <-> Dubrovnik, Porto <-> Oslo)
    (flight oslo dubrovnik)
    (flight dubrovnik oslo)
    (flight porto oslo)
    (flight oslo porto)

    ;; Day order
    (first d1)
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
    (next d14 d15)
    (next d15 d16)

    ;; Initial counts
    (= (count-oslo) 0)
    (= (count-porto) 0)
    (= (count-dubrovnik) 0)
  )
  (:goal (and
    ;; Ensure all days are assigned (enforces a city for each of the 16 days)
    (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5) (assigned d6) (assigned d7) (assigned d8)
    (assigned d9) (assigned d10) (assigned d11) (assigned d12) (assigned d13) (assigned d14) (assigned d15) (assigned d16)

    ;; Enforce desired total stays per city (these are hard constraints in this encoding)
    (= (count-oslo) 6)
    (= (count-porto) 7)
    (= (count-dubrovnik) 5)

    ;; Dubrovnik attendance required on days 12 and 16
    (in d12 dubrovnik)
    (in d16 dubrovnik)
  ))
)