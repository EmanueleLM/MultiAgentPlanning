(define (domain blocks-world-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:constants A B C D E F G H I J K L - block)

  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding1 ?x - block)
    (holding2 ?x - block)
    (handempty1)
    (handempty2)
    (verified)
  )

  ;; Worker1 actions
  (:action pickup_w1
    :parameters (?x - block)
    :precondition (and (on-table ?x) (clear ?x) (handempty1))
    :effect (and
      (not (on-table ?x))
      (not (clear ?x))
      (holding1 ?x)
      (not (handempty1))
    )
  )

  (:action putdown_w1
    :parameters (?x - block)
    :precondition (and (holding1 ?x))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (not (holding1 ?x))
      (handempty1)
    )
  )

  (:action unstack_w1
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty1) (not (on-table ?x)))
    :effect (and
      (not (on ?x ?y))
      (holding1 ?x)
      (not (handempty1))
      (clear ?y)
      (not (clear ?x))
    )
  )

  (:action stack_w1
    :parameters (?x - block ?y - block)
    :precondition (and (holding1 ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding1 ?x))
      (handempty1)
    )
  )

  ;; Worker2 actions
  (:action pickup_w2
    :parameters (?x - block)
    :precondition (and (on-table ?x) (clear ?x) (handempty2))
    :effect (and
      (not (on-table ?x))
      (not (clear ?x))
      (holding2 ?x)
      (not (handempty2))
    )
  )

  (:action putdown_w2
    :parameters (?x - block)
    :precondition (and (holding2 ?x))
    :effect (and
      (on-table ?x)
      (clear ?x)
      (not (holding2 ?x))
      (handempty2)
    )
  )

  (:action unstack_w2
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty2) (not (on-table ?x)))
    :effect (and
      (not (on ?x ?y))
      (holding2 ?x)
      (not (handempty2))
      (clear ?y)
      (not (clear ?x))
    )
  )

  (:action stack_w2
    :parameters (?x - block ?y - block)
    :precondition (and (holding2 ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (not (holding2 ?x))
      (handempty2)
    )
  )

  ;; Verification action: only applicable when the deduced final arrangement holds.
  (:action verify-final-arrangement
    :parameters ()
    :precondition (and
      ;; final arrangement required to apply this action:
      (on-table A)
      (on I A)
      (on L I)
      (on-table C)
      (on H C)
      (on-table F)
      (on E F)
      (on D E)
      (on-table K)
      (on B K)
      (on-table J)
      (on G J)
      ;; require both hands empty at verification
      (handempty1)
      (handempty2)
    )
    :effect (and
      (verified)
    )
  )
)