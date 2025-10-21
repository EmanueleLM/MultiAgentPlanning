(define (domain blocksworld-multi)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (block ?b - block)                    ; explicit block predicate
    (handempty ?a - agent)                ; agent's hand is empty
    (holding ?a - agent ?b - block)       ; agent is holding block ?b
    (on ?x - block ?y - block)            ; ?x is on ?y
    (on-table ?b - block)                 ; ?b is on the table
    (clear ?b - block)                    ; nothing is on ?b and it is not being held
  )

  ; pick-up: agent picks up a block from the table
  (:action pick-up
    :parameters (?ag - agent ?b - block)
    :precondition (and (handempty ?ag) (on-table ?b) (clear ?b))
    :effect (and
      (holding ?ag ?b)
      (not (on-table ?b))
      (not (handempty ?ag))
      (not (clear ?b))
    )
  )

  ; unstack: agent unstack a block from another block
  (:action unstack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and (handempty ?ag) (on ?b ?s) (clear ?b))
    :effect (and
      (holding ?ag ?b)
      (not (on ?b ?s))
      (not (handempty ?ag))
      (not (clear ?b))
      (clear ?s)
    )
  )

  ; put-down: agent puts down a held block onto the table
  (:action put-down
    :parameters (?ag - agent ?b - block)
    :precondition (and (holding ?ag ?b))
    :effect (and
      (on-table ?b)
      (clear ?b)
      (handempty ?ag)
      (not (holding ?ag ?b))
    )
  )

  ; stack: agent stacks a held block onto another clear block
  (:action stack
    :parameters (?ag - agent ?b - block ?dest - block)
    :precondition (and (holding ?ag ?b) (clear ?dest))
    :effect (and
      (on ?b ?dest)
      (handempty ?ag)
      (clear ?b)
      (not (holding ?ag ?b))
      (not (clear ?dest))
    )
  )
)