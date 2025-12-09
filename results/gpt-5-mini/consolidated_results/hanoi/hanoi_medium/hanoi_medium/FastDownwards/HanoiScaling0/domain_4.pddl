(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    ;; a disk is immediately on a support (either a peg or another disk)
    (on ?d - disk ?s - support)
    ;; a support (peg or disk) has nothing directly on top of it
    (clear ?s - support)
    ;; static size ordering between disks (treated as static axioms in the problem)
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage/time objects and successor relation
    (stage ?t - stage)
    (next ?t - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move a top disk from any support (peg or disk) onto an empty peg.
  ;; Advance the discrete stage by one. Enforces that the moved disk is top,
  ;; destination peg is clear, and the move changes support.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)           ;; disk is immediately on support ?from
      (clear ?d)              ;; only top disks may be moved
      (clear ?to)             ;; destination peg must be top/empty
      (current ?t)            ;; at current stage ?t
      (next ?t ?t2)           ;; progress to immediate successor stage ?t2
      (not (= ?from ?to))     ;; must actually change support
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)           ;; former support now has nothing directly on it
      (not (clear ?to))       ;; destination peg now has a disk directly on it
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from any support onto another top disk.
  ;; Destination disk must be larger than the moved disk.
  ;; Advance the discrete stage by one. Enforce top-only for both moved disk and target,
  ;; and ensure the move changes support and does not place a larger disk onto a smaller one.
  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)           ;; disk is immediately on support ?from
      (clear ?d)              ;; only top disks may be moved
      (clear ?tgt)            ;; target disk must be top
      (smaller ?d ?tgt)       ;; moved disk must be smaller than target disk
      (current ?t)
      (next ?t ?t2)
      (not (= ?d ?tgt))       ;; cannot move a disk onto itself
      (not (= ?from ?tgt))    ;; support must actually change
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?tgt)
      (clear ?from)           ;; former support now has nothing directly on it
      (not (clear ?tgt))      ;; target disk now has a disk directly on it
      (not (current ?t))
      (current ?t2)
    )
  )
)