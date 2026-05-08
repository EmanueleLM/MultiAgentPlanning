(define (domain hanoi)
  (:requirements :typing :negative-preconditions :strips)
  (:types disk peg - support step)
  (:predicates
    ;; disk directly on support (support is either a disk or a peg)
    (on ?d - disk ?s - support)
    ;; a support (disk or peg) has nothing directly on it
    (clear ?s - support)
    ;; strict size ordering
    (smaller ?x - disk ?y - disk)
    ;; successor relation on discrete steps
    (succ ?t1 - step ?t2 - step)
    ;; currently active step (enforces ordered progression)
    (current ?t - step)
  )

  ;; Move a top disk from any support to an empty peg.
  ;; Enforces current-step progression: action can be taken only at the current step,
  ;; and advances current to the successor step.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t1 - step ?t2 - step)
    :precondition (and
      (current ?t1)
      (succ ?t1 ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; target peg becomes non-clear, source support becomes clear
      (not (clear ?to))
      (clear ?from)
      ;; advance the current step
      (not (current ?t1))
      (current ?t2)
    )
  )

  ;; Move a top disk from any support to the top of another disk.
  ;; Size constraint: moved disk must be smaller than destination disk.
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?t1 - step ?t2 - step)
    :precondition (and
      (current ?t1)
      (succ ?t1 ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination disk no longer clear, source support becomes clear
      (not (clear ?to))
      (clear ?from)
      ;; advance the current step
      (not (current ?t1))
      (current ?t2)
    )
  )
)