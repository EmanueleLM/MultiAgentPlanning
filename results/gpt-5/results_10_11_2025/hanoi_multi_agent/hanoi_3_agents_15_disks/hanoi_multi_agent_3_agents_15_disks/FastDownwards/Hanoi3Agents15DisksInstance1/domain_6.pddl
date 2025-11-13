(define (domain hanoi-3agents-15disks)
  (:requirements :strips :typing)
  (:types
    peg disk agent
  )
  (:predicates
    (on ?d - disk ?s - object)
    (on-peg ?d - disk ?p - peg)
    (clear ?s - object)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-from-peg-to-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?ag ?d)
      (on-peg ?d ?from)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (on ?d ?from))
      (on-peg ?d ?to)
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (can-move ?ag ?d)
      (on-peg ?d ?from)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?ag - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on-peg ?d ?to)
      (on ?d ?to)
      (not (clear ?to))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?ag - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (can-move ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
    )
  )
)