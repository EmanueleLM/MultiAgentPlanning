(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)       ; disk that is directly on a peg (bottom of that peg's stack)
    (on-disk ?d - disk ?below - disk) ; disk directly on top of another disk
    (clear-peg ?p - peg)              ; peg has no disks
    (clear-disk ?d - disk)            ; disk has no disk on top (is top)
    (smaller ?d1 - disk ?d2 - disk)   ; static size ordering: d1 is smaller than d2
    (current ?s - stage)              ; currently active stage
    (succ ?s1 - stage ?s2 - stage)    ; stage successor relation
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (clear-peg ?from)
      (not (clear-peg ?to))

      (clear-disk ?d)
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (clear-disk ?below)

      (not (clear-peg ?to))

      (clear-disk ?d)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (clear-peg ?from)

      (not (clear-disk ?to))

      (clear-disk ?d)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?below))
      (on-disk ?d ?to)

      (clear-disk ?below)

      (not (clear-disk ?to))

      (clear-disk ?d)
    )
  )
)