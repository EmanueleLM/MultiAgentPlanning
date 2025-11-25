(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (hand-empty ?a - agent)
    (holding ?a - agent ?x - block)
  )

  ;; Pick up a block from the table by an agent
  (:action pick-up
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (ontable ?b)
      (clear ?b)
      (hand-empty ?ag)
    )
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (hand-empty ?ag))
      (holding ?ag ?b)
    )
  )

  ;; Unstack a block from another block by an agent
  (:action unstack
    :parameters (?ag - agent ?b - block ?b_from - block)
    :precondition (and
      (on ?b ?b_from)
      (clear ?b)
      (hand-empty ?ag)
    )
    :effect (and
      (not (on ?b ?b_from))
      (clear ?b_from)
      (not (clear ?b))
      (not (hand-empty ?ag))
      (holding ?ag ?b)
    )
  )

  ;; Put down a block from an agent's hand to the table
  (:action put-down
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (hand-empty ?ag)
      (not (holding ?ag ?b))
    )
  )

  ;; Stack a block held by an agent onto another block
  (:action stack
    :parameters (?ag - agent ?b - block ?b_target - block)
    :precondition (and
      (holding ?ag ?b)
      (clear ?b_target)
    )
    :effect (and
      (not (holding ?ag ?b))
      (not (clear ?b_target))
      (hand-empty ?ag)
      (on ?b ?b_target)
      (clear ?b)
    )
  )
)