(define (domain blocks-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?ag - agent ?x - block)
    (handempty ?ag - agent)
  )

  ;; Pickup a block from the table
  (:action pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (handempty ?ag)
                    (clear ?b)
                    (ontable ?b))
    :effect (and
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b))
  )

  ;; Unstack a block from another block
  (:action unstack
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and
                    (handempty ?ag)
                    (on ?b ?under)
                    (clear ?b))
    :effect (and
              (not (on ?b ?under))
              (not (clear ?b))
              (not (handempty ?ag))
              (holding ?ag ?b)
              (clear ?under))
  )

  ;; Put a held block down on the table
  (:action putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
                    (holding ?ag ?b))
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b)))
  )

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?ag - agent ?b - block ?under - block)
    :precondition (and
                    (holding ?ag ?b)
                    (clear ?under))
    :effect (and
              (on ?b ?under)
              (clear ?b)
              (handempty ?ag)
              (not (holding ?ag ?b))
              (not (clear ?under)))
  )
)