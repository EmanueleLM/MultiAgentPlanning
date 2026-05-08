(define (domain hanoi-6disk)
  ; Tower of Hanoi domain for 6 disks (FastDownwards-compatible).
  ; Decisions / resolutions (documented as comments):
  ; - Pegs are named pegA, pegB, pegC. Initial stack is all disks on pegA (classic setup).
  ; - Disks are disk1 .. disk6 with disk1 the smallest and disk6 the largest.
  ; - We avoid a mixed "support" type to keep typing simple and solver-friendly:
  ;   there are separate predicates for a disk being on a peg (on-peg) and on another disk (on-disk).
  ; - Top-only moves are enforced by requiring the moved disk to be clear (clear-disk).
  ; - The never-larger-on-smaller invariant is enforced by permitting moves onto a disk only when
  ;   the moved disk is strictly smaller than the target disk via the static predicate (smaller ?d ?t).
  ; - To avoid disjunctive preconditions we provide four concrete move actions to cover all source/target type combinations.
  ; - All natural-language preferences (e.g., "must not place larger on smaller") are encoded as hard constraints.
  ; - No bookkeeping/penalty actions or post-hoc fixes are provided.
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ; disk on a peg
    (on-peg ?d - disk ?p - peg)
    ; disk on another disk
    (on-disk ?d - disk ?support - disk)
    ; support is clear (no disk on it)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)
    ; static size ordering: smaller ?a ?b means ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)
  )

  ; Move a top disk from one peg onto another peg (target peg must be clear).
  (:action mover_move_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      ; the source peg becomes clear (we moved the top disk)
      (clear-peg ?from)
      ; the destination peg is no longer clear
      (not (clear-peg ?to))
      ; moved disk remains clear (it has nothing on top)
      (clear-disk ?d)
    )
  )

  ; Move a top disk from a peg onto a disk (target disk must be clear; size constraint enforced).
  (:action mover_move_peg_to_disk
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
      ; the source peg becomes clear after removing the top disk
      (clear-peg ?from)
      ; the target disk is no longer clear (we placed ?d on it)
      (not (clear-disk ?to))
      ; moved disk remains clear (nothing on top of it)
      (clear-disk ?d)
    )
  )

  ; Move a top disk from a disk onto a peg.
  (:action mover_move_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      ; the support disk becomes clear after removing the top disk
      (clear-disk ?from)
      ; the destination peg is no longer clear
      (not (clear-peg ?to))
      ; moved disk remains clear
      (clear-disk ?d)
    )
  )

  ; Move a top disk from a disk onto another disk (both source/target disks must be clear; size constraint enforced).
  (:action mover_move_disk_to_disk
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
      ; source disk becomes clear after removal
      (clear-disk ?from)
      ; target disk no longer clear
      (not (clear-disk ?to))
      ; moved disk remains clear
      (clear-disk ?d)
    )
  )
)