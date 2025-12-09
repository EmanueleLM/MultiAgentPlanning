(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on another disk
    (on-disk ?d - disk ?u - disk)
    ;; no disk on top of this disk
    (clear-disk ?d - disk)
    ;; peg currently empty (no disks on it)
    (clear-peg ?p - peg)
    ;; strict size ordering
    (smaller ?d1 - disk ?d2 - disk)
    ;; temporal control
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  ;; Move a disk that is directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (clear-disk ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on a peg onto the top of another disk (destination must be larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
      (clear-disk ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?under - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?under)
      (clear-disk ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a disk that is directly on another disk onto the top of another disk (destination must be larger).
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?under)
      (clear-disk ?d)
      (not (current ?s))
      (current ?s2)
    )
  )
)