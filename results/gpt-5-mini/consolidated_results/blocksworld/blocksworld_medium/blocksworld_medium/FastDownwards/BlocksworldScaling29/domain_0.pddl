(define (domain blocks-world)
  ;; Domain: Classical single-arm Blocks World (STRIPS-style)
  ;; Contributors (documented as comments):
  ;;   modeler: provided predicates, action templates (pickup, unstack, putdown, stack),
  ;;            initial facts and goal specification.
  ;;   auditor: reviewed causal invariants and recommended keeping bookkeeping fluents
  ;;            (clear, hand-empty) maintained; pointed out uniqueness-of-support invariant.
  ;; Decisions & assumptions (conservative, documented):
  ;;   - We follow the modeler's STRIPS-style action templates exactly and keep
  ;;     clear and hand-empty as maintained fluents (no derived predicates),
  ;;     to remain within pure STRIPS + typing for FastDownward compatibility.
  ;;   - We rely on the domain invariant "at most one block directly on any given block"
  ;;     (auditor's I5). This invariant holds in the initial state and is preserved by
  ;;     the operator definitions (stack requires the support to be clear).
  ;;   - We avoid using negative preconditions or derived predicates to keep :requirements minimal.
  ;;   - All names are lower-case; blocks have type 'block'. Table is implicit via on-table predicate.
  ;; Invariants to be maintained by planners/analysts (documented):
  ;;   I1. For each block x, exactly one of {holding(x), on(x,y) for some y, on-table(x)} holds in reachable complete states.
  ;;   I2. For each block x, at most one y satisfies on(x,y).
  ;;   I3. At most one x satisfies holding(x); hand-empty is used as the complementary fluent.
  ;;   I4. clear(x) is maintained to match (no block on x) and (not holding(x)).
  ;;   I5. At most one block can be on a given block (unique direct support).
  (:requirements :strips :typing)
  (:types block)

  ;; Predicates
  ;; modeler: on/2, on-table/1, holding/1, hand-empty/0, clear/1
  (:predicates
    ;; modeler: on(x,y) -- block x is directly on block y
    (on ?b - block ?c - block)

    ;; modeler: on-table(x) -- block x directly on the table
    (on-table ?b - block)

    ;; modeler: holding(x) -- agent is holding block x
    (holding ?b - block)

    ;; modeler: hand-empty -- agent's hand contains nothing
    (hand-empty)

    ;; modeler: clear(x) -- block x has nothing directly on it AND is not being held;
    ;; maintained as fluent by operator effects (not derived here).
    (clear ?b - block)
  )

  ;; Actions
  ;; Each action is annotated with who proposed it (modeler).
  ;; Operator add/delete lists follow the modeler's explicit definitions to preserve invariants.

  ;; pickup(?b)
  ;; modeler: pick up a clear block from the table; requires hand-empty.
  (:action pickup
    :parameters (?b - block)
    :precondition (and
                    (hand-empty)
                    (on-table ?b)
                    (clear ?b)
                  )
    :effect (and
              ;; Add: holding(?b)
              (holding ?b)
              ;; Delete: hand-empty, on-table(?b), clear(?b)
              (not (hand-empty))
              (not (on-table ?b))
              (not (clear ?b))
            )
  )

  ;; unstack(?b ?c)
  ;; modeler: pick up block ?b that is directly on block ?c; makes ?c clear.
  ;; Auditor: added recommendation to require ?b != ?c; explicit inequality is unnecessary here
  ;; because clear(?b) and holding semantics prevent reflexive cases; thus no separate inequality precondition.
  (:action unstack
    :parameters (?b - block ?c - block)
    :precondition (and
                    (hand-empty)
                    (on ?b ?c)
                    (clear ?b)
                  )
    :effect (and
              ;; Add: holding(?b), clear(?c)
              (holding ?b)
              (clear ?c)
              ;; Delete: hand-empty, on(?b ?c), clear(?b)
              (not (hand-empty))
              (not (on ?b ?c))
              (not (clear ?b))
            )
  )

  ;; putdown(?b)
  ;; modeler: place held block on the table.
  (:action putdown
    :parameters (?b - block)
    :precondition (and
                    (holding ?b)
                  )
    :effect (and
              ;; Add: on-table(?b), clear(?b), hand-empty
              (on-table ?b)
              (clear ?b)
              (hand-empty)
              ;; Delete: holding(?b)
              (not (holding ?b))
            )
  )

  ;; stack(?b ?c)
  ;; modeler: place held block ?b on top of block ?c.
  ;; Auditor: stack should not allow placing a block onto itself. Explicit inequality is not required
  ;; because clear(?c) is false if ?c is held, and holding(?b) implies clear(?b) false; the binding ?b=?c would
  ;; make preconditions contradictory. Therefore no explicit inequality precondition is added.
  (:action stack
    :parameters (?b - block ?c - block)
    :precondition (and
                    (holding ?b)
                    (clear ?c)
                  )
    :effect (and
              ;; Add: on(?b ?c), hand-empty, clear(?b)
              (on ?b ?c)
              (hand-empty)
              (clear ?b)
              ;; Delete: holding(?b), clear(?c)
              (not (holding ?b))
              (not (clear ?c))
            )
  )
)