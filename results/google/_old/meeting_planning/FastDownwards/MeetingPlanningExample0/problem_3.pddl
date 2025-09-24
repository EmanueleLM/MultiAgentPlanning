(define (problem combined-meet-problem)
  (:domain combined-meet-domain)
  (:requirements :typing :negative-preconditions :adl :action-costs)
  (:objects
    marina mission - location
    t0 t19 t20 t90 t150 t210 t270 - time
  )
  (:init
    (at-time t0)
    (at-you marina)
    (available)
    (stephanie-at mission t90)
    (stephanie-at mission t150)
    (stephanie-at mission t210)
    (stephanie-at mission t270)
    (= (total-cost) 0)
  )
  (:goal (met))
  (:metric minimize (total-cost))
)