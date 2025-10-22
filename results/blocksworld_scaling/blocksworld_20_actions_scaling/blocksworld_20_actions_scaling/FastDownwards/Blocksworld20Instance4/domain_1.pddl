(define (domain blocksworld)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)    ; ?x is on ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on ?x
    (handempty)                   ; no block in hand
    (holding ?x - block)          ; the agent is holding ?x
  )

  ;; pickup a clear block from the table
  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (handempty))
    )
  )

  ;; put a held block down on the table
  (:action putdown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ;; unstack a clear block from another block (pick it up)
  (:action unstack
    :parameters (?b - block ?support - block)
    :precondition (and (on ?b ?support) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?support)
      (not (on ?b ?support))
      (not (handempty))
    )
  )

  ;; stack a held block onto a clear block
  (:action stack
    :parameters (?b - block ?support - block)
    :precondition (and (holding ?b) (clear ?support))
    :effect (and
      (on ?b ?support)
      (clear ?b)
      (not (clear ?support))
      (handempty)
      (not (holding ?b))
    )
  )
)