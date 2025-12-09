(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)      ; disk directly on support (disk or peg)
    (clear ?s - support)             ; support has no disk on top (peg empty or disk has no disk on it)
    (smaller ?x - disk ?y - disk)    ; x is smaller than y
    (current ?t - step)              ; current time/stage
    (next ?t1 - step ?t2 - step)     ; successor relation on steps (linear ordering)
  )

  ;; Move a top disk from a support (peg or disk) onto an empty peg.
  ;; Enforces that the moved disk is the top disk (clear), the destination peg is empty (clear),
  ;; and that the action advances the current step to its successor.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      ;; the support that previously held ?d becomes clear (no disk on top)
      (clear ?from)
      ;; destination peg is no longer clear (now has ?d on top)
      (not (clear ?to))
      ;; advance time/stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a support (peg or disk) onto another disk.
  ;; Requires that the moved disk is smaller than the target disk, the target disk is top (clear),
  ;; and that the action advances the current step to its successor.
  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?target - disk ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)
      (clear ?target)
      (smaller ?d ?target)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      ;; the support that previously held ?d becomes clear
      (clear ?from)
      ;; target disk is no longer clear (now has ?d on top)
      (not (clear ?target))
      ;; advance time/stage
      (not (current ?t))
      (current ?t2)
    )
  )
)