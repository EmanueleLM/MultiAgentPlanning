(define (problem trip-oslo-porto-dubrovnik)
  (:domain trip-planning)

  (:objects
    oslo porto dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    ;; day ordering (discrete days 1..16)
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8) (next d8 d9)
    (next d9 d10) (next d10 d11) (next d11 d12) (next d12 d13)
    (next d13 d14) (next d14 d15) (next d15 d16)

    ;; starting location: start in Oslo on day 1
    (at oslo d1)

    ;; mark remaining days as unassigned initially (planner will assign them)
    (unassigned d2) (unassigned d3) (unassigned d4) (unassigned d5)
    (unassigned d6) (unassigned d7) (unassigned d8) (unassigned d9)
    (unassigned d10) (unassigned d11) (unassigned d12) (unassigned d13)
    (unassigned d14) (unassigned d15) (unassigned d16)

    ;; permitted direct flights (topology from agents)
    (direct oslo porto) (direct porto oslo)
    (direct oslo dubrovnik) (direct dubrovnik oslo)

    ;; Reconciliation decision: reduce Porto stay to fit 16-day total
    (reduced porto)
  )

  ;; Goal encodes the required constraints:
  ;; - Ensure presence in Dubrovnik on conference days (d12 and d16).
  ;; - Enforce the reconciled visit lengths by enumerating the days each city must cover:
  ;;   Oslo: 6 days total (days d1,d2,d3,d4,d5,d11)
  ;;   Porto: 5 days total (days d6,d7,d8,d9,d10)
  ;;   Dubrovnik: 5 days total (days d12,d13,d14,d15,d16)
  ;; The enumerated per-day requirements force a single feasible schedule consistent with direct flights.
  (:goal (and
    ;; Dubrovnik conference presence and 5-day visit
    (at dubrovnik d12) (at dubrovnik d13) (at dubrovnik d14) (at dubrovnik d15) (at dubrovnik d16)

    ;; Oslo 6 days (reconciled to match total trip length)
    (at oslo d1) (at oslo d2) (at oslo d3) (at oslo d4) (at oslo d5) (at oslo d11)

    ;; Porto reconciled to 5 days
    (at porto d6) (at porto d7) (at porto d8) (at porto d9) (at porto d10)
  ))
)