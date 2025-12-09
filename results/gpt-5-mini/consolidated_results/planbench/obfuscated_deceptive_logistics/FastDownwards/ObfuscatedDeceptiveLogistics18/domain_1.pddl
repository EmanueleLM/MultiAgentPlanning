(define (domain linking-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage agent)

  (:predicates
    ;; time-stamped directed successor: (next-at x y s) means at stage s, x -> y holds.
    (next-at ?x - obj ?y - obj ?s - stage)

    ;; ordered discrete stages: (stage-succ s1 s2) means s2 is the immediate successor of s1.
    (stage-succ ?s1 - stage ?s2 - stage)

    ;; marks that a stage has been occupied by some action (prevents reusing the same stage slot).
    (used-stage ?s - stage)

    ;; a simple agent availability predicate so an agent must be present to perform linking actions.
    (available-agent ?a - agent)

    ;; static/world predicates preserved from the statement (kept as fluents but not modified by the linking action).
    (hand ?o - obj)
    (cats ?o - obj)
    (texture ?o - obj)
    (vase ?x - obj ?y - obj)
    (sneeze ?o - obj)
    (spring ?o - obj)
    (stupendous ?o - obj)
    (collect ?x - obj ?y - obj)
  )

  ;; Link action: create a next-at relation at the immediate successor stage.
  ;; Hard constraints:
  ;;  - requires an available agent,
  ;;  - requires an explicit stage successor pair (s -> s2) and s2 must be unused,
  ;;  - once created at s2 the next-at relation is never deleted (no oscillations).
  ;; This models discrete time explicitly and enforces that link effects occur at a later stage
  ;; and occupy that stage (used-stage) so stages cannot be re-used (structural quota).
  (:action link
    :parameters (?a - agent ?x - obj ?y - obj ?s - stage ?s2 - stage)
    :precondition (and
                    (available-agent ?a)
                    (stage-succ ?s ?s2)
                    (not (used-stage ?s2))
                  )
    :effect (and
              (next-at ?x ?y ?s2)
              (used-stage ?s2)
            )
  )
)