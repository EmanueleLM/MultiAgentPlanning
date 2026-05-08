(define (problem orchestration-problem)
  (:domain orchestration-domain)

  ; Problem-level explicit objects:
  ; - one model object (m1)
  ; - one agent of each capability/subtype
  ; - four explicit phases with successor links enforcing contiguity
  (:objects
    modeler1 - modeler
    auditor1 - auditor
    simplifier1 - simplifier
    orchestrator1 - orchestrator

    m1 - model

    p1 p2 p3 p4 - phase
  )

  (:init
    ; Phase successor chain enforces strictly contiguous progression p1 -> p2 -> p3 -> p4
    (phase-next p1 p2)
    (phase-next p2 p3)
    (phase-next p3 p4)

    ; Bind explicit semantic meaning of each phase
    (model-phase p1)
    (audit-phase p2)
    (simplify-phase p3)
    (finalize-phase p4)

    ; Start with modeling phase active (earliest phase)
    (phase-active p1)

    ; No initial model validity, corrections, canonical mapping, or finalization
    ; (All such predicates are therefore false by default and must be achieved.)
  )

  ; Hard goal: all mandated terminal conditions must hold.
  ; This fixes final predicates rather than relying on auxiliary bookkeeping.
  (:goal (and
           (model-valid m1)
           (corrections-applied m1)
           (mapping-canonical m1)
           (finalized m1)
         )
  )
)