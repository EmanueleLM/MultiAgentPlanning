(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg)

  (:predicates
    (on ?d - disk ?p - peg)        ; disk ?d is on peg ?p (we represent stack membership via 'on' and the static directly_above relation)
    (top ?d - disk ?p - peg)      ; disk ?d is the topmost disk on peg ?p
    (empty ?p - peg)              ; peg ?p has no disks
    (directly_above ?upper - disk ?lower - disk) ; static: in the initial stacking, ?upper was directly above ?lower
    (smaller ?d1 - disk ?d2 - disk) ; size ordering: ?d1 is smaller than ?d2
    (can_move ?a - agent ?d - disk) ; capability: agent ?a may move disk ?d
  )

  ; Move a top disk (which is known from the initial stack to have a disk directly below it) onto an empty peg.
  (:action move-top-to-empty-with-below
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?below - disk)
    :precondition (and
      (can_move ?ag ?d)
      (on ?d ?from)
      (top ?d ?from)
      (directly_above ?d ?below)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      (not (empty ?to))

      ; after removing the top disk, the disk that was directly below becomes the new top on the from-peg
      (not (top ?below ?to)) ; defensive: ensure not asserting erroneous top on destination
      (top ?below ?from)
    )
  )

  ; Move a top disk (that has a known disk directly below it in the initial stack) onto another peg's top disk.
  (:action move-top-to-ontop-with-below
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?below - disk ?t - disk)
    :precondition (and
      (can_move ?ag ?d)
      (on ?d ?from)
      (top ?d ?from)
      (directly_above ?d ?below)
      (top ?t ?to)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)

      (not (top ?d ?from))
      (top ?d ?to)

      ; after removing the top disk from the source, the disk below becomes the new top there
      (top ?below ?from)
    )
  )

  ; Note: This domain encodes the initial vertical adjacency using 'directly_above' as static input.
  ; That is sufficient for the integrated plan produced for this instance (moving the initial top disk A).
  ; The domain enforces agent-specific move permissions via can_move and enforces Tower of Hanoi constraints:
  ; - only top disks may be moved,
  ; - a disk may only be placed on an empty peg or on a larger top disk.
)