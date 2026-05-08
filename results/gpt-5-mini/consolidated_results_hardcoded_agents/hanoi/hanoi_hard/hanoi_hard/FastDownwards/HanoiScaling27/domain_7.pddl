(define (domain hanoi-six-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk is directly on a peg (bottom-most on that peg)
    (on-peg ?d - disk ?p - peg)
    ;; disk is directly on top of another disk
    (on-disk ?d - disk ?d2 - disk)
    ;; top-of-stack marker for a disk (true iff no disk is on top of it)
    (clear ?d - disk)
    ;; peg is empty (no disk directly on peg)
    (empty ?p - peg)
    ;; disk is located on peg ?p (for quick peg membership checks)
    (loc ?d - disk ?p - peg)
    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; current stage/time-step marker (exactly one now ?s true)
    (now ?s - stage)
    ;; successor relation between stages: next s -> s2
    (next ?s - stage ?s2 - stage)
    ;; helper to ensure pegs differ (no built-in inequality in STRIPS)
    (diff ?p1 - peg ?p2 - peg)
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (loc ?d ?from)
      (not (empty ?from))   ;; origin has at least the moved disk
      (empty ?to)
      (diff ?from ?to)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove old relations
      (not (on-peg ?d ?from))
      (not (loc ?d ?from))

      ;; peg occupancy updates
      (empty ?from)
      (not (empty ?to))

      ;; place on destination peg
      (on-peg ?d ?to)
      (loc ?d ?to)

      ;; moved disk remains the top on destination peg
      (clear ?d)

      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that is directly on a peg to sit on top of another disk
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - peg ?top - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (loc ?d ?from)
      (loc ?top ?to)
      (clear ?top)
      (smaller ?d ?top)
      (diff ?from ?to)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove old on-peg relation and loc
      (not (on-peg ?d ?from))
      (not (loc ?d ?from))

      ;; origin peg becomes empty (because on-peg & clear => disk was sole top on peg)
      (empty ?from)

      ;; destination top is no longer clear, moved disk becomes on-disk on top
      (not (clear ?top))
      (on-disk ?d ?top)
      (loc ?d ?to)

      ;; destination is not empty
      (not (empty ?to))

      ;; moved disk is clear (top)
      (clear ?d)

      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that sits on another disk to an empty peg
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (loc ?d ?from)
      (loc ?below ?from)
      (not (empty ?from))
      (empty ?to)
      (diff ?from ?to)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove on-disk and old loc
      (not (on-disk ?d ?below))
      (not (loc ?d ?from))

      ;; below disk becomes clear
      (clear ?below)

      ;; place moved disk on destination peg
      (on-peg ?d ?to)
      (loc ?d ?to)
      (not (empty ?to))

      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk that sits on another disk to sit on top of another disk
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?top - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (loc ?d ?from)
      (loc ?below ?from)
      (loc ?top ?to)
      (clear ?top)
      (smaller ?d ?top)
      (diff ?from ?to)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove old support relation and old loc
      (not (on-disk ?d ?below))
      (not (loc ?d ?from))

      ;; below disk becomes clear
      (clear ?below)

      ;; destination top is no longer clear; moved disk becomes on top of it
      (not (clear ?top))
      (on-disk ?d ?top)
      (loc ?d ?to)

      ;; destination is occupied (implied by loc/top facts, but keep for clarity)
      (not (empty ?to))

      ;; moved disk is clear on top
      (clear ?d)

      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )
)