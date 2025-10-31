(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ;; disk ?d directly on peg ?p
    (on-disk ?d - disk ?b - disk)   ;; disk ?d directly on disk ?b
    (clear ?d - disk)               ;; no disk on top of ?d
    (empty ?p - peg)                ;; no disk directly on peg ?p
    (smaller ?s - disk ?b - disk)   ;; ?s is strictly smaller than ?b
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
      (clear ?d)
    )
  )

  ;; Move a top disk that is directly on a peg onto a clear disk (must be larger)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?b - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?b)
      (smaller ?d ?b)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?b)
      (empty ?from)
      (not (clear ?b))
      (clear ?d)
    )
  )

  ;; Move a top disk that is on another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (empty ?to))
      (clear ?below)
      (clear ?d)
    )
  )

  ;; Move a top disk that is on another disk onto a clear disk (must be larger)
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?b - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?b)
      (smaller ?d ?b)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?b)
      (clear ?below)
      (not (clear ?b))
      (clear ?d)
    )
  )
)