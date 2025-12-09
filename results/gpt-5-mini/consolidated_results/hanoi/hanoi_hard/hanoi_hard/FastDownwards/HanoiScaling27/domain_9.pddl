(define (domain hanoi-six-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk is the bottom-most disk on a peg
    (on-peg ?d - disk ?p - peg)
    ;; disk is directly on top of another disk (immediate support)
    (on-disk ?d - disk ?d2 - disk)
    ;; disk has no disk on top of it (is top of its stack)
    (clear ?d - disk)
    ;; peg has no disks directly on it (empty)
    (empty ?p - peg)
    ;; disk is located on peg ?p (peg membership)
    (loc ?d - disk ?p - peg)
    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; current stage/time-step marker (exactly one now ?s is intended)
    (now ?s - stage)
    ;; successor relation between stages: next s -> s2
    (next ?s - stage ?s2 - stage)
    ;; helper for requiring pegs differ (explicit distinctness facts provided in problem)
    (diff ?p1 - peg ?p2 - peg)
  )

  ;; Move a single disk that is the sole disk on a peg (bottom & top)
  ;; to an empty peg (it becomes bottom & top at destination).
  (:action move-from-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (loc ?d ?from)
      (empty ?to)
      (diff ?from ?to)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove origin relations
      (not (on-peg ?d ?from))
      (not (loc ?d ?from))
      ;; origin peg becomes empty
      (empty ?from)
      ;; place disk on destination peg as bottom and top
      (on-peg ?d ?to)
      (loc ?d ?to)
      (clear ?d)
      (not (empty ?to))
      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a single disk that is the sole disk on a peg (bottom & top)
  ;; to sit immediately on top of another disk (not on-peg).
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
      ;; remove origin relations
      (not (on-peg ?d ?from))
      (not (loc ?d ?from))
      ;; origin peg becomes empty
      (empty ?from)
      ;; update destination: old top no longer clear; moved disk sits on top
      (not (clear ?top))
      (on-disk ?d ?top)
      (loc ?d ?to)
      (not (empty ?to))
      ;; moved disk is the new top
      (clear ?d)
      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a disk that is on top of another disk (on-disk) to an empty peg.
  ;; The below disk becomes the new top on the origin; moved disk becomes bottom & top at destination.
  (:action move-from-disk-to-empty
    :parameters (?d - disk ?below - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (loc ?d ?from)
      (loc ?below ?from)
      (empty ?to)
      (diff ?from ?to)
      (now ?s)
      (next ?s ?s2)
    )
    :effect (and
      ;; remove the immediate-support relation and the moved disk's origin location
      (not (on-disk ?d ?below))
      (not (loc ?d ?from))
      ;; below disk becomes the new top on origin
      (clear ?below)
      ;; place moved disk on destination peg as bottom and top
      (on-peg ?d ?to)
      (loc ?d ?to)
      (clear ?d)
      (not (empty ?to))
      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a disk that is on top of another disk (on-disk) to sit on top of another disk.
  ;; The below disk becomes the new top on origin; destination top becomes not clear; moved disk becomes the new top.
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
      ;; remove old support relation and the moved disk's origin location
      (not (on-disk ?d ?below))
      (not (loc ?d ?from))
      ;; below disk becomes the new top on origin
      (clear ?below)
      ;; update destination: old top no longer clear; moved disk sits on top
      (not (clear ?top))
      (on-disk ?d ?top)
      (loc ?d ?to)
      (not (empty ?to))
      ;; moved disk is now the new top
      (clear ?d)
      ;; advance stage
      (not (now ?s))
      (now ?s2)
    )
  )
)