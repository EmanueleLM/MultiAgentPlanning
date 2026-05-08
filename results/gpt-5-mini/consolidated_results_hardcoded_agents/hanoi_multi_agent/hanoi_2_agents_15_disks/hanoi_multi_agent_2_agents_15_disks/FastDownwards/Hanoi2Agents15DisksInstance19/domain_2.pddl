(define (domain hanoi_2agents_15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?o - object)
    (clear ?o - object)
  )

  (:action agent1-move-A-left-middle
    :parameters ()
    :precondition (and
      (on A B)
      (clear A)
      (clear middle)
    )
    :effect (and
      (not (on A B))
      (on A middle)
      (not (clear middle))
      (clear B)
    )
  )

  (:action agent1-move-B-left-right
    :parameters ()
    :precondition (and
      (on B C)
      (clear B)
      (clear right)
    )
    :effect (and
      (not (on B C))
      (on B right)
      (not (clear right))
      (clear C)
    )
  )
)