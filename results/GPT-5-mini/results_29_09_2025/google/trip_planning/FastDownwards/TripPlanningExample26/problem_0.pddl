(define (problem trip16)
  (:domain trip_planning)
  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
  )

  (:init
    ;; temporal successor facts (day sequence 1..16)
    (day-next d1 d2) (day-next d2 d3) (day-next d3 d4) (day-next d4 d5)
    (day-next d5 d6) (day-next d6 d7) (day-next d7 d8) (day-next d8 d9)
    (day-next d9 d10) (day-next d10 d11) (day-next d11 d12) (day-next d12 d13)
    (day-next d13 d14) (day-next d14 d15) (day-next d15 d16)

    ;; available direct flights (public info)
    (direct berlin reykjavik)
    (direct reykjavik berlin)
    (direct porto berlin)
    (direct berlin porto)
    ;; Note: no direct connection between Porto and Reykjavik is intentionally omitted

    ;; initial location: earliest feasible start is in Porto on day 1
    (at porto d1)

    ;; meeting constraint: meeting must occur on a day between day12 and day16 inclusive
    (meeting-window d12)
    (meeting-window d13)
    (meeting-window d14)
    (meeting-window d15)
    (meeting-window d16)
  )

  ;; Goals: integrate the fragments into a single feasible 16-day plan.
  ;; The chosen feasible allocation (earliest meeting window satisfied) is:
  ;; - Porto: days d1..d5  (5 days)
  ;; - Berlin: days d6..d11 (6 days)
  ;; - Reykjavik: days d12..d16 (5 days)
  ;; Note: original requested Porto=7 / Berlin=6 / Reykjavik=5 exceeded 16 days;
  ;; to respect the 16-day total and the mandatory Reykjavik meeting window, Porto's stay is shortened to 5 days.
  (:goal
    (and
      ;; Porto days 1-5
      (at porto d1) (at porto d2) (at porto d3) (at porto d4) (at porto d5)
      ;; Berlin days 6-11
      (at berlin d6) (at berlin d7) (at berlin d8) (at berlin d9) (at berlin d10) (at berlin d11)
      ;; Reykjavik days 12-16
      (at reykjavik d12) (at reykjavik d13) (at reykjavik d14) (at reykjavik d15) (at reykjavik d16)
      ;; meeting must be scheduled during the allowed window (one of d12..d16)
      (meeting-scheduled)
    )
  )
)