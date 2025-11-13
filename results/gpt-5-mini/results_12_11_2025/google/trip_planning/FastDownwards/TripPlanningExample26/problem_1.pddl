(define (problem trip-planning-problem)
  (:domain trip-planning-domain)

  (:objects
    porto berlin reykjavik - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15 d16 - day
    legA legB - leg
  )

  (:init
    ;; initially all days are unassigned
    (unassigned-day d1) (unassigned-day d2) (unassigned-day d3) (unassigned-day d4)
    (unassigned-day d5) (unassigned-day d6) (unassigned-day d7) (unassigned-day d8)
    (unassigned-day d9) (unassigned-day d10) (unassigned-day d11) (unassigned-day d12)
    (unassigned-day d13) (unassigned-day d14) (unassigned-day d15) (unassigned-day d16)

    ;; direct flights available (bidirectional where specified)
    (direct-flight porto berlin)
    (direct-flight berlin porto)
    (direct-flight berlin reykjavik)
    (direct-flight reykjavik berlin)
    ;; Note: no direct-flight between porto and reykjavik is declared (prohibited)

    ;; concrete flight legs that must be taken between city blocks, and their boundaries
    (flight-leg legA porto berlin)
    (flight-boundary legA d5 d6)

    (flight-leg legB berlin reykjavik)
    (flight-boundary legB d11 d12)
  )

  ;; Goal encodes the hard constraints that must hold after planning:
  ;; - every day must be assigned (no unassigned-day remains),
  ;; - both required flight legs must be executed at their specified boundaries,
  ;; - Reykjavik must cover the meeting window (days 12..16).
  ;; The domain's single assignment action is the only way to satisfy all these constraints,
  ;; so the solver will produce the audited itinerary as the plan.
  (:goal (and
    ;; all days assigned (no unassigned-day facts remain)
    (not (unassigned-day d1)) (not (unassigned-day d2)) (not (unassigned-day d3))
    (not (unassigned-day d4)) (not (unassigned-day d5)) (not (unassigned-day d6))
    (not (unassigned-day d7)) (not (unassigned-day d8)) (not (unassigned-day d9))
    (not (unassigned-day d10)) (not (unassigned-day d11)) (not (unassigned-day d12))
    (not (unassigned-day d13)) (not (unassigned-day d14)) (not (unassigned-day d15))
    (not (unassigned-day d16))

    ;; flights executed at their required boundaries
    (flight-done legA)
    (flight-done legB)

    ;; Reykjavik covers the meeting window (hard constraint)
    (city-on-day reykjavik d12) (city-on-day reykjavik d13)
    (city-on-day reykjavik d14) (city-on-day reykjavik d15)
    (city-on-day reykjavik d16)
  ))
)