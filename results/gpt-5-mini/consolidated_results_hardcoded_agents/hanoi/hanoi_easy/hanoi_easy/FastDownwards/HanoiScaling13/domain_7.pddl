(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk step)

  (:predicates
    ;; disk placement
    (on-peg ?d - disk ?p - peg)      ; disk is directly on a peg (bottom)
    (on-disk ?d - disk ?p - disk)    ; disk is directly on another disk

    ;; clearance: true iff nothing is on top of the peg/disk
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; size ordering: (smaller a b) means a is strictly smaller than b
    (smaller ?a - disk ?b - disk)

    ;; step sequencing and control
    (current-step ?s - step)
    (step-successor ?s1 - step ?s2 - step)
    (last-step ?s - step)

    ;; required move specification for each step (either from a peg or from a disk,
    ;; and either to a peg or to a disk)
    (required-disk ?s - step ?d - disk)
    (required-from-peg ?s - step ?p - peg)
    (required-from-disk ?s - step ?d - disk)
    (required-to-peg ?s - step ?p - peg)
    (required-to-disk ?s - step ?d - disk)

    ;; helper predicates to require distinctness where PDDL equality is not used
    (distinct-pp ?p1 - peg ?p2 - peg)
    (distinct-pd ?p - peg ?d - disk)
    (distinct-dp ?d - disk ?p - peg)
    (distinct-dd ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk that is directly on a peg to an empty peg (intermediate step)
  (:action move_peg_to_peg_step
    :parameters (?s - step ?snext - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from-peg ?s ?from)
      (required-to-peg ?s ?to)

      ;; disk must be directly on the source peg and must be top (no disk on it)
      (on-peg ?d ?from)
      (clear-disk ?d)

      ;; destination peg must be empty (so placing on-peg is placing on an empty peg)
      (clear-peg ?to)

      ;; ensure distinctness of pegs
      (distinct-pp ?from ?to)
    )
    :effect (and
      ;; relocate the disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; after removing this disk from the source peg, the source peg becomes clear
      (clear-peg ?from)

      ;; destination peg is now not clear (it has this disk)
      (not (clear-peg ?to))

      ;; moved disk remains clear (nothing on top of it)
      (clear-disk ?d)

      ;; advance the step pointer
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move bottom disk from a peg to another peg when this is the last step (no next step)
  (:action move_peg_to_peg_last
    :parameters (?s - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s)
      (last-step ?s)
      (required-disk ?s ?d)
      (required-from-peg ?s ?from)
      (required-to-peg ?s ?to)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (distinct-pp ?from ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (clear-peg ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
      (not (current-step ?s))
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg (intermediate step)
  (:action move_disk_to_peg_step
    :parameters (?s - step ?snext - step ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from-disk ?s ?from)
      (required-to-peg ?s ?to)

      ;; disk must be directly on the source disk and be top
      (on-disk ?d ?from)
      (clear-disk ?d)

      ;; destination peg must be empty
      (clear-peg ?to)

      ;; ensure source disk and destination peg are distinct identifiers
      (distinct-dp ?from ?to)
    )
    :effect (and
      ;; remove disk from being on the source disk, place it on destination peg
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the disk that used to support ?d becomes clear (no disk on it)
      (clear-disk ?from)

      ;; destination peg no longer clear
      (not (clear-peg ?to))

      ;; moved disk remains clear
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a disk that is directly on another disk to an empty peg as the final step
  (:action move_disk_to_peg_last
    :parameters (?s - step ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (current-step ?s)
      (last-step ?s)
      (required-disk ?s ?d)
      (required-from-disk ?s ?from)
      (required-to-peg ?s ?to)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (distinct-dp ?from ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (clear-disk ?from)
      (not (clear-peg ?to))
      (clear-disk ?d)
      (not (current-step ?s))
    )
  )

  ;; Move a disk that is directly on a peg to sit on top of another disk (intermediate step)
  (:action move_peg_to_disk_step
    :parameters (?s - step ?snext - step ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from-peg ?s ?from)
      (required-to-disk ?s ?to)

      ;; disk is bottom on a peg and is clear (no disk on it)
      (on-peg ?d ?from)
      (clear-disk ?d)

      ;; destination disk must be clear (we place on top of it) and larger
      (clear-disk ?to)
      (smaller ?d ?to)

      (distinct-pd ?from ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes clear after removing its bottom/top disk
      (clear-peg ?from)

      ;; destination disk is no longer clear
      (not (clear-disk ?to))

      ;; moved disk remains clear
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a disk that is directly on a peg to sit on top of another disk as last step
  (:action move_peg_to_disk_last
    :parameters (?s - step ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (current-step ?s)
      (last-step ?s)
      (required-disk ?s ?d)
      (required-from-peg ?s ?from)
      (required-to-disk ?s ?to)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (distinct-pd ?from ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
      (not (current-step ?s))
    )
  )

  ;; Move a disk that is on another disk to a different disk (intermediate step)
  (:action move_disk_to_disk_step
    :parameters (?s - step ?snext - step ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from-disk ?s ?from)
      (required-to-disk ?s ?to)

      ;; disk to move must be directly on the source disk and must be top
      (on-disk ?d ?from)
      (clear-disk ?d)

      ;; destination disk must be clear and larger
      (clear-disk ?to)
      (smaller ?d ?to)

      (distinct-dd ?from ?to)
    )
    :effect (and
      ;; remove d from the source disk and place it on destination disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; source disk becomes clear
      (clear-disk ?from)

      ;; destination disk no longer clear
      (not (clear-disk ?to))

      ;; moved disk remains clear
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a disk that is on another disk to a different disk as the last step
  (:action move_disk_to_disk_last
    :parameters (?s - step ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (current-step ?s)
      (last-step ?s)
      (required-disk ?s ?d)
      (required-from-disk ?s ?from)
      (required-to-disk ?s ?to)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (distinct-dd ?from ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (clear-disk ?d)
      (not (current-step ?s))
    )
  )
)