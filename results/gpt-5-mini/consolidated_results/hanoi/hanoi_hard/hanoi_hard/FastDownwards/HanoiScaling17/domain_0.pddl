(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ; disk placement relations
    (on-peg ?d - disk ?p - peg)        ; disk ?d directly on peg ?p
    (on-disk ?d - disk ?below - disk) ; disk ?d directly on disk ?below

    ; which disk is the top disk on a peg
    (top ?d - disk ?p - peg)

    ; peg emptiness
    (empty ?p - peg)

    ; size ordering: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; -------------------------
  ; Human agent move actions
  ; Four cases to avoid disjunctions:
  ;  1) moving a disk that is directly on a peg, onto an empty peg
  ;  2) moving a disk that is directly on a peg, onto another disk
  ;  3) moving a disk that is directly on another disk, onto an empty peg
  ;  4) moving a disk that is directly on another disk, onto another disk
  ; Each action enforces the size invariant by requiring (smaller ...) when placing onto a disk.
  ; -------------------------

  (:action human-move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
    )
    :effect (and
      ; remove old placement
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      ; new placement on target peg, update tops/emptiness
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action human-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?below ?to)
      (smaller ?d ?below)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      ; place onto disk ?below which was formerly top on ?to
      (on-disk ?d ?below)
      (top ?d ?to)
      (not (top ?below ?to))
      ; source peg becomes empty (because moved disk was directly on peg)
      (empty ?from)
    )
  )

  (:action human-move-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
    )
    :effect (and
      ; remove old placement relation
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      ; the disk below becomes the new top on the source peg
      (top ?below ?from)
      ; place moved disk on target peg
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  (:action human-move-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?above - disk)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?above ?to)
      (smaller ?d ?above)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      ; below disk becomes top on source peg
      (top ?below ?from)
      ; place moved disk onto above (which was top on ?to)
      (on-disk ?d ?above)
      (top ?d ?to)
      (not (top ?above ?to))
    )
  )

  ; -------------------------
  ; Simulator agent move actions (conceptually distinct names)
  ; Same four cases mirrored for simulator actor
  ; -------------------------

  (:action simulator-move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  (:action simulator-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (top ?d ?from)
      (on-peg ?d ?from)
      (top ?below ?to)
      (smaller ?d ?below)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (not (top ?d ?from))
      (on-disk ?d ?below)
      (top ?d ?to)
      (not (top ?below ?to))
      (empty ?from)
    )
  )

  (:action simulator-move-disk-to-empty
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)
      (on-peg ?d ?to)
      (top ?d ?to)
      (not (empty ?to))
    )
  )

  (:action simulator-move-disk-to-disk
    :parameters (?d - disk ?from - peg ?below - disk ?to - peg ?above - disk)
    :precondition (and
      (top ?d ?from)
      (on-disk ?d ?below)
      (top ?above ?to)
      (smaller ?d ?above)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (not (top ?d ?from))
      (top ?below ?from)
      (on-disk ?d ?above)
      (top ?d ?to)
      (not (top ?above ?to))
    )
  )

)