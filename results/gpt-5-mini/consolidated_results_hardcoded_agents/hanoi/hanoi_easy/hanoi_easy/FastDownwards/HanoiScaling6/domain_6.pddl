(define (domain towers-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage operator)

  (:predicates
    ;; operator token (agent performing moves)
    (is-operator ?op - operator)

    ;; direct "on" relation: a disk is directly on either a peg or another disk (support)
    (on ?d - disk ?s - support)

    ;; a support (peg or disk) is clear iff no disk is directly on it
    (clear ?s - support)

    ;; size ordering: (smaller d1 d2) means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete stage progression: next and current enforce contiguous single-step progression
    (next ?t1 - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move a top disk onto an empty peg (atomic single-disk move).
  ;; Enforces: mover is operator, disk is directly on source and is top (clear),
  ;; destination peg is empty (clear), and the action advances the current stage to its successor.
  (:action move-to-peg
    :parameters (?op - operator ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; update on-relations
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination peg is no longer clear; source support becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance the discrete stage (enforces contiguous progression)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk onto another top disk (must be smaller than destination disk).
  ;; Enforces: destination disk is top (clear), size ordering, and contiguous stage progression.
  (:action move-to-disk
    :parameters (?op - operator ?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; update on-relations
      (not (on ?d ?from))
      (on ?d ?to)

      ;; destination disk is no longer clear; source support becomes clear
      (not (clear ?to))
      (clear ?from)

      ;; advance the discrete stage (enforces contiguous progression)
      (not (current ?t))
      (current ?t2)
    )
  )
)