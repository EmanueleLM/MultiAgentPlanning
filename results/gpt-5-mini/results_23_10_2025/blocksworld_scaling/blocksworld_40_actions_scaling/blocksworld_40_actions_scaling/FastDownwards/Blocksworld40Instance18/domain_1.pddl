(define (domain blocks-world-verified)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (verified)
  )

  ;; pickup a clear block from the table
  (:action pickup
    :parameters (?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty))
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty))
    )
  )

  ;; put the held block down on the table
  (:action putdown
    :parameters (?x - block)
    :precondition (and (holding ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
    )
  )

  ;; stack the held block ?x onto block ?y
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and (holding ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (not (clear ?y))
      (handempty)
      (not (holding ?x))
    )
  )

  ;; unstack block ?x from block ?y (pick ?x up)
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

  ;; verification action: can be executed only when the exact final arrangement holds
  (:action verify-final
    :parameters ()
    :precondition (and
      ;; final stacks: L on A on B on C on table
      (on l a)
      (on a b)
      (on b c)
      (ontable c)
      ;; D on F on H on J on table
      (on d f)
      (on f h)
      (on h j)
      (ontable j)
      ;; E on I on G on table
      (on e i)
      (on i g)
      (ontable g)
      ;; K on table
      (ontable k)
      ;; ensure topmost clear-ness of stack tops
      (clear l)
      (clear d)
      (clear e)
      (clear k)
      ;; ensure hand is free when verifying
      (handempty)
    )
    :effect (and
      (verified)
    )
  )
)