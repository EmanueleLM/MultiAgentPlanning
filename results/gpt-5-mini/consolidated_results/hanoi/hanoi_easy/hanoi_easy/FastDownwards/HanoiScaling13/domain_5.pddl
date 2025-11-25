(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk step)

  (:predicates
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly on another disk
    (on-disk ?d - disk ?p - disk)

    ;; clear markers
    (clear-peg ?p - peg)   ;; peg has no disk directly on it
    (clear-disk ?d - disk) ;; disk has no disk directly on it (is top)

    ;; size ordering: smaller ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit step sequencing
    (current-step ?s - step)
    (step-successor ?s1 - step ?s2 - step)
    (last-step ?s - step)

    ;; required move specification for each step (enforces ordered moves)
    (required-disk ?s - step ?d - disk)
    (required-from-peg ?s - step ?p - peg)
    (required-from-disk ?s - step ?d - disk)
    (required-to-peg ?s - step ?p - peg)
    (required-to-disk ?s - step ?d - disk)

    ;; distinct predicates forbidding identity sources/targets where relevant
    (distinct-pp ?p1 - peg ?p2 - peg)
    (distinct-pd ?p - peg ?d - disk)
    (distinct-dp ?d - disk ?p - peg)
    (distinct-dd ?d1 - disk ?d2 - disk)
  )

  ;; Move from peg to peg (intermediate step)
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

      ;; source peg now has no disk directly on it
      (clear-peg ?from)
      ;; moved disk has no disk on it
      (clear-disk ?d)
      ;; destination peg now has a disk directly on it
      (not (clear-peg ?to))

      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move from peg to peg (last step)
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
      (clear-disk ?d)
      (not (clear-peg ?to))

      (not (current-step ?s))
    )
  )

  ;; Move from disk to peg (intermediate)
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

      ;; source disk now has nothing on it
      (clear-disk ?from)
      (clear-disk ?d)
      ;; destination peg no longer clear
      (not (clear-peg ?to))

      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move from disk to peg (last)
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
      (clear-disk ?d)
      (not (clear-peg ?to))

      (not (current-step ?s))
    )
  )

  ;; Move from peg to disk (intermediate)
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

      ;; source peg now clear
      (clear-peg ?from)
      ;; target disk now has something on it
      (not (clear-disk ?to))
      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move from peg to disk (last)
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

  ;; Move from disk to disk (intermediate)
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

      ;; source disk now clear
      (clear-disk ?from)
      ;; target disk now occupied
      (not (clear-disk ?to))
      (clear-disk ?d)

      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move from disk to disk (last)
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