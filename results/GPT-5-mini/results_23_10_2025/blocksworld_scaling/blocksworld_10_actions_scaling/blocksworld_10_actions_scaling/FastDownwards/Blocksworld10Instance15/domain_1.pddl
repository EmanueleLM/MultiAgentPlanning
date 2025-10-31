(define (domain blocks-world-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)    ; ?x is on block ?y
    (ontable ?x - block)          ; ?x is on the table
    (clear ?x - block)            ; nothing on top of ?x
    (holding ?x - block)          ; the agent is holding ?x
    (handempty)                   ; the agent's hand is empty
  )

  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
    )
  )

  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
    )
  )
)