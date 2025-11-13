(define (domain hanoi2agents)
  (:requirements :strips :typing)
  (:types
    agent
    support
    disk peg - support
  )
  (:predicates
    (on ?d1 - disk ?d2 - disk)
    (on-peg ?d - disk ?p - peg)
    (clear ?s - support)
    (top ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?ag - agent ?d - disk)
  )

  ; move a disk from on top of another disk to on top of a destination disk
  (:action move-disk-to-disk
    :parameters (?ag - agent ?x - disk ?from - disk ?to - disk)
    :precondition (and
      (can-move ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (on ?x ?to)
      (clear ?from)
      (top ?from)
      (not (clear ?to))
      (clear ?x)
      (top ?x)
      (not (top ?to))
    )
  )

  ; move a disk from on top of another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?ag - agent ?x - disk ?from - disk ?p - peg)
    :precondition (and
      (can-move ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?p)
    )
    :effect (and
      (not (on ?x ?from))
      (on-peg ?x ?p)
      (clear ?from)
      (top ?from)
      (not (clear ?p))
      (clear ?x)
      (top ?x)
    )
  )

  ; lift a disk from a peg onto a destination disk
  (:action move-peg-to-disk
    :parameters (?ag - agent ?x - disk ?p - peg ?to - disk)
    :precondition (and
      (can-move ?ag ?x)
      (on-peg ?x ?p)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
    )
    :effect (and
      (not (on-peg ?x ?p))
      (clear ?p)
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
      (top ?x)
      (not (top ?to))
    )
  )

  ; move a disk from a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?ag - agent ?x - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (can-move ?ag ?x)
      (on-peg ?x ?p1)
      (clear ?x)
      (clear ?p2)
    )
    :effect (and
      (not (on-peg ?x ?p1))
      (clear ?p1)
      (on-peg ?x ?p2)
      (not (clear ?p2))
      (clear ?x)
      (top ?x)
    )
  )
)