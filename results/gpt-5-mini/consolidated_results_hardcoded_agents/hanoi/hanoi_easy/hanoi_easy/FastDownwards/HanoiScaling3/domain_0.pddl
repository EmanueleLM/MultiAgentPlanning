(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    ;; location predicates
    (on-disk ?d - disk ?p - disk)    ;; disk ?d is directly on top of disk ?p
    (on-peg  ?d - disk ?p - peg)     ;; disk ?d is directly on peg ?p

    ;; top-of-place predicates
    (clear-disk ?d - disk)           ;; no disk on top of ?d (i.e., ?d is a top disk if it's on something)
    (clear-peg  ?p - peg)            ;; peg ?p has no disks on it (empty peg)

    ;; size ordering (smaller relation)
    (smaller ?d1 - disk ?d2 - disk)

    ;; agent presence (keeps agent distinctions explicit)
    (available ?a - agent)
  )

  ;; Move a top disk that sits on a disk, onto an empty peg
  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?from - disk ?peg - peg)
    :precondition (and
      (available ?a)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?peg)
    )
    :effect (and
      ;; remove old placement
      (not (on-disk ?d ?from))
      ;; new placement
      (on-peg ?d ?peg)
      ;; the place we removed from becomes clear
      (clear-disk ?from)
      ;; the destination peg is no longer clear
      (not (clear-peg ?peg))
      ;; the moved disk remains clear (nothing placed on it)
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that sits on a disk, onto another disk (must be larger)
  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (available ?a)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that sits on a peg, onto an empty peg
  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?from - peg ?peg - peg)
    :precondition (and
      (available ?a)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?peg)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?peg)
      (clear-peg ?from)
      (not (clear-peg ?peg))
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that sits on a peg, onto another disk (must be larger)
  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (available ?a)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
    )
  )
)