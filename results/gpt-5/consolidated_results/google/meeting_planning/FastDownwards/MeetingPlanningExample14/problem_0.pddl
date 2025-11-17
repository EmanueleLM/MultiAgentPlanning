(define (problem problem-mary-candidate1)
  (:domain schedule-mary)

  (:objects
    nob_hill marina_district - location
    t0900 t1949 t2000 t2200 - time
  )

  (:init
    ; initial state
    (at nob_hill)
    (at-time t0900)

    ; travel graph (asymmetric edges)
    (r11 nob_hill marina_district)
    (r12 marina_district nob_hill)

    ; time transitions restricted to the audited schedule
    (waitpair t0900 t1949)        ; wait 09:00 -> 19:49 (649 minutes)
    (plus11 t1949 t2000)          ; move NH -> MD (11 minutes)
    ; no plus12 provided, so MD->NH move is impossible in this audited plan
    (plus120 t2000 t2200)         ; meet Mary 20:00 -> 22:00 (120 minutes)

    ; meeting venue and availability window endpoints
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