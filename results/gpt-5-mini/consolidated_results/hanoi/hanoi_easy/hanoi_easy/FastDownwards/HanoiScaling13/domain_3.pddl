(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk d is directly on place p (peg or disk or any object)
    (on ?d - disk ?p - object)

    ;; place (peg or disk) has no disk on top
    (clear ?p - object)

    ;; size ordering: smaller ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit step sequencing
    (current-step ?s - step)
    (step-successor ?s1 - step ?s2 - step)
    (last-step ?s - step)

    ;; required move specification for each step (enforces ordered moves)
    (required-disk ?s - step ?d - disk)
    (required-from ?s - step ?p - object)
    (required-to ?s - step ?p - object)

    ;; syntactic predicate to forbid no-op moves (since :equality is not used)
    (distinct ?p1 - object ?p2 - object)
  )

  ;; Move a disk onto a peg (intermediate step: advances to successor)
  (:action move_to_peg_step
    :parameters (?s - step ?snext - step ?d - disk ?from - object ?to - peg)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from ?s ?from)
      (required-to ?s ?to)

      (on ?d ?from)
      (clear ?d)           ;; d must be the top disk at its source
      (clear ?to)          ;; peg destination must be empty (no top disk)
      (distinct ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; source place becomes clear after removing top disk
      (clear ?from)
      ;; destination peg now has a disk on top
      (not (clear ?to))
      ;; advance step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a disk onto a peg (last step: no successor)
  (:action move_to_peg_last
    :parameters (?s - step ?d - disk ?from - object ?to - peg)
    :precondition (and
      (current-step ?s)
      (last-step ?s)
      (required-disk ?s ?d)
      (required-from ?s ?from)
      (required-to ?s ?to)

      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (distinct ?from ?to)
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
    :parameters (?s - step ?snext - step ?d - disk ?from - object ?to - disk)
    :precondition (and
      (current-step ?s)
      (step-successor ?s ?snext)
      (required-disk ?s ?d)
      (required-from ?s ?from)
      (required-to ?s ?to)

      (on ?d ?from)
      (clear ?d)
      (clear ?to)          ;; target disk must be top of its stack
      (smaller ?d ?to)     ;; cannot place larger disk on smaller one
      (distinct ?from ?to)
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
    :parameters (?s - step ?d - disk ?from - object ?to - disk)
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
      (distinct ?from ?to)
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