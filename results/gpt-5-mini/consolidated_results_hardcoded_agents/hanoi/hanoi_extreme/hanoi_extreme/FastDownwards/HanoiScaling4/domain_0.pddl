(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types place peg disk)
  ;; pegs and disks are kinds of places
  (:types peg disk - place)

  (:predicates
    ;; direct support relation: disk is directly on a place (peg or another disk)
    (above ?d - disk ?p - place)
    ;; ?d is the top-most disk on peg ?p
    (top ?d - disk ?p - peg)
    ;; peg is empty (no disks on it)
    (peg-empty ?p - peg)
    ;; static size order: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk that is directly on a disk (i.e., its immediate support is a disk)
  ;; to an empty peg.
  (:action move_disk_from_disk_to_empty_peg
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (above ?d ?below)         ;; d is directly on disk 'below'
      (above ?below ?from)      ;; that disk 'below' is directly on the source peg
      (peg-empty ?to)
    )
    :effect (and
      ;; remove old support
      (not (above ?d ?below))
      ;; d is now directly on peg ?to
      (above ?d ?to)

      ;; update top facts: d is no longer top on ?from, becomes top on ?to
      (not (top ?d ?from))
      (top ?d ?to)

      ;; destination is no longer empty
      (not (peg-empty ?to))

      ;; the disk that was below becomes the new top on source peg
      (top ?below ?from)
    )
  )

  ;; Move a top disk that is directly on a disk to be placed on top of another top disk.
  (:action move_disk_from_disk_to_disk
    :parameters (?d - disk ?below - disk ?from - peg ?t - disk ?to - peg)
    :precondition (and
      (top ?d ?from)
      (above ?d ?below)         ;; d is directly on disk 'below'
      (above ?below ?from)      ;; that disk 'below' is directly on the source peg
      (top ?t ?to)              ;; destination peg has top disk t
      (smaller ?d ?t)           ;; size constraint: d must be smaller than t
    )
    :effect (and
      ;; update support
      (not (above ?d ?below))
      (above ?d ?t)

      ;; update top facts: d moves from being top on ?from to top on ?to
      (not (top ?d ?from))
      (top ?d ?to)

      ;; destination's previous top t is no longer top on ?to
      (not (top ?t ?to))

      ;; the disk that was below becomes the new top on source peg
      (top ?below ?from)

      ;; ensure destination peg is marked non-empty (may already be non-empty)
      (not (peg-empty ?to))
    )
  )

  ;; Move a top disk that is directly on the source peg to an empty peg.
  (:action move_disk_from_peg_to_empty_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (above ?d ?from)     ;; d is directly on the source peg
      (peg-empty ?to)
    )
    :effect (and
      ;; update support
      (not (above ?d ?from))
      (above ?d ?to)

      ;; update top facts
      (not (top ?d ?from))
      (top ?d ?to)

      ;; destination no longer empty
      (not (peg-empty ?to))

      ;; source peg becomes empty after removing its only/lowest disk
      (peg-empty ?from)
    )
  )

  ;; Move a top disk that is directly on the source peg to a peg whose top is a disk.
  (:action move_disk_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?t - disk ?to - peg)
    :precondition (and
      (top ?d ?from)
      (above ?d ?from)     ;; d is directly on the source peg
      (top ?t ?to)         ;; destination peg has top disk t
      (smaller ?d ?t)      ;; ensure size constraint
    )
    :effect (and
      ;; update support
      (not (above ?d ?from))
      (above ?d ?t)

      ;; update top facts
      (not (top ?d ?from))
      (top ?d ?to)

      ;; destination's old top t no longer top
      (not (top ?t ?to))

      ;; source peg becomes empty after removing its bottom/top disk
      (peg-empty ?from)

      ;; ensure destination is non-empty (may already be so)
      (not (peg-empty ?to))
    )
  )
)