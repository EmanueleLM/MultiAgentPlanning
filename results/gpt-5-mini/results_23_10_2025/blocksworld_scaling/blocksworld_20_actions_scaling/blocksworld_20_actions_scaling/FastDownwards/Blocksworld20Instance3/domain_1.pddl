(define (domain blocksworld20instance3)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (on ?x ?y)       ; block ?x is on block ?y
    (ontable ?x)     ; block ?x is on the table
    (clear ?x)       ; nothing on block ?x
    (holding ?x)     ; the agent is holding block ?x
    (handempty)      ; the agent's hand is empty
  )

  ;; pickup a block from the table
  (:action pickup
    :parameters (?x)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
    )
  )

  ;; put down a held block onto the table
  (:action putdown
    :parameters (?x)
    :precondition (and (holding ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  ;; unstack: pick up top block ?x from block ?y
  (:action unstack
    :parameters (?x ?y)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
    )
  )

  ;; stack: place held block ?x onto block ?y
  (:action stack
    :parameters (?x ?y)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty)
      (not (holding ?x))
    )
  )
)