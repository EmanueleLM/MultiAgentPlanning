(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (cur ?s - step)
    (succ ?s - step ?t - step)

    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?under - disk)

    (clear ?d - disk)
    (empty ?p - peg)

    (smaller ?a - disk ?b - disk)

    (diff-peg ?p1 - peg ?p2 - peg)
    (diff-disk ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk that is immediately on a peg onto an empty peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
      (diff-peg ?from ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (empty ?to))
      (empty ?from)

      (not (cur ?s))
      (cur ?t)
    )
  )

  ;; Move a top disk that is immediately on a peg onto another disk (target must be clear and larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?tgt - disk ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (diff-disk ?d ?tgt)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)

      (empty ?from)

      (not (clear ?tgt))

      (not (cur ?s))
      (cur ?t)
    )
  )

  ;; Move a top disk that is on top of another disk onto an empty peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?under - disk ?to - peg ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-disk ?d ?under)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?to)

      (not (empty ?to))
      (clear ?under)

      (not (cur ?s))
      (cur ?t)
    )
  )

  ;; Move a top disk that is on top of another disk onto another disk (target must be clear and larger).
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?tgt - disk ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-disk ?d ?under)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (diff-disk ?under ?tgt)
      (diff-disk ?d ?tgt)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?tgt)

      (clear ?under)
      (not (clear ?tgt))

      (not (cur ?s))
      (cur ?t)
    )
  )
)