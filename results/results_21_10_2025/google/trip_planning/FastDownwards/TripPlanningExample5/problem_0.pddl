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

    ;; starting location (choice by the orchestrator): start in Oslo on day 1
    (at oslo d1)

    ;; mark remaining days as unassigned initially (planner will assign them)
    (unassigned d2) (unassigned d3) (unassigned d4) (unassigned d5)
    (unassigned d6) (unassigned d7) (unassigned d8) (unassigned d9)
    (unassigned d10) (unassigned d11) (unassigned d12) (unassigned d13)
    (unassigned d14) (unassigned d15) (unassigned d16)

    ;; permitted direct flights (only direct flights allowed; topology from agents)
    (direct oslo porto) (direct porto oslo)
    (direct oslo dubrovnik) (direct dubrovnik oslo)

    ;; Reconciliation decision to satisfy global trip length:
    ;; The original requested stays (Oslo 6, Porto 7, Dubrovnik 5) summed to 18.
    ;; Dubrovnik's 5-day requirement (days 12..16) is enforced. To meet total 16 days,
    ;; Porto's stay is reduced by 2 days (Porto: 7 -> 5). Mark that reconciliation here.
    (reduced porto)
  )

  (:goal (and
    ;; Hard conference presence in Dubrovnik on day 12 and day 16 (and per Dubrovnik preference,
    ;; Dubrovnik is assigned for days 12..16 inclusive to make a continuous 5-day visit).
    (at dubrovnik d12) (at dubrovnik d13) (at dubrovnik d14) (at dubrovnik d15) (at dubrovnik d16)

    ;; The reconciled allocation across cities (total 16 days):
    ;; Oslo: 6 days total -> days 1..5 and day 11 (5 + 1 = 6)
    (at oslo d1) (at oslo d2) (at oslo d3) (at oslo d4) (at oslo d5) (at oslo d11)

    ;; Porto: reconciled to 5 days -> days 6..10
    (at porto d6) (at porto d7) (at porto d8) (at porto d9) (at porto d10)
  ))
)