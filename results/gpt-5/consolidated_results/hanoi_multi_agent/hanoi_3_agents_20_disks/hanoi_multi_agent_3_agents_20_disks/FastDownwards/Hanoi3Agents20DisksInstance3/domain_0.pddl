(define (domain hanoi-3peg-20disk-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg)
  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?top - disk ?bottom - disk)
    (clear ?x - object)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent)
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?a)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (can-move ?a)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (can-move ?a)
      (on-disk ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (can-move ?a)
      (on-disk ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)