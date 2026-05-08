(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk)

  (:predicates
    ;; immediate support relations
    (on-peg ?d - disk ?p - peg)    ;; disk ?d directly on peg ?p
    (on-disk ?d - disk ?dd - disk) ;; disk ?d directly on disk ?dd

    ;; top-most disk on a peg
    (top ?d - disk ?p - peg)

    ;; peg currently empty (no disks)
    (empty ?p - peg)

    ;; static size order: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk that is the top disk on a peg to an empty peg.
  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
    )
    :effect (and
      ;; support updates
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; top updates
      (not (top ?d ?from))
      (top ?d ?to)

      ;; peg occupancy updates
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; Move a disk that is the top disk on a peg to a peg whose top is a disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      ;; support updates
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)

      ;; top updates
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))

      ;; peg occupancy updates
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; Move a disk that is the top disk on another disk to an empty peg.
  (:action move-disk-to-peg-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
    )
    :effect (and
      ;; support updates
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; top updates
      (not (top ?d ?from))
      (top ?d ?to)

      ;; the disk that was below becomes the new top on source peg
      (top ?below ?from)

      ;; peg occupancy updates
      (not (empty ?to))
    )
  )

  ;; Move a disk that is the top disk on another disk to be placed on top of another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?t - disk ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      ;; support updates
      (not (on-disk ?d ?below))
      (on-disk ?d ?t)

      ;; top updates
      (not (top ?d ?from))
      (top ?d ?to)
      (not (top ?t ?to))

      ;; the disk that was below becomes the new top on source peg
      (top ?below ?from)

      ;; ensure destination peg marked non-empty
      (not (empty ?to))
    )
  )
)