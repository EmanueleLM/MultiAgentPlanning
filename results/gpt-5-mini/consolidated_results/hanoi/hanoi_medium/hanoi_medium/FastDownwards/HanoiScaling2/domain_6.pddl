(define (domain hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; disk d is directly on support x (either a disk or a peg)
    (on ?d - disk ?x - (either disk peg))
    ;; top of support x is free (no disk directly on x)
    (clear ?x - (either disk peg))
    ;; disk size ordering: d1 is smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; stage successor relation to enforce contiguous step progression
    (succ ?s - stage ?s2 - stage)
    ;; current stage/timepoint
    (current ?s - stage)
  )

  ;; Move a clear disk from any support (disk or peg) onto a peg.
  (:action mover-move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after removing ?d the former support ?from becomes clear (top exposed)
      (clear ?from)
      ;; destination peg no longer clear (has ?d on top)
      (not (clear ?to))
      ;; the moved disk is now on top and thus clear
      (clear ?d)
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a clear disk from any support (disk or peg) onto a larger clear disk.
  (:action mover-move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      ;; enforce no larger-on-smaller: moving disk must be smaller than destination disk
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; after removing ?d the former support ?from becomes clear
      (clear ?from)
      ;; destination disk is no longer clear (has ?d on top)
      (not (clear ?to))
      ;; the moved disk is now on top and thus clear
      (clear ?d)
      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)