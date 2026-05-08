(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    (clear ?b - block)          ; no block on top of ?b and ?b is not being held
    (on ?b - block ?c - block)  ; ?b is directly on top of ?c
    (on-table ?b - block)       ; ?b is directly on the table
    (holding ?b - block)        ; agent is holding ?b
    (handempty)                 ; agent's hand is empty
    (current ?t - step)         ; denotes the current discrete time/stage
    (succ ?t1 - step ?t2 - step) ; successor relation over steps (one action per step)
  )

  ;; Pickup a clear block from the table, advancing the current step to its successor
  (:action pickup
    :parameters (?b - block ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (clear ?b)
      (on-table ?b)
      (handempty)
    )
    :effect (and
      (not (on-table ?b))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Unstack a clear block ?b from on top of ?c, advancing the current step
  (:action unstack
    :parameters (?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (on ?b ?c)
      (clear ?b)
      (handempty)
    )
    :effect (and
      (not (on ?b ?c))
      (not (clear ?b))
      (not (handempty))
      (holding ?b)
      (clear ?c)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Put the held block down onto the table, advancing the current step
  (:action putdown
    :parameters (?b - block ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (holding ?b)
    )
    :effect (and
      (not (holding ?b))
      (on-table ?b)
      (clear ?b)
      (handempty)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Stack the held block ?b onto another clear block ?c, advancing the current step
  (:action stack
    :parameters (?b - block ?c - block ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (succ ?t ?t2)
      (holding ?b)
      (clear ?c)
    )
    :effect (and
      (not (holding ?b))
      (not (clear ?c))
      (on ?b ?c)
      (clear ?b)
      (handempty)
      (not (current ?t))
      (current ?t2)
    )
  )
)