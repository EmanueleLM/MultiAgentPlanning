(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk step)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ; disk is directly on a peg (touching the peg)
    (on-disk ?d - disk ?p - disk)    ; disk is directly on another disk (immediately above)
    (clear-peg ?p - peg)             ; peg has no disks
    (clear-disk ?d - disk)           ; no disk is on top of ?d (it is the topmost disk where it sits)
    (smaller ?a - disk ?b - disk)    ; a is strictly smaller than b
    (current-step ?s - step)
    (step-successor ?s1 - step ?s2 - step)
    (last-step ?s - step)

    ;; required move specification for each step (enforced as hard facts in the problem)
    (required-disk ?s - step ?d - disk)
    (required-from-peg ?s - step ?p - peg)
    (required-from-disk ?s - step ?d - disk)
    (required-to-peg ?s - step ?p - peg)
    (required-to-disk ?s - step ?d - disk)

    ;; distinctness helpers to enable syntactic non-equality checks where needed
    (distinct-pp ?p1 - peg ?p2 - peg)
    (distinct-dd ?d1 - disk ?d2 - disk)
    (distinct-pd ?p - peg ?d - disk)
    (distinct-dp ?d - disk ?p - peg)
  )

  ;; Move: disk directly on a peg -> place onto an empty peg (intermediate step)
  (:action move_peg_to_peg_step
    :parameters (?s - step ?snext - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
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
      (current-step ?snext)
    )
  )

  ;; Move: disk directly on a peg -> place onto an empty peg (last step)
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

  ;; Move: disk directly on another disk -> place onto an empty peg (intermediate step)
  (:action move_disk_to_peg_step
    :parameters (?s - step ?snext - step ?d - disk ?from - disk ?to - peg)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
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
      (current-step ?snext)
    )
  )

  ;; Move: disk directly on another disk -> place onto an empty peg (last step)
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

  ;; Move: disk on peg -> place on top of another disk (intermediate step)
  (:action move_peg_to_disk_step
    :parameters (?s - step ?snext - step ?d - disk ?from - peg ?to - disk)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
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
      (current-step ?snext)
    )
  )

  ;; Move: disk on peg -> place on top of another disk (last step)
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

  ;; Move: disk on disk -> place on top of another disk (intermediate step)
  (:action move_disk_to_disk_step
    :parameters (?s - step ?snext - step ?d - disk ?from - disk ?to - disk)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
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
      (current-step ?snext)
    )
  )

  ;; Move: disk on disk -> place on top of another disk (last step)
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