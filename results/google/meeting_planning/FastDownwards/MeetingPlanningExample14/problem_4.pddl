(define (problem integrated-meet-mary)
  (:domain integrated-meeting-domain)
  (:objects
    visitor mary - agent
    nob_hill marina_district - location
    t540 t551 t1200 t1320 - time
  )
  (:init
    (at visitor nob_hill)
    (at mary nob_hill)
    (current-time t540)
    (succ11 t540 t551)
    (succ120 t1200 t1320)
    (will-be-at-marina-window)
  )
  (:goal (and
    (met-mary)
    (met-visitor)
  ))
  (:metric minimize (total-cost))
)