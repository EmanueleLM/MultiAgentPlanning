(define (domain blocks-orchestrator)
  (:requirements :strips :typing)
  (:types block)

  (:predicates
    (on ?b ?c - block)        ; b is directly on c
    (ontable ?b - block)      ; b is directly on the table
    (clear ?b - block)        ; nothing on b AND b is not being held
    (holding ?b - block)      ; the agent is holding b
    (handempty)               ; the agent's hand is empty
  )

  ; PickUp: lift a clear block from the table into the hand
  (:action PickUp
    :parameters (?b - block)
    :precondition (and (ontable ?b) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (not (ontable ?b))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ; Unstack: remove a clear block b from on c into the hand
  (:action Unstack
    :parameters (?b - block ?c - block)
    :precondition (and (on ?b ?c) (clear ?b) (handempty))
    :effect (and
      (holding ?b)
      (clear ?c)
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
    )
  )

  ; PutDown: put a held block onto the table
  (:action PutDown
    :parameters (?b - block)
    :precondition (holding ?b)
    :effect (and
      (ontable ?b)
      (clear ?b)
      (handempty)
      (not (holding ?b))
    )
  )

  ; Stack: place a held block b onto a clear block c
  (:action Stack
    :parameters (?b - block ?c - block)
    :precondition (and (holding ?b) (clear ?c))
    :effect (and
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (holding ?b))
      (not (clear ?c))
    )
  )
)