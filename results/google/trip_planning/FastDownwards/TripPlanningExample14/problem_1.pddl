(define (problem trip-10days-multiagent)
  (:domain multiagent-itinerary)

  (:objects
    ;; agents
    scheduler_agent transport_agent - agent

    ;; cities
    lyon frankfurt krakow - city

    ;; days
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - day

    ;; symbolic counts for days-used
    c0 c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 - count
  )

  (:init
    ;; day ordering and first marker
    (first d1)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10)

    ;; all days initially unassigned
    (unassigned d1) (unassigned d2) (unassigned d3) (unassigned d4) (unassigned d5)
    (unassigned d6) (unassigned d7) (unassigned d8) (unassigned d9) (unassigned d10)

    ;; direct flight edges (bidirectional as available)
    (direct-flight lyon frankfurt)
    (direct-flight frankfurt lyon)
    (direct-flight frankfurt krakow)
    (direct-flight krakow frankfurt)

    ;; connected facts used by assignment logic: include direct flights and
    ;; self-connections to allow staying in the same city across days.
    (connected lyon frankfurt)
    (connected frankfurt lyon)
    (connected frankfurt krakow)
    (connected krakow frankfurt)
    (connected lyon lyon)
    (connected frankfurt frankfurt)
    (connected krakow krakow)

    ;; initial transport agent location: start in Lyon
    (at transport_agent lyon)

    ;; symbolic numeric bookkeeping: start at 0 days used
    (days-used c0)

    ;; precomputed increments for symbolic counting
    (next-count c0 c1) (next-count c1 c2) (next-count c2 c3) (next-count c3 c4)
    (next-count c4 c5) (next-count c5 c6) (next-count c6 c7) (next-count c7 c8)
    (next-count c8 c9) (next-count c9 c10)

    ;; target trip duration encoded as a symbolic count
    (target-duration c10)
  )

  (:goal (and
    ;; day assignments: 5 days Lyon (d1..d5)
    (assigned d1 lyon) (assigned d2 lyon) (assigned d3 lyon) (assigned d4 lyon) (assigned d5 lyon)

    ;; 2 days Frankfurt (d6..d7)
    (assigned d6 frankfurt) (assigned d7 frankfurt)

    ;; 3 days Krakow (d8..d10)
    (assigned d8 krakow) (assigned d9 krakow) (assigned d10 krakow)

    ;; all 10 days consumed (symbolic)
    (days-used c10)

    ;; traveler ends in Krakow
    (at transport_agent krakow)
  ))
)