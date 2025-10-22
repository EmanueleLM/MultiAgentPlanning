(define (domain blocks-world-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?b - block ?s - block)       ; ?b is on block ?s
    (ontable ?b - block)             ; ?b is on the table
    (clear ?b - block)               ; nothing on ?b
    (holding ?a - agent ?b - block)  ; agent ?a holds block ?b
    (handempty ?a - agent)           ; agent ?a holds nothing
  )

  ;; pickup: pick a clear block from the table
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

  ;; putdown: put a held block onto the table
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

  ;; unstack: pick a clear block from another block
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

  ;; stack: place a held block on another clear block
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