(define (domain blocks)
  (:requirements :strips :typing)
  (:types block)
  (:predicates
    (on ?b - block ?x - block)    ; block ?b is on block ?x
    (ontable ?b - block)          ; block ?b is on the table
    (clear ?b - block)            ; nothing on top of ?b
    (holding ?b - block)          ; the agent is holding ?b
    (handempty)                   ; the agent's hand is empty
  )

  ;; pick up a block from the table
  (:action pickup
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
    )
  )

  ;; unstack a block from on top of another block
  (:action unstack
    :parameters (?b - block ?x - block)
    :precondition (and (on ?b ?x) (clear ?b) (handempty))
    :effect (and
      (not (on ?b ?x))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?x)
    )
  )

  ;; put the held block down onto the table
  (:action putdown
    :parameters (?b - block)
    :precondition (and (holding ?b))
    :effect (and
      (not (holding ?b))
      (ontable ?b)
      (clear ?b)
      (handempty)
    )
  )

  ;; stack the held block onto another block
  (:action stack
    :parameters (?b - block ?x - block)
    :precondition (and (holding ?b) (clear ?x))
    :effect (and
      (not (holding ?b))
      (not (clear ?x))
      (on ?b ?x)
      (clear ?b)
      (handempty)
    )
  )
)