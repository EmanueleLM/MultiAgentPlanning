(define (domain hanoi-agents)
  (:requirements :strips :typing)
  (:types
    agent
    support
    peg disk - support
  )
  (:predicates
    (can-move ?a - agent ?d - disk)
    (smaller ?x - disk ?y - disk)
    (on ?d - disk ?s - support)
    (on-peg ?d - disk ?p - peg)
    (top ?d - disk ?p - peg)
    (peg-empty ?p - peg)
    (neq-peg ?p1 - peg ?p2 - peg)
  )

  (:action move_from_disk_to_empty
    :parameters (?a - agent ?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (on ?d ?below)
      (peg-empty ?to)
      (neq-peg ?from ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (top ?d ?from))
      (top ?below ?from)
      (not (peg-empty ?to))
      (top ?d ?to)
    )
  )

  (:action move_from_disk_to_disk
    :parameters (?a - agent ?d - disk ?below - disk ?from - peg ?to - peg ?to-top - disk)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (on ?d ?below)
      (top ?to-top ?to)
      (smaller ?d ?to-top)
      (neq-peg ?from ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to-top)
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (top ?d ?from))
      (top ?below ?from)
      (not (top ?to-top ?to))
      (top ?d ?to)
    )
  )

  (:action move_from_peg_to_empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (on ?d ?from)
      (peg-empty ?to)
      (neq-peg ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (top ?d ?from))
      (peg-empty ?from)
      (not (peg-empty ?to))
      (top ?d ?to)
    )
  )

  (:action move_from_peg_to_disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?to-top - disk)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (top ?d ?from)
      (on ?d ?from)
      (top ?to-top ?to)
      (smaller ?d ?to-top)
      (neq-peg ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to-top)
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (top ?d ?from))
      (peg-empty ?from)
      (not (top ?to-top ?to))
      (top ?d ?to)
    )
  )
)