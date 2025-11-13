(define (domain hanoi-3agents-10disks)
  (:requirements :strips :typing :negative-preconditions :action-costs)
  (:types
    agent
    place
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?x - disk ?y - disk)
    (can-move ?ag - agent ?d - disk)
  )
  (:functions
    (total-cost)
  )

  (:action move-disk-to-peg
    :parameters (?ag - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
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

  (:action move-disk-to-disk
    :parameters (?ag - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
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