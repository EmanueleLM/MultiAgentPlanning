(define (domain hanoi-six-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk directly rests on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk directly rests on another disk
    (on-disk ?d - disk ?d2 - disk)
    ;; disk is the top of its stack (nothing on top)
    (clear ?d - disk)
    ;; peg has no disks
    (empty ?p - peg)
    ;; disk is located on a peg (peg where its stack resides)
    (loc ?d - disk ?p - peg)
    ;; size ordering: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; staging predicates to enforce a single action per stage and strict ordering
    (now ?s - stage)
    (next ?s - stage ?s2 - stage)
  )

  ;; Move a top disk that is directly on a peg to an empty peg
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (loc ?d ?from)
      (empty ?to)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove disk from source peg
      (not (on-peg ?d ?from))
      (not (loc ?d ?from))
      ;; source peg becomes empty (it had only ?d)
      (empty ?from)
      ;; destination peg becomes occupied by the moved disk
      (not (empty ?to))
      (on-peg ?d ?to)
      (loc ?d ?to)
      ;; the moved disk is top
      (clear ?d)

      ;; advance stage: consume ?s and enable ?s2
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
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove disk from source peg
      (not (on-peg ?d ?from))
      (not (loc ?d ?from))
      ;; source peg becomes empty (it had only ?d)
      (empty ?from)

      ;; update destination: top is no longer clear, moved disk sits on it
      (not (clear ?top))
      (on-disk ?d ?top)
      (loc ?d ?to)
      ;; moved disk is top
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
      (empty ?to)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove support relation
      (not (on-disk ?d ?below))
      ;; disk below becomes top of its stack
      (clear ?below)

      ;; update moved disk location to destination peg
      (not (loc ?d ?from))
      (not (empty ?to))
      (on-peg ?d ?to)
      (loc ?d ?to)
      (clear ?d)

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
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove old support and make below top
      (not (on-disk ?d ?below))
      (clear ?below)

      ;; destination top ceases to be clear, moved disk sits on it
      (not (clear ?top))
      (on-disk ?d ?top)

      ;; update movee's peg
      (not (loc ?d ?from))
      (loc ?d ?to)
      (clear ?d)

      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )
)