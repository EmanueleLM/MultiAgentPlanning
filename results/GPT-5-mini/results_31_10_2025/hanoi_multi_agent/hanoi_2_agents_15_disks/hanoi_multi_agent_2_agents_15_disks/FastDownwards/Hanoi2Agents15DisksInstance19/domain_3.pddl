(define (domain hanoi_2agents_15)
  (:requirements :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?o - object)
    (clear ?o - object)
  )

  (:action agent1-move-a-left-middle
    :parameters ()
    :precondition (and
      (on a b)
      (clear a)
      (clear middle)
    )
    :effect (and
      (not (on a b))
      (on a middle)
      (not (clear middle))
      (clear b)
    )
  )

  (:action agent1-move-b-left-right
    :parameters ()
    :precondition (and
      (on b c)
      (clear b)
      (clear right)
    )
    :effect (and
      (not (on b c))
      (on b right)
      (not (clear right))
      (clear c)
    )
  )
)