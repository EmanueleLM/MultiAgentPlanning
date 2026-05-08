(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg stage
  )

  (:predicates
    ;; structural relations
    (on-peg ?d - disk ?p - peg)        ; disk directly on a peg (bottom-most on that peg)
    (on-disk ?d - disk ?below - disk)  ; disk directly on another disk

    ;; top-of-peg marker
    (top ?d - disk ?p - peg)

    ;; peg empty marker
    (empty ?p - peg)

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; stage/time progression
    (stage ?s - stage)
    (next ?s - stage ?s2 - stage)
    (at-stage ?s - stage)

    ;; distinctness predicate for pegs to forbid no-op moves onto same peg
    (different ?p1 - peg ?p2 - peg)
  )

  ;; Move a disk that is directly on top of another disk onto another disk (different pegs)
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (top ?t ?to)
      (smaller ?d ?t)

      (different ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove d from source stack
      (not (top ?d ?from))
      (not (on-disk ?d ?below))

      ;; adjust source top to the disk below (source remains non-empty)
      (top ?below ?from)

      ;; place d on destination disk t
      (on-disk ?d ?t)
      (top ?d ?to)
      (not (top ?t ?to))

      ;; destination is not empty
      (not (empty ?to))
    )
  )

  ;; Move a disk that is directly on top of another disk onto an empty peg (different pegs)
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)

      (top ?d ?from)
      (on-disk ?d ?below)

      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove d from its current place
      (not (top ?d ?from))
      (not (on-disk ?d ?below))

      ;; below becomes new top of source peg
      (top ?below ?from)

      ;; place d directly on empty peg
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; Move a disk that is directly on a peg onto another disk (different pegs)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (top ?t ?to)
      (smaller ?d ?t)

      (different ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove d from source peg (it was on the peg -> source becomes empty)
      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (empty ?from)

      ;; place d on top of disk t
      (on-disk ?d ?t)
      (top ?d ?to)
      (not (top ?t ?to))

      ;; destination is not empty
      (not (empty ?to))
    )
  )

  ;; Move a disk that is directly on a peg onto an empty peg (different pegs)
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?s2)

      (top ?d ?from)
      (on-peg ?d ?from)

      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)

      ;; remove d from source peg
      (not (top ?d ?from))
      (not (on-peg ?d ?from))
      (empty ?from)

      ;; place d on destination peg
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )
)