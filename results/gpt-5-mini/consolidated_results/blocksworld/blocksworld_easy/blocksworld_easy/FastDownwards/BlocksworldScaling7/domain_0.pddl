(define (domain blocks-domain)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (block ?b - block)
    (on ?x - block ?y - block)    ; x is on block y
    (ontable ?x - block)         ; x is on the table
    (clear ?x - block)           ; nothing on top of x
    (holding ?x - block)         ; the agent is holding x
    (handempty)                  ; the agent's hand is empty
  )

  ;; PICKUP: pick a clear block from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (handempty))
      (not (clear ?x))
    )
  )

  ;; UNSTACK: pick a clear block x from block y
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
      (not (clear ?x))
    )
  )

  ;; PUTDOWN: put the held block onto the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
      (ontable ?x)
      (handempty)
      (clear ?x)
      (not (holding ?x))
    )
  )

  ;; STACK: place the held block x on top of clear block y
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (handempty)
      (clear ?x)
      (not (holding ?x))
      (not (clear ?y))
    )
  )
)