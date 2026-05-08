(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; Disk placement: a disk is either directly on a peg (bottom-most) or on top of another disk.
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?d2 - disk)

    ;; Top-of-peg relation: which disk is currently top on a peg (only one per peg if not empty).
    (top ?p - peg ?d - disk)

    ;; Peg emptiness.
    (empty ?p - peg)

    ;; Static ordering relation between disks: true iff ?x is strictly smaller than ?y.
    (smaller ?x - disk ?y - disk)

    ;; Discrete time / stage ordering. Exactly one stage is active at any time (enforced by actions).
    (succ ?a - stage ?b - stage)
    (at-stage ?s - stage)

    ;; Helper to require moves between distinct pegs (initialized for all ordered distinct pairs).
    (different ?p1 - peg ?p2 - peg)
  )

  ;; Move schemas: there are four move patterns to cover whether the moved disk is directly on the peg
  ;; (on-peg) or on another disk (on-disk), and whether the destination peg is empty or has a top disk.
  ;; Each move advances the global stage by one successor and enforces exact updates of placement,
  ;; top and empty predicates so disk occupancy is contiguous across stages and only one action occurs per stage.

  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (different ?from ?to)
      ;; disk is top of the source and it is directly on the source peg (i.e., it's the sole disk on that peg)
      (top ?from ?d)
      (on-peg ?d ?from)
      ;; destination peg must be empty
      (empty ?to)
      ;; stage progression
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; relocate disk to destination peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes empty and loses top
      (not (top ?from ?d))
      (empty ?from)

      ;; destination peg now non-empty and top is the moved disk
      (not (empty ?to))
      (top ?to ?d)

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?desttop - disk ?s - stage ?s2 - stage)
    :precondition (and
      (different ?from ?to)
      ;; disk is top of source and directly on the source peg
      (top ?from ?d)
      (on-peg ?d ?from)
      ;; destination peg has a top disk and moved disk must be smaller than that top
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      ;; stage progression
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove from source peg and place on top of desttop
      (not (on-peg ?d ?from))
      (on-disk ?d ?desttop)

      ;; source peg loses top and becomes empty (since disk was sole disk on source)
      (not (top ?from ?d))
      (empty ?from)

      ;; destination peg: previous top is no longer top, moved disk becomes top
      (not (top ?to ?desttop))
      (top ?to ?d)

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move-disk-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?s - stage ?s2 - stage)
    :precondition (and
      (different ?from ?to)
      ;; disk is top of source and sits on another disk (so source will remain non-empty after move)
      (top ?from ?d)
      (on-disk ?d ?below)
      ;; destination peg must be empty
      (empty ?to)
      ;; stage progression
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove the on-disk link from the moved disk and place it on destination peg
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; update source top: the disk below becomes the new top on that peg
      (not (top ?from ?d))
      (top ?from ?below)

      ;; destination now non-empty and moved disk is top
      (not (empty ?to))
      (top ?to ?d)

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move-disk-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?below - disk ?desttop - disk ?s - stage ?s2 - stage)
    :precondition (and
      (different ?from ?to)
      ;; moved disk is top on source and directly on top of another disk on that same source peg
      (top ?from ?d)
      (on-disk ?d ?below)
      ;; destination peg has a top disk and moved disk must be smaller
      (top ?to ?desttop)
      (smaller ?d ?desttop)
      ;; stage progression
      (at-stage ?s)
      (succ ?s ?s2)
    )
    :effect (and
      ;; remove old on-disk relation and create new on-disk relation
      (not (on-disk ?d ?below))
      (on-disk ?d ?desttop)

      ;; source peg top is updated to the disk below
      (not (top ?from ?d))
      (top ?from ?below)

      ;; destination peg top updated
      (not (top ?to ?desttop))
      (top ?to ?d)

      ;; advance stage
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)