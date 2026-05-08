(define (domain orchestrator-domain)
  ;; Requirements limited to those supported by the target solver (FastDownward)
  (:requirements :strips :typing :negative-preconditions)

  ;; Types
  (:types block color)

  ;; Predicates
  ;; Core stacking predicates:
  ;;  - (on ?b ?t)         : block ?b is directly on block ?t
  ;;  - (ontable ?b)       : block ?b is directly on the table
  ;;  - (clear ?b)         : top of block ?b is clear (no block on it)
  ;;  - (holding ?b)       : the agent is holding block ?b
  ;;  - (handempty)        : the agent's hand is empty
  ;; Auditor-introduced predicate (explicit and static):
  ;;  - (color-assigned ?b ?c) : block ?b has color ?c (set initially, immutable)
  (:predicates
    (on ?b - block ?t - block)
    (ontable ?b - block)
    (clear ?b - block)
    (holding ?b - block)
    (handempty)
    (color-assigned ?b - block ?c - color)
  )

  ;; Actions contributed by the agent (distinct, fully explicit preconditions/effects)
  ;; Pick up a block from the table
  (:action pick-up
    :parameters (?b - block)
    :precondition (and
                    (ontable ?b)
                    (clear ?b)
                    (handempty)
                  )
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty))
              (holding ?b)
            )
  )

  ;; Put down a block onto the table
  (:action put-down
    :parameters (?b - block)
    :precondition (and
                    (holding ?b)
                  )
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty)
              (not (holding ?b))
            )
  )

  ;; Stack a held block onto another block
  (:action stack-onto
    :parameters (?b - block ?t - block)
    :precondition (and
                    (holding ?b)
                    (clear ?t)
                    ;; Note: disallow stacking a block onto itself via negative precondition
                    (not (= ?b ?t))
                  )
    :effect (and
              (on ?b ?t)
              (clear ?b)
              (handempty)
              (not (holding ?b))
              (not (clear ?t))
            )
  )

  ;; Unstack a block from another block (pick it up)
  (:action unstack-from
    :parameters (?b - block ?t - block)
    :precondition (and
                    (on ?b ?t)
                    (clear ?b)
                    (handempty)
                  )
    :effect (and
              (holding ?b)
              (clear ?t)
              (not (on ?b ?t))
              (not (clear ?b))
              (not (handempty))
            )
  )
)