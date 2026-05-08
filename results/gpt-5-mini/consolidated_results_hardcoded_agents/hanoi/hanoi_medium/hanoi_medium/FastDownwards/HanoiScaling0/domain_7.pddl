(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; immediate support relations
    (on-disk ?d - disk ?s - disk)   ;; disk ?d is immediately on disk ?s
    (on-peg  ?d - disk ?p - peg)    ;; disk ?d is immediately on peg ?p

    ;; top/clear facts for disks and pegs
    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)

    ;; strict size ordering between disks (static)
    (smaller ?d1 - disk ?d2 - disk)

    ;; discrete stage/time objects and successor relation
    (current ?t - stage)
    (next ?t - stage ?t2 - stage)
  )

  ;; Move a top disk from a disk onto a peg (peg must be empty).
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg  ?d ?to)

      ;; the support we removed the disk from (a disk) becomes clear
      (clear-disk ?from)

      ;; destination peg now occupied
      (not (clear-peg ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a peg onto a peg (destination peg must be empty).
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current ?t)
      (next ?t ?t2)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg  ?d ?to)

      ;; source peg becomes clear
      (clear-peg ?from)

      ;; destination peg now occupied
      (not (clear-peg ?to))

      ;; moved disk remains top
      (clear-disk ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a disk onto another disk (destination disk must be larger).
  (:action move-disk-onto-disk
    :parameters (?d - disk ?from - disk ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?tgt)
      (smaller ?d ?tgt)
      (current ?t)
      (next ?t ?t2)
      (not (= ?from ?tgt))
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?tgt)

      ;; support we removed from becomes clear
      (clear-disk ?from)

      ;; target disk is no longer clear (now has ?d on top)
      (not (clear-disk ?tgt))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a peg onto another disk (destination disk must be larger).
  (:action move-peg-onto-disk
    :parameters (?d - disk ?from - peg ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?tgt)
      (smaller ?d ?tgt)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)

      ;; source peg becomes clear
      (clear-peg ?from)

      ;; target disk no longer clear
      (not (clear-disk ?tgt))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )
)