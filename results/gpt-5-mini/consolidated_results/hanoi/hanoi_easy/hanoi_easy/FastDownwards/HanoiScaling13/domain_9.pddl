(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk step)

  (:predicates
    ;; direct placement relations:
    (on-peg ?d - disk ?p - peg)      ; disk is directly on a peg (the disk touching the peg)
    (on-disk ?d - disk ?p - disk)    ; disk is directly on another disk

    ;; clearance predicates:
    (clear-peg ?p - peg)             ; peg has no disks
    (clear-disk ?d - disk)           ; no disk is on top of ?d (it is the topmost disk where it sits)

    ;; size ordering: (smaller a b) means a is strictly smaller than b
    (smaller ?a - disk ?b - disk)

    ;; step sequencing and control (explicit discrete stages)
    (current-step ?s - step)
    (step-successor ?s1 - step ?s2 - step)
    (last-step ?s - step)

    ;; required move specification for each step: these are hard constraints in the problem
    (required-disk ?s - step ?d - disk)
    (required-from-peg ?s - step ?p - peg)
    (required-from-disk ?s - step ?d - disk)
    (required-to-peg ?s - step ?p - peg)
    (required-to-disk ?s - step ?d - disk)

    ;; helper distinctness predicates (used to enforce non-equality where needed)
    (distinct-pp ?p1 - peg ?p2 - peg)
    (distinct-pd ?p - peg ?d - disk)
    (distinct-dp ?d - disk ?p - peg)
    (distinct-dd ?d1 - disk ?d2 - disk)
  )

  ;; Move a clear disk that is directly on an empty source peg to an empty destination peg (intermediate step)
  (:action move_peg_to_peg_step
    :parameters (?s - step ?snext - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from-peg ?s ?from)
      (required-to-peg ?s ?to)

      ;; disk must be directly on the source peg and be the topmost disk at that peg
      (on-peg ?d ?from)
      (clear-disk ?d)

      ;; destination peg must be empty (we place onto an empty peg)
      (clear-peg ?to)

      ;; pegs distinct
      (distinct-pp ?from ?to)
    )
    :effect (and
      ;; relocate the disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; source peg becomes empty (clear)
      (clear-peg ?from)

      ;; destination peg no longer clear
      (not (clear-peg ?to))

      ;; moved disk stays clear (topmost)
      (clear-disk ?d)

      ;; advance the explicit step marker
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Final form of the same move when this is the last step (no successor)
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
      ;; terminate the step control (no current-step after final)
      (not (current-step ?s))
    )
  )

  ;; Move a clear disk that is directly on another disk to an empty peg (intermediate step)
  (:action move_disk_to_peg_step
    :parameters (?s - step ?snext - step ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from-disk ?s ?from)
      (required-to-peg ?s ?to)

      ;; moving disk is topmost on its supporting disk
      (on-disk ?d ?from)
      (clear-disk ?d)

      ;; destination peg must be empty
      (clear-peg ?to)

      ;; ensure distinct identifiers (disk vs peg)
      (distinct-dp ?from ?to)
    )
    :effect (and
      ;; detach from supporting disk and place on the empty peg
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; the support disk becomes clear (no disk on it)
      (clear-disk ?from)

      ;; destination peg now occupied
      (not (clear-peg ?to))

      ;; moved disk is topmost
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Final variant of moving from disk to peg as last step
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

  ;; Move a clear disk that is directly on an empty peg to sit on top of another disk (intermediate step)
  (:action move_peg_to_disk_step
    :parameters (?s - step ?snext - step ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from-peg ?s ?from)
      (required-to-disk ?s ?to)

      ;; disk is topmost at its peg
      (on-peg ?d ?from)
      (clear-disk ?d)

      ;; destination disk must be clear (topmost) and larger (we place smaller onto larger)
      (clear-disk ?to)
      (smaller ?d ?to)

      (distinct-pd ?from ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; source peg becomes empty after removing its topmost disk
      (clear-peg ?from)

      ;; destination disk is no longer clear (it now has a disk on top)
      (not (clear-disk ?to))

      ;; moved disk is topmost where it sits
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Final variant of moving from peg to disk
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

  ;; Move a clear disk that is directly on one disk to sit on top of another disk (intermediate step)
  (:action move_disk_to_disk_step
    :parameters (?s - step ?snext - step ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from-disk ?s ?from)
      (required-to-disk ?s ?to)

      ;; moving disk is topmost on its support
      (on-disk ?d ?from)
      (clear-disk ?d)

      ;; destination disk must be clear and larger
      (clear-disk ?to)
      (smaller ?d ?to)

      (distinct-dd ?from ?to)
    )
    :effect (and
      ;; reattach d to the new support disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; old support becomes clear
      (clear-disk ?from)

      ;; new support no longer clear
      (not (clear-disk ?to))

      ;; moved disk now topmost
      (clear-disk ?d)

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Final variant of moving disk-to-disk when last step
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