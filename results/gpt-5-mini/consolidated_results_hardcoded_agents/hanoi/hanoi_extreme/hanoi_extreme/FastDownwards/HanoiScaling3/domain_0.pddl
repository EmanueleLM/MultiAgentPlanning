(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    ;; disk placed directly on a place (disk or peg)
    (on ?d - disk ?p - place)
    ;; top-of-place is empty (true for pegs that have no top disk, and for disks that have no disk on them)
    (clear ?p - place)
    ;; static size ordering: smaller ?x ?y means disk ?x is strictly smaller than disk ?y
    (smaller ?x - disk ?y - disk)
  )

  ;; Move a single disk onto an empty peg.
  ;; Preconditions enforce single-disk moves, top-disk-only moves, and forbid moving a disk onto the place it already occupies.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and
      (on ?d ?from)      ;; disk is currently on ?from
      (clear ?d)         ;; disk is top (no disk on it)
      (clear ?to)        ;; destination peg has empty top
      (not (on ?d ?to))  ;; destination is not the same place the disk already sits on
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ;; after removing top disk, the support becomes clear
      (not (clear ?to))  ;; destination is no longer clear after placing the disk
    )
  )

  ;; Move a single disk onto the top of another disk (must be strictly smaller).
  (:action move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and
      (on ?d ?from)        ;; disk is currently on ?from
      (clear ?d)           ;; disk is top (no disk on it)
      (clear ?to)          ;; destination disk is top (no disk on it)
      (smaller ?d ?to)     ;; cannot place larger disk on smaller disk
      (not (on ?d ?to))    ;; destination is not the same place the disk already sits on
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ;; after removing top disk, the support becomes clear
      (not (clear ?to))    ;; destination disk is no longer clear after placing the disk
    )
  )
)