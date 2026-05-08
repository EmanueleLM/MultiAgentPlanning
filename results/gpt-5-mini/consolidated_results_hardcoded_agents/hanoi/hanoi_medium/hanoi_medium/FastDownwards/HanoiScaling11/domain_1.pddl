(define (domain hanoi-5-peg3)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ; immediate support relations
    (on-disk ?d - disk ?below - disk)
    (on-peg ?d - disk ?p - peg)

    ; clear for disks (true iff nothing on top of that disk)
    (clear-disk ?d - disk)

    ; peg empty flag (true iff no disk on that peg)
    (empty ?p - peg)

    ; top-most disk on a peg (the disk that is currently at the top of the peg's stack)
    (top-of-peg ?d - disk ?p - peg)

    ; anchor peg where disk's stack currently resides
    (located ?d - disk ?p - peg)

    ; static size ordering: true iff ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ; stage progression control
    (stage ?s - stage)
    (next ?s - stage ?s2 - stage)
    (current ?s - stage)
  )

  ; Move a top disk that currently sits directly on a source peg onto an empty destination peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)

      (top-of-peg ?d ?from)
      (on-peg ?d ?from)
      (clear-disk ?d)

      (empty ?to)

      (located ?d ?from)
    )
    :effect (and
      ; stage advance
      (not (current ?s))
      (current ?s2)

      ; relocate disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ; update top-of-peg markers
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)

      ; peg empty flags
      (not (empty ?to))
      (empty ?from)

      ; located update
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )

  ; Move a top disk that currently sits directly on a source peg onto the top disk of a destination peg
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?dest - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)

      (top-of-peg ?d ?from)
      (on-peg ?d ?from)
      (clear-disk ?d)

      (top-of-peg ?dest ?to)
      (smaller ?d ?dest)

      (located ?d ?from)
      (located ?dest ?to)
    )
    :effect (and
      ; stage advance
      (not (current ?s))
      (current ?s2)

      ; relocate disk to be on top of dest disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?dest)

      ; update top-of-peg on both pegs
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?dest ?to))

      ; dest disk no longer clear
      (not (clear-disk ?dest))

      ; source peg becomes empty
      (empty ?from)

      ; located update
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )

  ; Move a top disk that currently sits on another disk onto an empty destination peg
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)

      (top-of-peg ?d ?from)
      (on-disk ?d ?below)
      (clear-disk ?d)

      (empty ?to)

      (located ?d ?from)
      (located ?below ?from)
    )
    :effect (and
      ; stage advance
      (not (current ?s))
      (current ?s2)

      ; move disk to empty peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ; update top markers and clear flags
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)

      (clear-disk ?below)
      (top-of-peg ?below ?from)

      ; destination peg now non-empty
      (not (empty ?to))

      ; located update
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )

  ; Move a top disk that currently sits on another disk onto the top disk of a destination peg
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?dest - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (next ?s ?s2)

      (top-of-peg ?d ?from)
      (on-disk ?d ?below)
      (clear-disk ?d)

      (top-of-peg ?dest ?to)
      (smaller ?d ?dest)

      (located ?d ?from)
      (located ?below ?from)
      (located ?dest ?to)
    )
    :effect (and
      ; stage advance
      (not (current ?s))
      (current ?s2)

      ; relocate disk on dest disk
      (not (on-disk ?d ?below))
      (on-disk ?d ?dest)

      ; update top markers and clear flags
      (not (top-of-peg ?d ?from))
      (top-of-peg ?d ?to)
      (not (top-of-peg ?dest ?to))

      (clear-disk ?below)
      (top-of-peg ?below ?from)

      (not (clear-disk ?dest))

      ; located update
      (not (located ?d ?from))
      (located ?d ?to)
    )
  )
)