(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; stacking relations
    (on ?d - disk ?s - disk)        ;; disk ?d is directly on top of disk ?s
    (on-peg ?d - disk ?p - peg)     ;; disk ?d is directly on top of peg ?p

    ;; topness / emptiness
    (clear-disk ?d - disk)          ;; nothing on top of disk ?d
    (clear-peg ?p - peg)            ;; peg ?p has no disk on it

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete time / stage control
    (at-step ?t - step)
    (next ?t1 - step ?t2 - step)
  )

  ;; move a top disk from a peg to another empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?cur - step ?next - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (at-step ?cur)
      (next ?cur ?next)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (not (at-step ?cur))
      (at-step ?next)
    )
  )

  ;; move a top disk from a peg onto another disk (must be smaller)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?dest - disk ?cur - step ?next - step)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?dest)
      (smaller ?d ?dest)
      (at-step ?cur)
      (next ?cur ?next)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on ?d ?dest)
      (not (clear-disk ?dest))
      (clear-peg ?from)
      (not (at-step ?cur))
      (at-step ?next)
    )
  )

  ;; move a top disk from on top of a disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?cur - step ?next - step)
    :precondition (and
      (on ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (at-step ?cur)
      (next ?cur ?next)
    )
    :effect (and
      (not (on ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
      (not (at-step ?cur))
      (at-step ?next)
    )
  )

  ;; move a top disk from on top of a disk onto another disk (must be smaller)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?dest - disk ?cur - step ?next - step)
    :precondition (and
      (on ?d ?from)
      (clear-disk ?d)
      (clear-disk ?dest)
      (smaller ?d ?dest)
      (at-step ?cur)
      (next ?cur ?next)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dest)
      (not (clear-disk ?dest))
      (clear-disk ?from)
      (not (at-step ?cur))
      (at-step ?next)
    )
  )
)