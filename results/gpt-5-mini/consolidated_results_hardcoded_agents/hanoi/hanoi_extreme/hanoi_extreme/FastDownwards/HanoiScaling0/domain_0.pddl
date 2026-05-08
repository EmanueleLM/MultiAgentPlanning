(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk-on-disk and disk-on-peg represent the direct "on" relation
    (on-disk ?d - disk ?p - disk)
    (on-peg  ?d - disk ?p - peg)

    ;; clear flags for disks and pegs: true when there is no disk immediately on top
    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)

    ;; static size ordering: (smaller X Y) means disk X is strictly smaller than disk Y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a top disk from one disk onto another (disk->disk). Requires size ordering.
  (:action move-disk-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      ;; after removing ?d, its former support becomes clear
      (clear-disk ?from)
      ;; after placing ?d onto ?to, ?to is no longer clear
      (not (clear-disk ?to))
    )
  )

  ;; Move a top disk from one disk onto a peg (disk->peg).
  (:action move-disk-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk from a peg onto another disk (peg->disk). Requires size ordering.
  (:action move-disk-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
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
    )
  )

  ;; Move a top disk from a peg onto another peg (peg->peg).
  (:action move-disk-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )
)