(define (domain orchestrator-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block stage)

  (:predicates
    (hand-empty ?ag - agent)
    (holding ?ag - agent ?b - block)
    (on ?b1 - block ?b2 - block)
    (on-table ?b - block)
    (clear ?b - block)
    (stage-now ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
    (distinct ?b1 - block ?b2 - block)
  )

  ;; Pick up a clear block from the table. Advances exactly one stage.
  (:action pickup-from-table
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (hand-empty ?ag)
      (on-table ?b)
      (clear ?b)
      (stage-now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (hand-empty ?ag))
      (holding ?ag ?b)
      (not (on-table ?b))
      (not (clear ?b))
      (not (stage-now ?s))
      (stage-now ?s2)
    )
  )

  ;; Unstack a clear block from directly on top of another block. Advances exactly one stage.
  (:action unstack
    :parameters (?ag - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (hand-empty ?ag)
      (on ?b ?c)
      (clear ?b)
      (distinct ?b ?c)
      (stage-now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (hand-empty ?ag))
      (holding ?ag ?b)
      (not (on ?b ?c))
      (clear ?c)
      (not (clear ?b))
      (not (stage-now ?s))
      (stage-now ?s2)
    )
  )

  ;; Put down a held block onto the table. Advances exactly one stage.
  (:action put-down-on-table
    :parameters (?ag - agent ?b - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?ag ?b)
      (stage-now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (hand-empty ?ag)
      (not (holding ?ag ?b))
      (on-table ?b)
      (clear ?b)
      (not (stage-now ?s))
      (stage-now ?s2)
    )
  )

  ;; Stack a held block on top of a clear target block. Advances exactly one stage.
  (:action stack
    :parameters (?ag - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (holding ?ag ?b)
      (clear ?c)
      (distinct ?b ?c)
      (stage-now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (hand-empty ?ag)
      (not (holding ?ag ?b))
      (on ?b ?c)
      (not (clear ?c))
      (clear ?b)
      (not (stage-now ?s))
      (stage-now ?s2)
    )
  )
)