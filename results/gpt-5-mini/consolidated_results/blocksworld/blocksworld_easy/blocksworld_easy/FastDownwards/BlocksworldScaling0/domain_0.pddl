(define (domain orchestrator-blocks)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?b - block ?support - block)     ; block ?b is on block ?support
    (ontable ?b - block)                 ; block ?b is on the table
    (clear ?b - block)                   ; nothing on top of ?b and ?b is not being held
    (holding ?b - block)                 ; agent is holding ?b
    (handempty)                          ; agent's hand is empty
  )

  ;; pick-up from table
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
      (not (clear ?b))   ; being held => not clear
      (not (handempty))
    )
  )

  ;; unstack a block from another block
  (:action unstack
    :parameters (?b - block ?s - block)
    :precondition (and
      (handempty)
      (on ?b ?s)
      (clear ?b)
    )
    :effect (and
      (holding ?b)
      (clear ?s)         ; support becomes clear after removal
      (not (on ?b ?s))
      (not (clear ?b))   ; being held => not clear
      (not (handempty))
    )
  )

  ;; put down a held block on the table
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

  ;; stack a held block onto another block
  (:action stack
    :parameters (?b - block ?t - block)
    :precondition (and
      (holding ?b)
      (clear ?t)
    )
    :effect (and
      (on ?b ?t)
      (clear ?b)
      (not (holding ?b))
      (handempty)
      (not (clear ?t))   ; support is no longer clear once something is stacked on it
    )
  )
)