(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types object step)

  (:predicates
    (disk ?o - object)
    (peg ?o - object)
    ;; ?d is directly on ?s (where ?s may be a peg or another disk)
    (on ?d - object ?s - object)
    ;; no disk is directly on top of ?o (applies to pegs and disks)
    (clear ?o - object)
    ;; static size ordering: (smaller x y) means x is smaller than y
    (smaller ?d1 - object ?d2 - object)
    ;; discrete stage token and successor relation to enforce exact step progression
    (stage ?s - step)
    (next ?s - step ?s2 - step)
  )

  ;; Move a top disk onto an empty peg (peg must be clear). Progresses stage token.
  (:action move-to-peg
    :parameters (?d - object ?from - object ?to - object ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
      (disk ?d)
      (peg ?to)
      (on ?d ?from)      ;; ?d is currently directly on ?from
      (clear ?d)         ;; ?d is the top disk on its stack
      (clear ?to)        ;; destination peg is empty (top is clear)
      (not (= ?from ?to))
      (not (= ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ;; the support ?from becomes clear after removing ?d
      (not (clear ?to))  ;; destination is no longer clear (has ?d on top)
      (not (stage ?s))
      (stage ?s2)
    )
  )

  ;; Move a top disk onto another disk (destination disk must be clear and larger). Progresses stage token.
  (:action move-to-disk
    :parameters (?d - object ?from - object ?to - object ?s - step ?s2 - step)
    :precondition (and
      (stage ?s)
      (next ?s ?s2)
      (disk ?d)
      (disk ?to)
      (on ?d ?from)      ;; ?d is currently directly on ?from
      (clear ?d)         ;; ?d is the top disk on its stack
      (clear ?to)        ;; destination disk has no disk on top
      (smaller ?d ?to)   ;; cannot place a larger disk on a smaller one
      (not (= ?from ?to))
      (not (= ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)      ;; the support ?from becomes clear after removing ?d
      (not (clear ?to))  ;; destination is no longer clear (has ?d on top)
      (not (stage ?s))
      (stage ?s2)
    )
  )
)