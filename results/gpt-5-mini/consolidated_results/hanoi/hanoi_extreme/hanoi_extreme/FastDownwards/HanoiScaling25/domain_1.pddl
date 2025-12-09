(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk placement on pegs
    (on ?d - disk ?p - peg)
    ;; immediate adjacency: ?upper is directly above ?lower on same peg
    (immed-below ?upper - disk ?lower - disk)
    ;; disk has any disk below it (at least one)
    (has-below ?d - disk)
    ;; disk is the top disk of a peg
    (top ?d - disk ?p - peg)
    ;; peg is empty (no disks)
    (empty ?p - peg)

    ;; explicit discrete time progression
    (current-step ?s - step)
    (next ?s1 - step ?s2 - step)

    ;; require a specific disk move at a given step: hard ordering constraint
    (required-move ?s - step ?d - disk ?from - peg ?to - peg)

    ;; size order predicate: larger ?x ?y means x is strictly larger than y
    (larger ?x - disk ?y - disk)
  )

  ;; Move a top disk from ?from to an empty destination ?to,
  ;; when the moved disk has no disk immediately below it at the source.
  (:action move-empty-no-below
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
      ;; advance time
      (not (current-step ?s1))
      (current-step ?s2)

      ;; move disk placement
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source updates: disk removed was top, source becomes empty
      (not (top ?d ?from))
      (empty ?from)

      ;; destination updates: disk becomes top and destination no longer empty
      (top ?d ?to)
      (not (empty ?to))

      ;; moved disk continues to have no disk below
      (not (has-below ?d))
    )
  )

  ;; Move a top disk from ?from to an empty destination ?to,
  ;; when the moved disk has an immediate lower disk ?l at the source.
  (:action move-empty-with-below
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
      ;; advance time
      (not (current-step ?s1))
      (current-step ?s2)

      ;; move disk placement
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source updates: remove immed-below link from moved disk,
      ;; make the former lower disk the new top of source
      (not (immed-below ?d ?l))
      (top ?l ?from)

      (not (top ?d ?from))

      ;; source is not empty because ?l becomes top
      (not (empty ?from))

      ;; destination updates: moved disk becomes top, destination no longer empty
      (top ?d ?to)
      (not (empty ?to))

      ;; moved disk no longer has a disk below at the destination (destination was empty)
      (not (has-below ?d))
    )
  )

  ;; Move a top disk from ?from onto a non-empty destination ?to whose top is ?e (larger than moved disk),
  ;; when the moved disk has no disk immediately below it at the source.
  (:action move-nonempty-no-below
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
      ;; advance time
      (not (current-step ?s1))
      (current-step ?s2)

      ;; move disk placement
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source updates: removed top -> source becomes empty
      (not (top ?d ?from))
      (empty ?from)

      ;; destination updates: previous top ?e is no longer top, moved disk becomes top
      (not (top ?e ?to))
      (top ?d ?to)

      ;; adjacency: moved disk is immediately above former top ?e
      (immed-below ?d ?e)

      ;; moved disk now has a disk below it
      (has-below ?d)
    )
  )

  ;; Move a top disk from ?from onto a non-empty destination ?to whose top is ?e (larger than moved disk),
  ;; when the moved disk has an immediate lower disk ?l at the source.
  (:action move-nonempty-with-below
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
      ;; advance time
      (not (current-step ?s1))
      (current-step ?s2)

      ;; move disk placement
      (not (on ?d ?from))
      (on ?d ?to)

      ;; source updates: remove immediate adjacency linking moved disk to its lower disk;
      ;; the lower disk becomes the new top at the source
      (not (immed-below ?d ?l))
      (top ?l ?from)
      (not (top ?d ?from))

      ;; source remains non-empty because ?l becomes top
      (not (empty ?from))

      ;; destination updates: previous top ?e is no longer top, moved disk becomes top,
      ;; moved disk is immediately above ?e and thus has-below true
      (not (top ?e ?to))
      (top ?d ?to)
      (immed-below ?d ?e)
      (has-below ?d)
    )
  )
)