(define (problem orchestrator-problem)
  (:domain orchestrator-domain)
  (:objects
    ph1 ph2 ph3 - phase
  )
  (:init
    ;; phase adjacency: linear sequence ph1 -> ph2 -> ph3 ; final phase points to itself
    (next ph1 ph2)
    (next ph2 ph3)
    (next ph3 ph3)

    ;; only the first phase is ready at start, enforcing order
    (phase-ready ph1)
  )
  (:goal (and
    (phase-done ph1)
    (phase-done ph2)
    (phase-done ph3)
  ))
)