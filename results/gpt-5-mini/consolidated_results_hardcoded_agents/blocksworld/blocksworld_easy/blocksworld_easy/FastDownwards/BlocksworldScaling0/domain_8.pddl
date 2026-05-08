(define (domain orchestrator-blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?b - block ?s - block)    ; ?b is on top of block ?s
    (ontable ?b - block)          ; ?b is on the table
    (clear ?b - block)            ; nothing on top of ?b and ?b is not being held
    (holding ?b - block)          ; the single hand is holding ?b
    (handempty)                   ; the single hand is empty
  )

  (:action pick-up
    :parameters (?b - block)
    :precondition (and
      (handempty)
      (ontable ?b)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action unstack
    :parameters (?b - block ?s - block)
    :precondition (and
      (handempty)
      (on ?b ?s)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (clear ?s)
      (not (on ?b ?s))
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  (:action put-down
    :parameters (?b - block)
    :precondition (and
      (holding ?b)
    )
    :effect (and
      (ontable ?b)
      (clear ?b)
      (not (holding ?b))
      (handempty)
    )
  )

  (:action stack
    :parameters (?b - block ?tgt - block)
    :precondition (and
      (holding ?b)
      (clear ?tgt)
    )
    :effect (and
      (on ?b ?tgt)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (clear ?tgt))
      (not (ontable ?b))
    )
  )
)