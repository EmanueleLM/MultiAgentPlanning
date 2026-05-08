(define (domain hanoi_three_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    ;; top disk on a peg
    (top-peg ?p - peg ?d - disk)
    ;; disk ?d is directly on top of disk ?beneath
    (top-disk ?d - disk ?beneath - disk)
    ;; peg is empty (has no top disk)
    (empty-peg ?p - peg)
    ;; disk has no child beneath it (it is bottom-most on its support)
    (no-child ?d - disk)
    ;; permission: agent may move disk
    (permitted ?a - agent ?d - disk)
    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk that has a disk directly beneath it, onto an empty peg.
  (:action move-with-below-to-empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?beneath - disk)
    :precondition (and
      (top-peg ?from ?d)
      (top-disk ?d ?beneath)
      (empty-peg ?to)
      (permitted ?a ?d)
    )
    :effect (and
      (not (top-peg ?from ?d))
      (not (top-disk ?d ?beneath))
      (top-peg ?from ?beneath)
      (top-peg ?to ?d)
      (not (empty-peg ?to))
      (no-child ?d)
    )
  )

  ;; Move a top disk that has a disk directly beneath it, onto another disk (non-empty peg).
  (:action move-with-below-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?beneath - disk ?dstTop - disk)
    :precondition (and
      (top-peg ?from ?d)
      (top-disk ?d ?beneath)
      (top-peg ?to ?dstTop)
      (smaller ?d ?dstTop)
      (permitted ?a ?d)
    )
    :effect (and
      (not (top-peg ?from ?d))
      (not (top-disk ?d ?beneath))
      (top-peg ?from ?beneath)
      (not (top-peg ?to ?dstTop))
      (top-peg ?to ?d)
      (top-disk ?d ?dstTop)
      (not (no-child ?d))
    )
  )

  ;; Move a top disk that has no disk beneath it (it was the only disk on its support), to an empty peg.
  (:action move-no-below-to-empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top-peg ?from ?d)
      (no-child ?d)
      (empty-peg ?to)
      (permitted ?a ?d)
    )
    :effect (and
      (not (top-peg ?from ?d))
      (empty-peg ?from)
      (top-peg ?to ?d)
      (not (empty-peg ?to))
      ;; no-child ?d remains true
    )
  )

  ;; Move a top disk that has no disk beneath it, onto another disk (non-empty peg).
  (:action move-no-below-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?dstTop - disk)
    :precondition (and
      (top-peg ?from ?d)
      (no-child ?d)
      (top-peg ?to ?dstTop)
      (smaller ?d ?dstTop)
      (permitted ?a ?d)
    )
    :effect (and
      (not (top-peg ?from ?d))
      (empty-peg ?from)
      (not (top-peg ?to ?dstTop))
      (top-peg ?to ?d)
      (top-disk ?d ?dstTop)
      (not (no-child ?d))
    )
  )
)