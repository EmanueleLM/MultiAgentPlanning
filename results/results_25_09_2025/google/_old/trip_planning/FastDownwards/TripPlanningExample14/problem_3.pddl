(define (problem trip-10days)
  (:domain trip-planning)
  (:objects
    itinerary_agent transport_agent orchestrator - agent
    lyon frankfurt krakow - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day
  )
  (:init
    ;; time structure
    (current-day d1)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)
    (last-day d10)

    ;; all days initially unassigned
    (unassigned d1) (unassigned d2) (unassigned d3) (unassigned d4) (unassigned d5)
    (unassigned d6) (unassigned d7) (unassigned d8) (unassigned d9) (unassigned d10)

    ;; transport connectivity (direct flights only where specified)
    (direct-flight lyon frankfurt)
    (direct-flight frankfurt lyon)
    (direct-flight frankfurt krakow)
    (direct-flight krakow frankfurt)

    ;; starting location of the transport agent (traveler)
    (at transport_agent lyon)
  )
  (:goal (and
    ;; Itinerary_agent private desires:
    ;; - Spend 7 days in Lyon (here encoded as days d1..d7 assigned to Lyon)
    (assigned d1 lyon) (assigned d2 lyon) (assigned d3 lyon) (assigned d4 lyon) (assigned d5 lyon) (assigned d6 lyon) (assigned d7 lyon)

    ;; - Plan to stay in Krakow for 3 days, specifically day 8 to day 10
    (assigned d8 krakow) (assigned d9 krakow) (assigned d10 krakow)

    ;; - Would like to visit Frankfurt for 2 days (encoded here as assigning two specific days to Frankfurt)
    ;; Note: This along with the Lyon and Krakow day constraints is inconsistent with a total of 10 days;
    ;; the specification contains contradictory private requirements and thus no plan may exist.
    (assigned d6 frankfurt) (assigned d7 frankfurt)

    ;; require final location to be Krakow (attend show days 8-10)
    (at transport_agent krakow)
  ))
)