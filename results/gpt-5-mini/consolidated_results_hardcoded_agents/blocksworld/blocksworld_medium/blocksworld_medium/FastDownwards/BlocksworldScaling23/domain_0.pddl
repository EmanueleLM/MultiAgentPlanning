(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (hand-empty)
    (holding ?b - block)
    (on ?x - block ?y - block)
    (on-table ?b - block)
    (clear ?b - block)
  )

  ;; Actions provided by the "placer" agent (prefix: placer-)
  (:action placer-pick-up
    :parameters (?x - block)
    :precondition (and (hand-empty) (clear ?x) (on-table ?x))
    :effect (and
              (holding ?x)
              (not (hand-empty))
              (not (on-table ?x))
              (not (clear ?x))
            )
  )

  (:action placer-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (hand-empty) (clear ?x) (on ?x ?y))
    :effect (and
              (holding ?x)
              (not (hand-empty))
              (not (on ?x ?y))
              (clear ?y)
              (not (clear ?x))
            )
  )

  (:action placer-put-down
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (on-table ?x)
              (clear ?x)
              (hand-empty)
              (not (holding ?x))
            )
  )

  (:action placer-stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (not (clear ?y))
              (clear ?x)
              (hand-empty)
              (not (holding ?x))
              (not (on-table ?x))
            )
  )

  ;; Actions provided by the "unstacker" agent (prefix: unstacker-)
  ;; Semantics are identical to placer- actions but names are distinct so
  ;; actions from different agents remain distinguishable.
  (:action unstacker-pick-up
    :parameters (?x - block)
    :precondition (and (hand-empty) (clear ?x) (on-table ?x))
    :effect (and
              (holding ?x)
              (not (hand-empty))
              (not (on-table ?x))
              (not (clear ?x))
            )
  )

  (:action unstacker-unstack
    :parameters (?x - block ?y - block)
    :precondition (and (hand-empty) (clear ?x) (on ?x ?y))
    :effect (and
              (holding ?x)
              (not (hand-empty))
              (not (on ?x ?y))
              (clear ?y)
              (not (clear ?x))
            )
  )

  (:action unstacker-put-down
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
              (on-table ?x)
              (clear ?x)
              (hand-empty)
              (not (holding ?x))
            )
  )

  (:action unstacker-stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (not (clear ?y))
              (clear ?x)
              (hand-empty)
              (not (holding ?x))
              (not (on-table ?x))
            )
  )
)