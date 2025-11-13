(define (problem meeting-planning-14-problem)
  (:domain meeting-planning-14)

  (:objects
    nob_hill marina_district - location
    t0900 t1949 t2000 t2200 - time
  )

  (:init
    ; start state
    (at nob_hill)
    (at-time t0900)

    ; travel graph (asymmetric)
    (r11 nob_hill marina_district)
    (r12 marina_district nob_hill)

    ; permitted time transitions (discretized to enforce feasibility)
    (waitpair t0900 t1949)   ; 09:00 -> 19:49 (649 minutes)
    (plus11 t1949 t2000)     ; 19:49 -> 20:00 (11 minutes)
    (plus120 t2000 t2200)    ; 20:00 -> 22:00 (120 minutes)

    ; Mary: venue and availability endpoints
    (mary-venue marina_district)
    (mary-start t2000)
    (mary-end t2200)
  )

  (:goal (and
    (met-mary)
    (at marina_district)
    (at-time t2200)
  ))
)