(define (problem itinerary-berlin-porto-krakow-11d)
  (:domain multi-city-itinerary)

  (:objects
    berlin porto krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day

    ; slots encode the exact number of days allocated per city (consumed when a day is assigned to that city)
    b1 b2 b3 b4 b5 b6 - slot    ; 6 Berlin slots
    p1 p2 - slot                ; 2 Porto slots (must cover wedding days)
    k1 k2 k3 - slot             ; 3 Krakow slots (total days must sum to 11)
  )

  (:init
    ;; day sequence
    (day-next d1 d2)
    (day-next d2 d3)
    (day-next d3 d4)
    (day-next d4 d5)
    (day-next d5 d6)
    (day-next d6 d7)
    (day-next d7 d8)
    (day-next d8 d9)
    (day-next d9 d10)
    (day-next d10 d11)

    ;; mark first day
    (day-first d1)

    ;; direct flights (bidirectional where available)
    (agent-direct-flight berlin porto)
    (agent-direct-flight porto berlin)
    (agent-direct-flight berlin krakow)
    (agent-direct-flight krakow berlin)

    ;; initial available slots per city (these enforce how many days each city will receive)
    (slot-available b1 berlin)
    (slot-available b2 berlin)
    (slot-available b3 berlin)
    (slot-available b4 berlin)
    (slot-available b5 berlin)
    (slot-available b6 berlin)

    (slot-available p1 porto)
    (slot-available p2 porto)

    (slot-available k1 krakow)
    (slot-available k2 krakow)
    (slot-available k3 krakow)
  )

  ;; Goals:
  ;; - Every day must be assigned to exactly one city (the assigned predicate per day ensures exactly one assignment per day).
  ;; - The wedding hard constraint: must be in Porto on day 10 and day 11.
  ;; - All city slots must be consumed (ensures the final distribution uses exactly the specified number of days per city:
  ;;   Berlin 6 days, Porto 2 days, Krakow 3 days, summing to 11).
  (:goal (and
    ;; every day is assigned
    (assigned d1)
    (assigned d2)
    (assigned d3)
    (assigned d4)
    (assigned d5)
    (assigned d6)
    (assigned d7)
    (assigned d8)
    (assigned d9)
    (assigned d10)
    (assigned d11)

    ;; wedding presence (hard constraint)
    (at porto d10)
    (at porto d11)

    ;; all slots consumed (no remaining slot-available atoms)
    (not (slot-available b1 berlin))
    (not (slot-available b2 berlin))
    (not (slot-available b3 berlin))
    (not (slot-available b4 berlin))
    (not (slot-available b5 berlin))
    (not (slot-available b6 berlin))

    (not (slot-available p1 porto))
    (not (slot-available p2 porto))

    (not (slot-available k1 krakow))
    (not (slot-available k2 krakow))
    (not (slot-available k3 krakow))
  ))