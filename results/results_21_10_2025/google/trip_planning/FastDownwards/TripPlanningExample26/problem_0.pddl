(define (problem schedule-trip-16d)
  (:domain travel-scheduling)
  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )
  (:init
    ;; Direct flights available (only those given publicly)
    (flight porto berlin)
    (flight berlin porto)
    (flight berlin reykjavik)
    (flight reykjavik berlin)

    ;; Day successor relations cover the 16-day horizon
    (day-next d1 d2)  (day-next d2 d3)  (day-next d3 d4)  (day-next d4 d5)
    (day-next d5 d6)  (day-next d6 d7)  (day-next d7 d8)  (day-next d8 d9)
    (day-next d9 d10) (day-next d10 d11)(day-next d11 d12)(day-next d12 d13)
    (day-next d13 d14)(day-next d14 d15)(day-next d15 d16)

    ;; Initial location: begin the trip in Porto on day 1
    (at porto d1)
    (occupied d1)  ;; day 1 already assigned/occupied
  )

  ;; Goals enforce the integrated schedule (reconciled to fit 16 days and Reykjavik meeting window)
  ;; - Porto: days 1..5 (adjusted minimally from the original Porto proposal to avoid overlap
  ;;   with Berlin and to respect Reykjavik window)
  ;; - Berlin: days 6..11 (kept as proposed to preserve the direct connection into Reykjavik on day 12)
  ;; - Reykjavik: days 12..16 (meeting window 12..16 respected; meeting day 14 falls within this block)
  (:goal
    (and
      ;; Porto occupancy days 1..5
      (at porto d1) (at porto d2) (at porto d3) (at porto d4) (at porto d5)

      ;; Berlin occupancy days 6..11
      (at berlin d6) (at berlin d7) (at berlin d8) (at berlin d9) (at berlin d10) (at berlin d11)

      ;; Reykjavik occupancy days 12..16 (meeting scheduled on day 14 implicitly by being in Reykjavik)
      (at reykjavik d12) (at reykjavik d13) (at reykjavik d14) (at reykjavik d15) (at reykjavik d16)
    )
  )
)