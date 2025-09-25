(define (problem trip-16days)
  (:domain trip-planning-multiagent)
  (:objects
    oslo porto dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    ;; day succession
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)
    (next d13 d14) (next d14 d15) (next d15 d16)

    ;; free all days initially
    (free d1) (free d2) (free d3) (free d4) (free d5) (free d6)
    (free d7) (free d8) (free d9) (free d10) (free d11) (free d12)
    (free d13) (free d14) (free d15) (free d16)

    ;; designate d1 as the trip's first day
    (day1 d1)

    ;; flights (direct) as given by flight_network agent
    ;; Bidirectional flights are provided between the pairs known:
    (flight oslo dubrovnik)
    (flight dubrovnik oslo)
    (flight porto oslo)
    (flight oslo porto)

    ;; initialize counters to zero
    (= (days-in oslo) 0)
    (= (days-in porto) 0)
    (= (days-in dubrovnik) 0)
  )

  (:goal (and
    ;; exact stay duration requirements (as provided by traveler)
    (= (days-in oslo) 6)
    (= (days-in porto) 7)
    (= (days-in dubrovnik) 5)

    ;; conference attendance constraints: must be in Dubrovnik on day 12 and day 16
    (at dubrovnik d12)
    (at dubrovnik d16)
  ))