(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; immediate support relations: ?d is directly on top of disk ?below
    (on-disk ?d - disk ?below - disk)

    ;; bottom-of-peg relation: ?d is the bottom disk currently on peg ?p
    (on-peg  ?d - disk ?p - peg)

    ;; current top disk of a peg
    (top ?d - disk ?p - peg)

    ;; peg emptiness
    (empty ?p - peg)

    ;; static size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; forbid no-op moves by requiring distinct pegs
    (different ?p1 - peg ?p2 - peg)
  )

  ;; Move a single bottom disk (only disk on source peg) onto an empty target peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      ;; remove disk from source (source becomes empty)
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      ;; place disk on target (it becomes both bottom and top since target was empty)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; Move a single bottom disk (only disk on source peg) onto the top disk of another peg.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (on-peg ?d ?from)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
      (different ?from ?to)
    )
    :effect (and
      ;; remove disk from source (source becomes empty)
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (empty ?from)

      ;; place disk on target disk
      (not (top ?d2 ?to))
      (on-disk ?d ?d2)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  ;; Move a single top disk that sits on another disk in its source peg onto an empty target peg.
  (:action move-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (empty ?to)
      (different ?from ?to)
    )
    :effect (and
      ;; remove moved disk's relation from source
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ;; the disk below becomes the new top on the source peg
      (top ?below ?from)

      ;; add moved disk to target peg (target was empty so it becomes bottom and top)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))

      ;; source remains non-empty because ?below stays
      (not (empty ?from))
    )
  )

  ;; Move a single top disk that sits on another disk in its source peg onto the top disk of another peg.
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?d2 - disk)
    :precondition (and
      (on-disk ?d ?below)
      (top ?d ?from)
      (top ?d2 ?to)
      (smaller ?d ?d2)
      (different ?from ?to)
    )
    :effect (and
      ;; remove moved disk's relation from source
      (not (on-disk ?d ?below))
      (not (top ?d ?from))

      ;; the disk below becomes the new top on the source peg
      (top ?below ?from)

      ;; update target: previous top no longer top, new on-disk relation and top
      (not (top ?d2 ?to))
      (on-disk ?d ?d2)
      (top ?d ?to)
      (not (empty ?to))

      ;; source remains non-empty because ?below remains
      (not (empty ?from))
    )
  )
)