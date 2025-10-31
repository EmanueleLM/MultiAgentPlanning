(define (domain hanoi-coop)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (can-move ?ag - agent ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk ?d from a place ?from to a peg ?to when there is no disk beneath ?d
  (:action move-no-below-to-peg
    :parameters (?ag - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move ?ag ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a top disk ?d from a place ?from to a disk ?to when there is no disk beneath ?d (must be smaller than target)
  (:action move-no-below-to-disk
    :parameters (?ag - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move ?ag ?d)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Move a top disk ?d that has a disk ?below directly beneath it,
  ;; from place ?from to a peg ?to. The disk ?below becomes directly on ?from.
  (:action move-with-below-to-peg
    :parameters (?ag - agent ?d - disk ?from - place ?to - peg ?below - disk)
    :precondition (and
      (on ?d ?from)
      (on ?below ?d)
      (clear ?d)
      (clear ?to)
      (can-move ?ag ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (on ?below ?d))
      (on ?below ?from)
      (clear ?below)
      (not (clear ?to))
    )
  )

  ;; Move a top disk ?d that has a disk ?below directly beneath it,
  ;; from place ?from to a disk ?to. Must be smaller than ?to. The disk ?below becomes directly on ?from.
  (:action move-with-below-to-disk
    :parameters (?ag - agent ?d - disk ?from - place ?to - disk ?below - disk)
    :precondition (and
      (on ?d ?from)
      (on ?below ?d)
      (clear ?d)
      (clear ?to)
      (can-move ?ag ?d)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (on ?below ?d))
      (on ?below ?from)
      (clear ?below)
      (not (clear ?to))
    )
  )

)