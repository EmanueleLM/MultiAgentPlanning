(define (domain hanoi3agents-20)
  (:requirements :strips :typing :action-costs)
  (:types
    agent place
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?x - place)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
  )
  (:functions (total-cost) - number)

  (:action move-to-peg
    :parameters (?a - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action move-to-disk
    :parameters (?a - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )
)