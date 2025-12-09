(define (problem orchestrated-problem)
  (:domain orchestrated)

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ; Assumptions and conservative choices (documented here inside the problem):
  ; - We treat the unary predicates (hand, cats, texture, sneeze, spring,
  ;   stupendous, collect) as static classifications that are given in the
  ;   initial state and never produced/consumed by operators.
  ; - The binary relation next(...) is modeled as a general (multi-valued)
  ;   fluent; multiple next facts for the same subject are permitted by the
  ;   domain semantics. This avoids adding universal/inequality constraints
  ;   or conditional effects. If a functional (single-successor) invariant is
  ;   required, every operator that adds next(...) must be revised to delete
  ;   any prior next for that subject explicitly (not done here to keep the
  ;   model conservative).
  ; - To ensure the planner can achieve the stated goals without inventing
  ;   extra initial vase/next seeds, a conservative seed action
  ;   seed_next_for_hand is included in the domain. It is a minimal, explicit
  ;   causal source for next(?h,?tex) facts and represents the allowed
  ;   conservative correction discussed in the audit report.
  ; - No inequality constraints are enforced; self-bindings are permitted by
  ;   the model. If the domain semantics disallow self-bindings, the domain
  ;   must be extended with explicit inequality checks (requires :equality or
  ;   additional predicates) and the operator templates adapted accordingly.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (:objects
    object_0 object_1 object_2 object_3 object_4 object_5
    object_6 object_7 object_8 object_9 object_10 object_11 - object
  )

  (:init
    ;; Static classifications (conservative, minimal set to permit goal achievement)
    ;; The global goal requires next object_10/object_11/object_9 -> object_7.
    ;; Provide the static types required by seed_next_for_hand to create those next facts.
    (hand object_9)
    (hand object_10)
    (hand object_11)

    (texture object_7)

    ;; The domain contains other static predicates; they are left unspecified
    ;; except where required. No initial vase or next facts are provided here
    ;; because seed_next_for_hand can create the required next facts.
  )

  (:goal (and
    (next object_10 object_7)
    (next object_11 object_7)
    (next object_9 object_7)
  ))
)