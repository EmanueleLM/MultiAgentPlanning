(define (domain towers-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage operator)

  (:predicates
    (is-operator ?op - operator)
    ;; direct "on" relation: a disk is directly on either a peg or another disk (support)
    (on ?d - disk ?s - support)
    ;; a support (peg or disk) is clear (no disk directly on it)
    (clear ?s - support)
    ;; size ordering: smaller ?d1 ?d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage progression
    (next ?t1 - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move a top disk onto an empty peg
  (:action move-to-peg
    :parameters (?op - operator ?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      ;; the disk must be directly on its source support and must be top (nothing on it)
      (on ?d ?from)
      (clear ?d)
      ;; the destination peg must be empty (clear)
      (clear ?to)
      ;; enforce contiguous stage progression
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; move the disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination peg now has a disk directly on it (not clear)
      (not (clear ?to))
      ;; the source support (disk or peg) becomes clear (nothing directly on it anymore)
      (clear ?from)
      ;; advance the current stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk onto another top disk (must be smaller)
  (:action move-to-disk
    :parameters (?op - operator ?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (is-operator ?op)
      ;; disk is on its source support and is top
      (on ?d ?from)
      (clear ?d)
      ;; destination disk is top (clear) and strictly larger
      (clear ?to)
      (smaller ?d ?to)
      ;; enforce contiguous stage progression
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; move the disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; destination disk no longer clear (now has a disk on it)
      (not (clear ?to))
      ;; the source support (disk or peg) becomes clear
      (clear ?from)
      ;; advance the current stage
      (not (current ?t))
      (current ?t2)
    )
  )
)