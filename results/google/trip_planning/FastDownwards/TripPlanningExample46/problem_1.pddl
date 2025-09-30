(define (problem trip-planning-problem)
  (:domain trip-planning)
  (:objects
    seville manchester stockholm - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 - day
  )
  (:init
    ;; initial presence on day 1 in Stockholm and day 1 already assigned
    (at stockholm d1)
    (assigned d1)
    ;; day ordering
    (next d1 d2) (next d2 d3) (next d3 d4) (next d4 d5) (next d5 d6)
    (next d6 d7) (next d7 d8) (next d8 d9) (next d9 d10) (next d10 d11)
    ;; direct-flight availability (only direct flights allowed)
    (can-fly manchester seville) (can-fly seville manchester)
    (can-fly stockholm manchester) (can-fly manchester stockholm)
    ;; free (unassigned) days (d1 already assigned, others free initially)
    (free d2) (free d3) (free d4) (free d5) (free d6)
    (free d7) (free d8) (free d9) (free d10) (free d11)
  )
  (:goal (and
    ;; ensure every day is assigned (a location is chosen for each day)
    (assigned d1) (assigned d2) (assigned d3) (assigned d4) (assigned d5)
    (assigned d6) (assigned d7) (assigned d8) (assigned d9) (assigned d10) (assigned d11)
    ;; hard conference constraints: be in Stockholm on day 1 and day 3
    (at stockholm d1) (at stockholm d3)
  ))
)