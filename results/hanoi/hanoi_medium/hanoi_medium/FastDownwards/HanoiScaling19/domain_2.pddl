(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?b - disk)        ; disk ?d is immediately on disk ?b
    (on-peg ?d - disk ?p - peg)     ; disk ?d is immediately on peg ?p
    (clear-disk ?d - disk)          ; no disk is immediately on ?d
    (clear-peg ?p - peg)            ; no disk is immediately on peg ?p
    (smaller ?d1 - disk ?d2 - disk) ; static size ordering: ?d1 smaller than ?d2
    (next ?s1 - step ?s2 - step)
    (current ?s - step)
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (clear-peg ?from)
      (not (clear-peg ?to))

      (clear-disk ?d)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?top - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?top)
      (smaller ?d ?top)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on ?d ?top)

      (clear-peg ?from)
      (not (clear-disk ?top))

      (clear-disk ?d)
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (on ?d ?from))
      (on-peg ?d ?to)

      (clear-disk ?from)
      (not (clear-peg ?to))

      (clear-disk ?d)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?top - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-disk ?top)
      (smaller ?d ?top)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (on ?d ?from))
      (on ?d ?top)

      (clear-disk ?from)
      (not (clear-disk ?top))

      (clear-disk ?d)
    )
  )
)