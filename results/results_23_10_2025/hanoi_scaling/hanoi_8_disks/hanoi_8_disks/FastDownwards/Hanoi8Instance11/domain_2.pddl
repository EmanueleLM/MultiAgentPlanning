(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?below - disk)
    (on-peg  ?d - disk ?p - peg)
    (at      ?d - disk ?p - peg)
    (clear   ?d - disk)
    (empty   ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action move-onpeg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (at ?d ?from))
      (at ?d ?to)
      (not (empty ?to))
      (empty ?from)
      (clear ?d)
    )
  )

  (:action move-ondisk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (at ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (at ?d ?from))
      (at ?d ?to)
      (clear ?below)
      (not (empty ?to))
      (clear ?d)
    )
  )

  (:action move-onpeg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?top)
      (at ?top ?to)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (at ?d ?from))
      (on-disk ?d ?top)
      (at ?d ?to)
      (not (clear ?top))
      (clear ?d)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action move-ondisk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?top - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?top)
      (at ?d ?from)
      (at ?top ?to)
      (smaller ?d ?top)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?top)
      (not (clear ?top))
      (clear ?below)
      (not (at ?d ?from))
      (at ?d ?to)
      (clear ?d)
    )
  )
)