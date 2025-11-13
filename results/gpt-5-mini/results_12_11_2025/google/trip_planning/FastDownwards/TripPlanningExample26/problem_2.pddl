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

    ;; direct flights available (bidirectional where appropriate)
    (direct-flight porto berlin)
    (direct-flight berlin porto)
    (direct-flight berlin reykjavik)
    (direct-flight reykjavik berlin)
    ;; No direct flight between porto and reykjavik is declared.

    ;; concrete flight legs and their required day boundaries
    (flight-leg legA porto berlin)
    (flight-boundary legA d5 d6)

    (flight-leg legB berlin reykjavik)
    (flight-boundary legB d11 d12)
  )

  (:goal (and
    ;; exact audited contiguous assignment required:
    (city-on-day porto d1) (city-on-day porto d2) (city-on-day porto d3)
    (city-on-day porto d4) (city-on-day porto d5)

    (city-on-day berlin d6) (city-on-day berlin d7) (city-on-day berlin d8)
    (city-on-day berlin d9) (city-on-day berlin d10) (city-on-day berlin d11)

    (city-on-day reykjavik d12) (city-on-day reykjavik d13)
    (city-on-day reykjavik d14) (city-on-day reykjavik d15)
    (city-on-day reykjavik d16)

    ;; flights must have been taken at the specified boundaries
    (flight-used legA)
    (flight-used legB)

    ;; no day remains unassigned
    (not (unassigned-day d1)) (not (unassigned-day d2)) (not (unassigned-day d3))
    (not (unassigned-day d4)) (not (unassigned-day d5)) (not (unassigned-day d6))
    (not (unassigned-day d7)) (not (unassigned-day d8)) (not (unassigned-day d9))
    (not (unassigned-day d10)) (not (unassigned-day d11)) (not (unassigned-day d12))
    (not (unassigned-day d13)) (not (unassigned-day d14)) (not (unassigned-day d15))
    (not (unassigned-day d16))
  ))