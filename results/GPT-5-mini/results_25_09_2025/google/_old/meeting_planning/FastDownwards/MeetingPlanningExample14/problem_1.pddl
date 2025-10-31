(define (problem integrated-meet-mary)
  (:domain integrated-meeting-domain)
  (:objects
    visitor mary - agent
    Nob_Hill Marina_District - location
    t540 t551 t1200 t1320 - time
  )
  (:init
    ;; initial locations
    (at visitor Nob_Hill)
    (at mary Nob_Hill)

    ;; initial time and successor/time relations (precomputed)
    (current-time t540)
    (succ11 t540 t551)
    (succ120 t1200 t1320)

    ;; Mary's availability window (public information)
    (will-be-at-marina-window)

    ;; initialize total-cost
    (= (total-cost) 0)
  )
  (:goal (and
    (met-mary)
    (met-visitor)
  ))
  (:metric minimize (total-cost))
)