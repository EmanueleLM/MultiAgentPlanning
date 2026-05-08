(define (domain hanoi_ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types position stage disk peg)

  ;; Treat disks and pegs as positions (they are declared as position-compatible
  ;; by using them in predicates typed as 'position' below).
  (:predicates
    (on ?d - disk ?p - position)      ;; immediate supporting position: a peg or another disk
    (top ?d - disk)                   ;; true iff no disk sits on ?d
    (empty ?p - peg)                  ;; true iff no disk currently sits on the peg
    (smaller ?small - disk ?big - disk) ;; size ordering relation: small < big
    (current-stage ?s - stage)        ;; current discrete stage/timepoint
    (next ?s1 - stage ?s2 - stage)    ;; successor relation on stages
  )

  ;; Move when the disk to move is directly on a peg and the peg becomes empty after move.
  (:action move-from-peg-only-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)            ;; disk is directly on the peg (so it is the only disk whose support is this peg)
      (top ?d)                 ;; disk has nothing on top of it (is movable)
      (empty ?to)              ;; destination peg is empty
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; move the disk from the source peg to the destination peg
      (not (on ?d ?from))
      (on ?d ?to)

      ;; peg occupancy updates: source peg becomes empty, destination peg becomes non-empty
      (empty ?from)
      (not (empty ?to))

      ;; top status: moving a top disk preserves it being top after the move (no change required)
    )
  )

  ;; Move when the disk to move is directly on a peg and the destination peg has a top disk.
  (:action move-from-peg-only-to-disk
    :parameters (?d - disk ?from - peg ?t - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)            ;; disk is directly on source peg
      (top ?d)
      (top ?t)                 ;; t is the top disk on destination peg
      (on ?t ?to)              ;; t sits on destination peg (so destination peg non-empty)
      (smaller ?d ?t)          ;; size constraint: cannot place larger on smaller
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?t)

      ;; update top facts: t is no longer top, d becomes top
      (not (top ?t))
      (top ?d)

      ;; source peg becomes empty (d was directly on the peg)
      (empty ?from)

      ;; destination peg remains non-empty (no explicit change needed other than top updates)
    )
  )

  ;; Move when the disk to move is on top of another disk (i.e., its support is a disk),
  ;; and the destination peg is empty.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?under - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?under)           ;; d sits on another disk
      (top ?d)                 ;; d has nothing on top
      (empty ?to)              ;; destination peg is empty
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate d from being on a disk to being on peg
      (not (on ?d ?under))
      (on ?d ?to)

      ;; the disk that was under becomes top (d removed)
      (top ?under)

      ;; destination peg becomes non-empty
      (not (empty ?to))
    )
  )

  ;; Move when the disk to move is on top of another disk and the destination peg has a top disk.
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?under - disk ?t - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?under)           ;; d sits on under
      (top ?d)
      (top ?t)                 ;; t is top disk on destination peg
      (on ?t ?to)              ;; t sits on destination peg
      (smaller ?d ?t)          ;; size ordering
      (current-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; stage progression
      (not (current-stage ?s))
      (current-stage ?s2)

      ;; relocate d to sit on t
      (not (on ?d ?under))
      (on ?d ?t)

      ;; update top facts: under becomes top, t is no longer top, d becomes top
      (top ?under)
      (not (top ?t))
      (top ?d)
    )
  )
)