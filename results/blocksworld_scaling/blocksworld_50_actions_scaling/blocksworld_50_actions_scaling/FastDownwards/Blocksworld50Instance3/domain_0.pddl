(define (domain blocks-world-multiagent)
  (:requirements :strips :typing)
  (:types block agent)

  (:predicates
    (on ?b - block ?s - block)       ; ?b is on block ?s
    (ontable ?b - block)             ; ?b is on the table
    (clear ?b - block)               ; nothing on ?b
    (holding ?a - agent ?b - block)  ; agent ?a holds block ?b
    (handempty ?a - agent)           ; agent ?a holds nothing
  )

  ;; An agent picks up a clear block that is on the table
  (:action pickup
    :parameters (?a - agent ?b - block)
    :precondition (and (handempty ?a) (ontable ?b) (clear ?b))
    :effect (and
              (holding ?a ?b)
              (not (ontable ?b))
              (not (clear ?b))
              (not (handempty ?a))
            )
  )

  ;; An agent puts down a held block onto the table
  (:action putdown
    :parameters (?a - agent ?b - block)
    :precondition (holding ?a ?b)
    :effect (and
              (ontable ?b)
              (clear ?b)
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )

  ;; An agent un-stacks a clear block from another block
  (:action unstack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (handempty ?a) (on ?b ?c) (clear ?b))
    :effect (and
              (holding ?a ?b)
              (not (on ?b ?c))
              (clear ?c)
              (not (clear ?b))
              (not (handempty ?a))
            )
  )

  ;; An agent stacks a held block on top of another clear block
  (:action stack
    :parameters (?a - agent ?b - block ?c - block)
    :precondition (and (holding ?a ?b) (clear ?c))
    :effect (and
              (on ?b ?c)
              (clear ?b)
              (not (clear ?c))
              (handempty ?a)
              (not (holding ?a ?b))
            )
  )
)