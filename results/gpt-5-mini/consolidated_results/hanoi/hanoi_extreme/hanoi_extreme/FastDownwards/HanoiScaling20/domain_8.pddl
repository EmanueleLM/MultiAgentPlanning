(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; placement relations
    (on-peg ?d - disk ?p - peg)    ;; disk directly on a peg
    (on-disk ?d - disk ?s - disk) ;; disk directly on another disk

    ;; clear means nothing is on top of that peg or disk
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; size ordering: (smaller x y) means x is smaller than y
    (smaller ?x - disk ?y - disk)

    ;; step sequencing
    (succ ?s1 - step ?s2 - step)
    (ready ?s - step)
    (done ?s - step)
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?st - step ?d - disk ?from - peg ?to - peg ?next - step)
    :precondition (and
      (ready ?st)
      (on-peg ?d ?from)
      (clear-disk ?d)     ;; d must be the top disk on its peg
      (clear-peg ?to)     ;; destination peg empty
      (succ ?st ?next)
    )
    :effect (and
      ;; placement update
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes clear (since d was top on that peg)
      (clear-peg ?from)
      ;; destination peg now occupied on top
      (not (clear-peg ?to))

      ;; step progression
      (not (ready ?st))
      (ready ?next)
      (done ?st)
    )
  )

  ;; Move a top disk that is directly on a peg to sit on top of another disk
  (:action move-peg-to-disk
    :parameters (?st - step ?d - disk ?from - peg ?to - disk ?next - step)
    :precondition (and
      (ready ?st)
      (on-peg ?d ?from)
      (clear-disk ?d)     ;; d must be top
      (clear-disk ?to)    ;; to must be top (so it can receive d)
      (smaller ?d ?to)    ;; cannot place larger on smaller: d must be smaller than to
      (succ ?st ?next)
    )
    :effect (and
      ;; placement update
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes clear
      (clear-peg ?from)
      ;; destination disk no longer clear
      (not (clear-disk ?to))

      ;; step progression
      (not (ready ?st))
      (ready ?next)
      (done ?st)
    )
  )

  ;; Move a top disk that is on another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?st - step ?d - disk ?from - disk ?to - peg ?next - step)
    :precondition (and
      (ready ?st)
      (on-disk ?d ?from)
      (clear-disk ?d)     ;; d is top
      (clear-peg ?to)     ;; destination peg empty
      (succ ?st ?next)
    )
    :effect (and
      ;; placement update
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that was below becomes clear
      (clear-disk ?from)
      ;; destination peg now occupied on top
      (not (clear-peg ?to))

      ;; step progression
      (not (ready ?st))
      (ready ?next)
      (done ?st)
    )
  )

  ;; Move a top disk that is on another disk to sit on top of another disk
  (:action move-disk-to-disk
    :parameters (?st - step ?d - disk ?from - disk ?to - disk ?next - step)
    :precondition (and
      (ready ?st)
      (on-disk ?d ?from)
      (clear-disk ?d)     ;; d is top
      (clear-disk ?to)    ;; to is top (so it can receive d)
      (smaller ?d ?to)    ;; maintain size ordering
      (succ ?st ?next)
    )
    :effect (and
      ;; placement update
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; the disk that was below becomes clear
      (clear-disk ?from)
      ;; destination disk no longer clear
      (not (clear-disk ?to))

      ;; step progression
      (not (ready ?st))
      (ready ?next)
      (done ?st)
    )
  )
)