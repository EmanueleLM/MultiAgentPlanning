(define (domain hanoi2agents15)
  (:requirements :strips :typing)
  (:types
    agent
    place
    peg - place
    disk - place
  )
  (:predicates
    (on ?d - disk ?x - place)
    (clear ?x - place)
    (at ?d - disk ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-from-peg-to-empty-peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?below - place)
    :precondition (and
      (can-move ?a ?d)
      (at ?d ?from)
      (clear ?d)
      (on ?d ?below)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (clear ?below)
      (not (clear ?to))
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?desttop - disk ?below - place)
    :precondition (and
      (can-move ?a ?d)
      (at ?d ?from)
      (clear ?d)
      (on ?d ?below)
      (at ?desttop ?to)
      (clear ?desttop)
      (smaller ?d ?desttop)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?desttop)
      (clear ?below)
      (not (clear ?desttop))
      (not (at ?d ?from))
      (at ?d ?to)
    )
  )
)