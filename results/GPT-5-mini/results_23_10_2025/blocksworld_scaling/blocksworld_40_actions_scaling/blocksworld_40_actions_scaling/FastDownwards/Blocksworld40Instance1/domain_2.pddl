(define (domain blocksworld40)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?ag - agent ?x - block)
    (handempty)
  )

  ;; pick up a block from the table by a specific agent
  (:action pickup
    :parameters (?ag - agent ?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
      (holding ?ag ?x)
      (not (ontable ?x))
      (not (handempty))
    )
  )

  ;; put down a held block on the table by a specific agent
  (:action putdown
    :parameters (?ag - agent ?x - block)
    :precondition (and (holding ?ag ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?ag ?x))
    )
  )

  ;; unstack a top block from another block (agent picks up ?x from ?y)
  (:action unstack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (holding ?ag ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
    )
  )

  ;; stack a held block onto another block by a specific agent
  (:action stack
    :parameters (?ag - agent ?x - block ?y - block)
    :precondition (and (holding ?ag ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?ag ?x))
      (not (clear ?y))
    )
  )
)