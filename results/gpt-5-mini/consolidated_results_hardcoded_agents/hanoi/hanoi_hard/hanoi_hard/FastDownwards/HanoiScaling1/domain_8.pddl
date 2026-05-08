(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?s - disk)
    (on-peg  ?d - disk ?p - peg)
    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
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

  ;; Move a top disk that is directly on a peg onto a clear disk
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
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
      (clear-disk ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg
  (:action move-disk-to-peg-empty
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
      (clear-disk ?d)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is directly on another disk onto a clear disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
      (clear-disk ?d)
      (not (current ?s))
      (current ?s2)
    )
  )
)