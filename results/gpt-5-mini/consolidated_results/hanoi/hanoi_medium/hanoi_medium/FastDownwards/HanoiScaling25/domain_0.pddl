(define (domain tower-of-hanoi-5)
  ;; Orchestrator-integrated PDDL domain for a 5-disk Tower of Hanoi instance.
  ;; Auditor resolution (conservative): to keep the domain in pure STRIPS-style
  ;; without conditional effects or quantifiers, we introduce one immovable
  ;; "base" disk per peg (baseA, baseB, baseC). These base disks are modeling
  ;; sentinels that always sit at the bottom of each peg and are larger than
  ;; all real disks. This ensures every movable disk has a well-defined disk
  ;; "below" at all times, allowing non-conditional move effects to deterministically
  ;; update the peg tops. The bases are marked immovable so plans cannot move them.
  ;; These modelling choices are documented here per the instruction to record
  ;; conservative resolutions in comments.
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (disk ?d - disk)
    (peg ?p - peg)

    ;; Direct containment relations:
    (on-disk ?upper - disk ?lower - disk)   ; upper is directly on lower (lower may be a base)
    (on-peg  ?b - disk ?p - peg)            ; base disks are directly on a peg

    ;; top-of-peg relation: which disk is currently the top (movable) disk on a peg
    (top ?p - peg ?d - disk)

    ;; size ordering: smaller ?a ?b means disk a is strictly smaller than disk b
    (smaller ?a - disk ?b - disk)

    ;; immovable marker for base disks so actions cannot move them
    (immovable ?d - disk)
  )

  ;; Move the disk ?d that is the current top on peg ?from onto the current top disk ?topTo of peg ?to.
  ;; The disk directly below ?d on the source peg is provided as ?belowFrom (always exists because of base disks).
  ;; Preconditions enforce that ?d is top on the source, ?topTo is top on the destination, and size ordering.
  ;; Effects update top pointers and the direct on-disk relation for the moved disk.
  (:action move-top
    :parameters (?d - disk ?belowFrom - disk ?from - peg ?topTo - disk ?to - peg)
    :precondition (and
      (disk ?d) (disk ?belowFrom) (peg ?from) (peg ?to) (disk ?topTo)
      ;; source and dest top relations, and the on-disk relation tying ?d to its below disk
      (top ?from ?d)
      (on-disk ?d ?belowFrom)
      (top ?to ?topTo)
      ;; cannot move immovable/base disks
      (not (immovable ?d))
      ;; disk size constraint: moved disk must be smaller than the disk currently at top of destination
      (smaller ?d ?topTo)
    )
    :effect (and
      ;; update tops: source's top becomes the disk below; destination's top becomes the moved disk
      (not (top ?from ?d))
      (top ?from ?belowFrom)
      (not (top ?to ?topTo))
      (top ?to ?d)

      ;; update direct supports: moved disk no longer on its old lower disk, now on the previous top of dest
      (not (on-disk ?d ?belowFrom))
      (on-disk ?d ?topTo)
    )
  )
)