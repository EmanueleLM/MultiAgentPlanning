(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    ;; immediate support relation: disk is immediately on a support (peg or disk)
    (on ?d - disk ?s - support)
    ;; nothing is directly on top of this support
    (clear ?s - support)
    ;; strict size ordering between disks (smaller ?x ?y means x is strictly smaller than y)
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage/time objects and successor relation
    (stage ?t - stage)
    (next ?t - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move a top disk from any support onto an empty peg (peg must be clear/empty).
  ;; Advances discrete stage by one. Enforces top-only move, destination peg empty,
  ;; and prevents no-op by forbidding identical source and destination.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?t)
      (next ?t ?t2)
      (not (= ?from ?to))
      (not (= ?d ?to))
    )
    :effect (and
      ;; update immediate-support relation
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update top/clear facts:
      ;; the support we removed the disk from becomes clear;
      (clear ?from)
      ;; the destination peg is no longer clear (it now has ?d on it)
      (not (clear ?to))
      ;; moved disk remains clear (it's the top on its new support)
      (clear ?d)
      ;; advance discrete stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from any support onto another top disk.
  ;; Destination disk must be larger than the moved disk. Advances discrete stage by one.
  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (current ?t)
      (next ?t ?t2)
      ;; prevent trivial/invalid moves (onto same support or onto itself)
      (not (= ?from ?tgt))
      (not (= ?d ?tgt))
    )
    :effect (and
      ;; update immediate-support relation
      (not (on ?d ?from))
      (on ?d ?tgt)
      ;; the support we removed the disk from becomes clear
      (clear ?from)
      ;; the target disk is no longer clear (it now has ?d on top)
      (not (clear ?tgt))
      ;; moved disk remains clear (top of its new support)
      (clear ?d)
      ;; advance discrete stage
      (not (current ?t))
      (current ?t2)
    )
  )
)