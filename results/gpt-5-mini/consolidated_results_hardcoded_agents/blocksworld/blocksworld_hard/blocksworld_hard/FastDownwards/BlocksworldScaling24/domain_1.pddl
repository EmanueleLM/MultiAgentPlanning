(define (domain stacking-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)        ; ?x is directly on ?y (both blocks)
    (ontable ?x - block)              ; ?x is directly on the table
    (clear ?x - block)                ; nothing on top of ?x
    (holding ?a - agent ?x - block)   ; agent ?a is holding block ?x
    (handempty ?a - agent)            ; agent ?a has empty hand
  )

  ;; ACTION: pickup a block from the table
  (:action pickup
    :parameters (?a - agent ?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty ?a))
    :effect (and
              (holding ?a ?x)
              (not (ontable ?x))
              (not (clear ?x))
              (not (handempty ?a))
             )
  )

  ;; ACTION: putdown a block onto the table
  (:action putdown
    :parameters (?a - agent ?x - block)
    :precondition (holding ?a ?x)
    :effect (and
              (ontable ?x)
              (clear ?x)
              (handempty ?a)
              (not (holding ?a ?x))
             )
  )

  ;; ACTION: unstack a block from another block
  (:action unstack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty ?a))
    :effect (and
              (holding ?a ?x)
              (not (on ?x ?y))
              (clear ?y)
              (not (clear ?x))
              (not (handempty ?a))
             )
  )

  ;; ACTION: stack a block onto another block
  (:action stack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (holding ?a ?x) (clear ?y))
    :effect (and
              (on ?x ?y)
              (clear ?x)
              (handempty ?a)
              (not (clear ?y))
              (not (holding ?a ?x))
             )
  )
)