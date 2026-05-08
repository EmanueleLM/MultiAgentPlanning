(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    p1 p2 p3 - phase
    h1 - host
    s1 - service
  )

  (:init
    ;; Phase definitions and ordering
    (phase p1) (phase p2) (phase p3)
    (phase-next p1 p2)
    (phase-next p2 p3)
    (phase-at p1)
    (phase-initial p1)
    (phase-second p2)
    (phase-third p3)

    ;; Host and service initial state
    (host-available h1)
    ;; No host-prepared, no service-deployed, no service-verified initially.
  )

  (:goal (and
    (service-deployed s1 h1)
    (service-verified s1)
    (phase-at p3)
  ))
)