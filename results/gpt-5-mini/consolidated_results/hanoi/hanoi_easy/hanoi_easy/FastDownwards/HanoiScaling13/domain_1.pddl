(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place step)

  (:predicates
    ;; disk placement: disk is directly on a place (peg or another disk)
    (on ?d - disk ?p - place)

    ;; a place (peg or disk) has no disk on top
    (clear ?p - place)

    ;; size ordering: smaller ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit step sequencing and required move specification
    (current-step ?s - step)
    (step-successor ?s1 - step ?s2 - step)
    (last-step ?s - step)

    (required-disk ?s - step ?d - disk)
    (required-from ?s - step ?p - place)
    (required-to ?s - step ?p - place)
  )

  ;; Move a disk onto an empty peg, intermediate step (advances to successor)
  (:action move_to_empty_peg_step
    :parameters (?s - step ?snext - step ?d - disk ?from - place ?to - peg)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from ?s ?from)
      (required-to ?s ?to)

      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a disk onto an empty peg, last step (no successor)
  (:action move_to_empty_peg_last
    :parameters (?s - step ?d - disk ?from - place ?to - peg)
    :precondition (and
      (current-step ?s)
      (last-step ?s)
      (required-disk ?s ?d)
      (required-from ?s ?from)
      (required-to ?s ?to)

      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current-step ?s))
    )
  )

  ;; Move a disk onto another disk (intermediate step). Enforce smaller relation.
  (:action move_onto_disk_step
    :parameters (?s - step ?snext - step ?d - disk ?from - place ?to - disk)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from ?s ?from)
      (required-to ?s ?to)

      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a disk onto another disk (last step). Enforce smaller relation.
  (:action move_onto_disk_last
    :parameters (?s - step ?d - disk ?from - place ?to - disk)
    :precondition (and
      (current-step ?s)
      (last-step ?s)
      (required-disk ?s ?d)
      (required-from ?s ?from)
      (required-to ?s ?to)

      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current-step ?s))
    )
  )
)