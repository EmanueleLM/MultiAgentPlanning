(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?s - disk)
    (on-peg  ?d - disk ?p - peg)

    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)

    (smaller ?d1 - disk ?d2 - disk)

    (succ ?t1 - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-peg ?from)

      ;; moved disk remains topmost
      (clear-disk ?d)

      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-disk ?from)

      (clear-disk ?d)

      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on a peg onto a top disk (enforce size ordering).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (not (clear-disk ?to))
      (clear-peg ?from)

      (clear-disk ?d)

      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on another disk onto another top disk (enforce size ordering).
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      (not (clear-disk ?to))
      (clear-disk ?from)

      (clear-disk ?d)

      (not (current ?t))
      (current ?t2)
    )
  )
)