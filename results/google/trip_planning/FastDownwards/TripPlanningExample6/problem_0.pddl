; Problem: 8-day trip visiting Berlin, Munich, Dubrovnik using only direct flights.
; Reconciliation of agents' desired day allocations:
; - berlin_agent required 4 days and conference attendance on day1 and day4 -> assigned Berlin days d1..d4
; - dubrovnik_agent wanted 3 days, munich_agent wanted 3 days; total would exceed 8.
;   We reconcile to fit 8 days by allocating Dubrovnik 2 days (d7,d8) and Munich 2 days (d5,d6).
; The itinerary (one feasible plan) is:
;   Days d1-d4: Berlin (conference on d1 and d4)
;   Fly Berlin->Munich between d4->d5
;   Days d5-d6: Munich
;   Fly Munich->Dubrovnik between d6->d7
;   Days d7-d8: Dubrovnik

(define (problem trip-8days)
  (:domain multiagent_trip)

  (:objects
    berlin munich dubrovnik - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
  )

  (:init
    ; day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5)
    (next d5 d6) (next d6 d7) (next d7 d8)

    ; direct flights (shared public information)
    (flight munich dubrovnik)
    (flight dubrovnik munich)
    (flight berlin munich)
    (flight munich berlin)
    ; Note: no direct flight between berlin and dubrovnik is declared.

    ; initial location: must be in Berlin on day1 to attend conference
    (at berlin d1)
  )

  (:goal
    (and
      ; Berlin conference days: d1 and d4 (and berlin_agent's 4-day visit)
      (at berlin d1) (at berlin d2) (at berlin d3) (at berlin d4)

      ; Munich reconciled allocation: 2 days (d5,d6)
      (at munich d5) (at munich d6)

      ; Dubrovnik reconciled allocation: 2 days (d7,d8)
      (at dubrovnik d7) (at dubrovnik d8)
    )
  )
)