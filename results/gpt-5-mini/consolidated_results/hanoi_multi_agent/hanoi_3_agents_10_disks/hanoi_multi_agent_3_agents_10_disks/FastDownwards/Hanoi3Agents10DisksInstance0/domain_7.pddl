(define (domain hanoi-three-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (allowed ?a - agent ?d - disk)
  )

  ;; move a disk onto a peg
  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (allowed ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; move a disk onto another disk (must be smaller)
  (:action move-to-disk
    :parameters (?ag - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (allowed ?ag ?d)
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
      (clear ?d)
    )
  )
)