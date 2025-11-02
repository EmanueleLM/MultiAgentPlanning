(define (domain blocks)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (arm-empty)
    (solved)
  )

  ;; Pick up a block from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (arm-empty))
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (arm-empty))
    )
  )

  ;; Put a held block down on the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (arm-empty)
      (not (holding ?x))
    )
  )

  ;; Unstack a block from another block (pick up top block)
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (arm-empty))
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (arm-empty))
      (not (clear ?x))
    )
  )

  ;; Stack a held block onto another block
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (arm-empty)
      (not (holding ?x))
      (not (clear ?y))
    )
  )

  ;; Verification action: succeeds only when the exact final arrangement is present.
  ;; The goal will be to make (solved) true, so the planner must reach the specified arrangement.
  (:action verify-final-arrangement
    :parameters ()
    :precondition (and
      (on A L)
      (on B N)
      (on C E)
      (on D J)
      (on E I)
      (on F B)
      (on H C)
      (on I F)
      (on J A)
      (on K G)

      (ontable G)
      (ontable L)
      (ontable M)
      (ontable N)

      (arm-empty)
    )
    :effect (and (solved))
  )
)