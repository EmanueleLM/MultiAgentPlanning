(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step agent)
  (:predicates
    (on ?d - disk ?p - peg)
    (top ?d - disk ?p - peg)
    (immed-below ?upper - disk ?lower - disk)
    (has-below ?d - disk)
    (empty ?p - peg)
    (current-step ?s - step)
    (next ?s1 - step ?s2 - step)
    (required-move ?s - step ?d - disk ?from - peg ?to - peg)
    (larger ?d1 - disk ?d2 - disk)
  )

  ;; Move when destination is empty and moved disk has no disk below it
  (:action move-by-mover-empty-no-below
    :parameters (?s1 - step ?s2 - step ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s1)
      (next ?s1 ?s2)
      (required-move ?s1 ?d ?from ?to)
      (top ?d ?from)
      (empty ?to)
      (not (has-below ?d))
    )
    :effect (and
      (not (current-step ?s1))
      (current-step ?s2)
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?d ?from))
      (top ?d ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )

  ;; Move when destination is empty and moved disk has a disk immediately below it
  (:action move-by-mover-empty-with-below
    :parameters (?s1 - step ?s2 - step ?d - disk ?l - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s1)
      (next ?s1 ?s2)
      (required-move ?s1 ?d ?from ?to)
      (top ?d ?from)
      (empty ?to)
      (immed-below ?d ?l)
      (has-below ?d)
    )
    :effect (and
      (not (current-step ?s1))
      (current-step ?s2)

      ;; move disk between pegs
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source updates: disk below becomes new top
      (not (immed-below ?d ?l))
      (top ?l ?from)

      (not (top ?d ?from))
      (top ?d ?to)

      ;; emptiness updates
      (not (empty ?to))
      (not (empty ?from))

      ;; moved disk will no longer have a below disk (destination empty)
      (not (has-below ?d))
    )
  )

  ;; Move when destination has a top disk e larger than d and moved disk has no disk below it
  (:action move-by-mover-nonempty-no-below
    :parameters (?s1 - step ?s2 - step ?d - disk ?e - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s1)
      (next ?s1 ?s2)
      (required-move ?s1 ?d ?from ?to)
      (top ?d ?from)
      (top ?e ?to)
      (larger ?e ?d)
      (not (has-below ?d))
    )
    :effect (and
      (not (current-step ?s1))
      (current-step ?s2)

      ;; move disk between pegs
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination updates: old top becomes immediately below moved disk
      (not (top ?e ?to))
      (immed-below ?d ?e)
      (has-below ?d)
      (top ?d ?to)

      ;; source updates: becomes empty (no below)
      (not (top ?d ?from))
      (empty ?from)

      ;; destination was not empty already, so not (empty ?to) ensured by precondition of top ?e ?to
    )
  )

  ;; Move when destination has a top disk e larger than d and moved disk has an immediate below l
  (:action move-by-mover-nonempty-with-below
    :parameters (?s1 - step ?s2 - step ?d - disk ?l - disk ?e - disk ?from - peg ?to - peg)
    :precondition (and
      (current-step ?s1)
      (next ?s1 ?s2)
      (required-move ?s1 ?d ?from ?to)
      (top ?d ?from)
      (immed-below ?d ?l)
      (has-below ?d)
      (top ?e ?to)
      (larger ?e ?d)
    )
    :effect (and
      (not (current-step ?s1))
      (current-step ?s2)

      ;; move the disk
      (not (on ?d ?from))
      (on ?d ?to)

      ;; remove immediate-below linking to old lower disk; make that lower disk the new top of source
      (not (immed-below ?d ?l))
      (top ?l ?from)

      ;; destination updates: old top becomes below moved disk
      (not (top ?e ?to))
      (immed-below ?d ?e)
      (top ?d ?to)

      ;; moved disk still has a below disk at the destination (has-below remains true)
      (has-below ?d)

      ;; source is not empty after move because lower disk l becomes top
      (not (empty ?from))

      ;; ensure the moved-from top predicate removed
      (not (top ?d ?from))
    )
  )
)