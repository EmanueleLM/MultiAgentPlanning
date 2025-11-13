(define (problem router-problem)
  (:domain router-domain)

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

    ;; successor relation over days (explicit adjacency)
    (day-next d1 d2) (day-next d2 d3) (day-next d3 d4) (day-next d4 d5)
    (day-next d5 d6) (day-next d6 d7) (day-next d7 d8) (day-next d8 d9)
    (day-next d9 d10) (day-next d10 d11) (day-next d11 d12) (day-next d12 d13)
    (day-next d13 d14) (day-next d14 d15) (day-next d15 d16)

    ;; available direct flights (only the provided connections)
    (direct-flight porto berlin)
    (direct-flight berlin porto)
    (direct-flight berlin reykjavik)
    (direct-flight reykjavik berlin)
    ;; Note: no direct-flight between porto and reykjavik is present (prohibited)

    ;; define the concrete flight legs used between city blocks
    (flight-leg legA porto berlin)
    (flight-leg legB berlin reykjavik)

    ;; define the required boundaries when those flights must occur
    ;; Flight leg A: between day 5 and day 6
    (flight-boundary legA d5 d6)
    ;; Flight leg B: between day 11 and day 12
    (flight-boundary legB d11 d12)
  )

  ;; Goal: the audited (final recommended) allocation: exact city-on-day for each day,
  ;; plus the flight legs must be taken at the specified boundaries.
  (:goal (and
    ;; Porto: days 1-5
    (city-on-day porto d1) (city-on-day porto d2) (city-on-day porto d3)
    (city-on-day porto d4) (city-on-day porto d5)

    ;; Berlin: days 6-11
    (city-on-day berlin d6) (city-on-day berlin d7) (city-on-day berlin d8)
    (city-on-day berlin d9) (city-on-day berlin d10) (city-on-day berlin d11)

    ;; Reykjavik: days 12-16 (ensures Reykjavik visit covers days 12-16 meeting window)
    (city-on-day reykjavik d12) (city-on-day reykjavik d13)
    (city-on-day reykjavik d14) (city-on-day reykjavik d15) (city-on-day reykjavik d16)

    ;; the two required flight legs must be executed at their boundaries
    (flight-done legA)
    (flight-done legB)
  ))
)