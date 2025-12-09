(define (domain hanoi-6)
  (:requirements :strips :typing)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?below - disk)

    (top ?d - disk ?p - peg)
    (clear ?d - disk)
    (peg-empty ?p - peg)

    (smaller ?d1 - disk ?d2 - disk)

    (at-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (top ?d ?from)
      (peg-empty ?to)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      (not (peg-empty ?to))
      (peg-empty ?from)

      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?tgt - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (top ?d ?from)
      (top ?tgt ?to)
      (smaller ?d ?tgt)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)

      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?tgt ?to))

      (not (clear ?tgt))

      (peg-empty ?from)
      (not (peg-empty ?to))

      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (top ?d ?from)
      (peg-empty ?to)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (not (top ?d ?from))
      (top ?below ?from)
      (top ?d ?to)

      (clear ?below)

      (not (peg-empty ?to))

      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?tgt - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (top ?d ?from)
      (top ?tgt ?to)
      (smaller ?d ?tgt)
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?tgt)

      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?tgt ?to))

      (clear ?below)
      (not (clear ?tgt))

      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)