(define (problem combined-meet-problem)
  (:domain combined-meet-domain)
  (:requirements :typing :negative-preconditions :adl :action-costs)
  (:objects
    marina mission - location
    t0 t19 t20 t90 t150 t210 t270 - time
  )
  (:init
    ;; initial global time = t0 (9:00 AM)
    (at-time t0)

    ;; locations
    (at marina)
    (at-you marina)

    ;; shared resource free
    (available)

    ;; Stephanie availability precomputed as predicates at key times:
    ;; Stephanie is at mission at t90 through t270 (we include relevant sample points).
    (stephanie-at mission t90)
    (stephanie-at mission t150)
    (stephanie-at mission t210)
    (stephanie-at mission t270)

    ;; initialize total-cost
    (= (total-cost) 0)
  )

  (:goal (met))

  (:metric minimize (total-cost))
)