(define (problem trip-16)
  (:domain travel-domain)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    porto berlin reykjavik - city
  )

  ;; Notes:
  ;; - Agents requested stays: Porto 7d, Berlin 6d, Reykjavik 5d (total 18d).
  ;;   The trip horizon is 16 days. To respect the 16-day horizon and the
  ;;   strict Reykjavik meeting window, this plan prioritizes Reykjavik=5d and
  ;;   Berlin=6d and shortens Porto to 5d (days 1-5). This reconciliation
  ;;   reflects a hard constraint (total 16 days) and the required meeting day.
  ;; - Direct flights only: only flight_porto_berlin and berlin<->reykjavik actions exist.
  ;; - Meeting is scheduled on the earliest allowed day (day12) within the [12,16] window.

  (:init
    ;; successor relation for days
    (succ d1 d2) (succ d2 d3) (succ d3 d4) (succ d4 d5) (succ d5 d6)
    (succ d6 d7) (succ d7 d8) (succ d8 d9) (succ d9 d10) (succ d10 d11)
    (succ d11 d12) (succ d12 d13) (succ d13 d14) (succ d14 d15) (succ d15 d16)

    ;; start the trip in Porto on day1 (earliest feasible start)
    (at d1 porto)
    (occupied d1)

    ;; No other day is occupied initially; actions will assign each subsequent day.
  )

  (:goal
    (and
      ;; Porto assigned days 1-5 (shortened from requested 7 due to horizon)
      (at d1 porto) (at d2 porto) (at d3 porto) (at d4 porto) (at d5 porto)

      ;; Berlin assigned days 6-11 (6 days as requested)
      (at d6 berlin) (at d7 berlin) (at d8 berlin) (at d9 berlin) (at d10 berlin) (at d11 berlin)

      ;; Reykjavik assigned days 12-16 (5 days as requested)
      (at d12 reykjavik) (at d13 reykjavik) (at d14 reykjavik) (at d15 reykjavik) (at d16 reykjavik)

      ;; Meeting requirement: meet a friend on the earliest allowed day within [12,16]
      (met d12)
    )
  )
)