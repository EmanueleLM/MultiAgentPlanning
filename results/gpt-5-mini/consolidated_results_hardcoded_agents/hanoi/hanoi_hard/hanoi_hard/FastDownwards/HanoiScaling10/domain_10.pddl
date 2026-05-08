(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; location relations: disk on disk vs disk on peg
    (on-disk ?d - disk ?p - disk)
    (on-peg  ?d - disk ?p - peg)

    ;; top-of-stack (no disk on top)
    (clear-d ?d - disk)
    (clear-p ?p - peg)

    ;; size ordering: ?d1 strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; temporal stages and current marker
    (succ ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; move a top disk that sits on a disk onto another disk
  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-d ?d)
      (clear-d ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk  ?d ?to)
      (clear-d ?from)
      (not (clear-d ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; move a top disk that sits on a disk onto an empty peg
  (:action move-disk-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-d ?d)
      (clear-p ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg  ?d ?to)
      (clear-d ?from)
      (not (clear-p ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; move a top disk that sits on a peg onto another disk
  (:action move-disk-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-d ?d)
      (clear-d ?to)
      (smaller ?d ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-p ?from)
      (not (clear-d ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; move a top disk that sits on a peg onto an empty peg
  (:action move-disk-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-d ?d)
      (clear-p ?to)
      (current ?s)
      (succ ?s ?s2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg  ?d ?to)
      (clear-p ?from)
      (not (clear-p ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)