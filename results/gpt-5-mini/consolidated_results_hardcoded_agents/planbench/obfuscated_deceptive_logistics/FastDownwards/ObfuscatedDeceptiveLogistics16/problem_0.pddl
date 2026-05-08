; Problem instance that targets FastDownwards planner.
; This problem defines:
; - One symbolic artifact named sym_model.
; - Four explicit phases: p1_modeling -> p2_audit -> p3_simplify -> p4_integrate (with successor links).
; - Four agents, one of each subtype, to keep responsibilities distinct.
; - Initial state sets the current-phase to p1_modeling and provides static phase sequence.
; Goals require completion of all phases and the artifact to be created, reviewed, mapped, and integrated.

(define (problem orchestration-instance)
  (:domain orchestration)

  (:objects
    ; agents (distinct subtypes enforce role restrictions)
    modeler1 - modeler
    auditor1 - auditor
    simplifier1 - simplifier
    orchestrator1 - orchestrator

    ; single artifact that flows through all phases
    sym_model - artifact

    ; explicit phase objects
    p1_modeling p2_audit p3_simplify p4_integrate - phase
  )

  (:init
    ; phase successor (static)
    (phase-succ p1_modeling p2_audit)
    (phase-succ p2_audit p3_simplify)
    (phase-succ p3_simplify p4_integrate)

    ; start in modeling phase
    (current-phase p1_modeling)

    ; No artifact-created, reviewed, mapped or integrated facts at start (omitted intentionally).
    ; No phase-done facts at start (they will be set strictly by actions).

    ; Record agent identities via types are implicit via objects typed above.
  )

  (:goal (and
           ; terminal artifact state: fully integrated
           (artifact-created sym_model)
           (artifact-reviewed sym_model)
           (artifact-mapped sym_model)
           (artifact-integrated sym_model)

           ; enforce that each explicit phase was completed; this prevents skipping
           (phase-done p1_modeling)
           (phase-done p2_audit)
           (phase-done p3_simplify)
           (phase-done p4_integrate)
         )
  )
)