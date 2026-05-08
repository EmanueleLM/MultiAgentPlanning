(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)       ; disk is directly on a peg (no disk between disk and peg)
    (on-disk ?d - disk ?below - disk) ; disk is directly on another disk
    (clear-peg ?p - peg)              ; peg has no disks at all
    (clear-disk ?d - disk)            ; disk has no disk on top of it
    (smaller ?d1 - disk ?d2 - disk)   ; d1 strictly smaller than d2
    (next ?s1 - stage ?s2 - stage)    ; stage ordering: s2 is the successor of s1
    (at-stage ?s - stage)             ; current global stage (ensures one action per stage)
  )

  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (clear-disk ?below)
      (not (clear-peg ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?frombelow - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?frombelow)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?frombelow))
      (on-disk ?d ?to)
      (clear-disk ?frombelow)
      (not (clear-disk ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)