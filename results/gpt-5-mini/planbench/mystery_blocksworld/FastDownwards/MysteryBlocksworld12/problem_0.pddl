(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    p1 p2 p3 - phase
  )

  (:init
    ; Initial readiness: only the first phase is ready.
    (ready p1)
    (phase-first p1)

    ; Explicit successor links enforce the order p1 -> p2 -> p3
    (phase-next p1 p2)
    (phase-next p2 p3)

    ; p3 is the declared last phase
    (phase-last p3)
  )

  ; Goal: all phases must be completed. This fixes the mandated terminal conditions.
  (:goal
    (and
      (phase-done p1)
      (phase-done p2)
      (phase-done p3)
    )
  )
)