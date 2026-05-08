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

  ;; Pick up a clear block from the table. Advances time to the immediate successor stage.
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
      ;; a held block is not clear by definition (not clear while picked up)
      (not (clear ?b))
      ;; advance the global stage to the immediate successor
      (not (stage-now ?s))
      (stage-now ?s2)
    )
  )

  ;; Unstack a clear block from directly on top of another block. Advances to the immediate successor stage.
  (:action unstack
    :parameters (?ag - agent ?b - block ?c - block ?s - stage ?s2 - stage)
    :precondition (and
      (hand-empty ?ag)
      (on ?b ?c)
      (clear ?b)
      (stage-now ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (hand-empty ?ag))
      (holding ?ag ?b)
      (not (on ?b ?c))
      ;; the block that had b on it becomes clear
      (clear ?c)
      ;; the block being unstacked is held -> not clear
      (not (clear ?b))
      ;; advance stage
      (not (stage-now ?s))
      (stage-now ?s2)
    )
  )

  ;; Put down a held block onto the table. Advances to the immediate successor stage.
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
      ;; a block put down on the table has no block on top, so it is clear
      (clear ?b)
      ;; advance stage
      (not (stage-now ?s))
      (stage-now ?s2)
    )
  )

  ;; Stack a held block on top of a clear target block. Advances to the immediate successor stage.
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
      ;; the target is no longer clear after placing b on it
      (not (clear ?c))
      ;; the moved block has nothing on top and is not held => clear
      (clear ?b)
      ;; advance stage
      (not (stage-now ?s))
      (stage-now ?s2)
    )
  )
)