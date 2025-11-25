(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    ;; immediate support relation: a disk is immediately on a support (peg or disk)
    (on ?d - disk ?s - support)
    ;; nothing is directly on top of this support
    (clear ?s - support)
    ;; static size ordering between disks
    (smaller ?d1 - disk ?d2 - disk)
    ;; discrete stage/time objects and successor relation
    (stage ?t - stage)
    (next ?t - stage ?t2 - stage)
    (current ?t - stage)
  )

  ;; Move a top disk from any support (peg or disk) onto an empty peg.
  ;; Advance the discrete stage by one. Enforces that the moved disk is top,
  ;; the destination peg is clear (empty), and the disk actually changes support
  ;; (prevent moving to the same support by requiring the disk is not already on the destination).
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?t)
      (next ?t ?t2)
      (not (on ?d ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from any support onto another top disk.
  ;; Destination disk must be larger than the moved disk.
  ;; Advance the discrete stage by one. Enforce top-only for moved disk and target,
  ;; and ensure the disk is not already on the target (prevents no-op / same-support moves).
  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (current ?t)
      (next ?t ?t2)
      (not (on ?d ?tgt))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?tgt)
      (clear ?from)
      (not (clear ?tgt))
      (not (current ?t))
      (current ?t2)
    )
  )
)