(define (domain blocksworld-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent block)

  (:predicates
    (on ?b - block ?s - block)        ; block ?b is on block ?s
    (ontable ?b - block)             ; block ?b is on the table
    (clear ?b - block)               ; nothing on top of ?b
    (holding ?a - agent ?b - block)  ; agent ?a holds block ?b
    (handempty ?a - agent)           ; agent ?a's hand is empty
    (can-manipulate ?a - agent ?b - block) ; agent ?a may move block ?b
  )

  ;; Unstack a block from on top of another block into agent's hand
  (:action unstack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and
      (can-manipulate ?ag ?b)
      (on ?b ?s)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (not (on ?b ?s))
      (not (clear ?b))
      (clear ?s)
      (not (handempty ?ag))
    )
  )

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?ag - agent ?b - block ?s - block)
    :precondition (and
      (can-manipulate ?ag ?b)
      (holding ?ag ?b)
      (clear ?s)
    )
    :effect (and
      (on ?b ?s)
      (clear ?b)
      (not (clear ?s))
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )

  ;; Pick up a clear block from the table
  (:action pickup
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (can-manipulate ?ag ?b)
      (ontable ?b)
      (clear ?b)
      (handempty ?ag)
    )
    :effect (and
      (holding ?ag ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty ?ag))
    )
  )

  ;; Put down a held block onto the table
  (:action putdown
    :parameters (?ag - agent ?b - block)
    :precondition (and
      (can-manipulate ?ag ?b)
      (holding ?ag ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?ag ?b))
      (handempty ?ag)
    )
  )
)