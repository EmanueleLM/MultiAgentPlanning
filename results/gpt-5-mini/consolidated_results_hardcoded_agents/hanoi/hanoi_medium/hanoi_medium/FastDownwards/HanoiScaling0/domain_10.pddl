(define (domain hanoi-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; immediate support relations
    (on-disk ?d - disk ?s - disk)   ;; disk ?d is immediately on disk ?s
    (on-peg  ?d - disk ?p - peg)    ;; disk ?d is immediately on peg ?p

    ;; top/clear facts
    (clear-disk ?d - disk)          ;; disk ?d has no disk on top (is top of its stack)
    (clear-peg  ?p - peg)           ;; peg ?p has no disks on it (is empty)

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk) ;; ?d1 is strictly smaller than ?d2

    ;; discrete stage/time objects and successor relation
    (current ?t - stage)
    (next ?t - stage ?t2 - stage)
  )

  ;; Move a top disk from a disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)    ;; ?d directly on ?from
      (clear-disk ?d)       ;; ?d is top (no disk above)
      (clear-peg ?to)       ;; destination peg is empty
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; relocate disk from disk to peg
      (not (on-disk ?d ?from))
      (on-peg  ?d ?to)

      ;; the disk that was supporting ?d becomes clear
      (clear-disk ?from)

      ;; destination peg becomes occupied
      (not (clear-peg ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a peg onto an empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)     ;; ?d directly on source peg (bottom-most)
      (clear-disk ?d)       ;; ?d is top (no disk above) -> peg has exactly that one disk
      (clear-peg ?to)       ;; destination peg is empty
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; relocate disk from peg to peg
      (not (on-peg ?d ?from))
      (on-peg  ?d ?to)

      ;; source peg becomes empty
      (clear-peg ?from)

      ;; destination peg becomes occupied
      (not (clear-peg ?to))

      ;; moved disk is top on its new support
      (clear-disk ?d)

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk from a disk onto a larger top disk.
  (:action move-disk-onto-disk
    :parameters (?d - disk ?from - disk ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)    ;; ?d directly on ?from
      (clear-disk ?d)       ;; ?d is top (no disk above)
      (clear-disk ?tgt)     ;; target disk is top (no disk above)
      (smaller ?d ?tgt)     ;; moved disk is smaller than target disk
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; relocate disk from disk to disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?tgt)

      ;; support we removed the disk from becomes clear
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

  ;; Move a top disk from a peg onto a larger top disk.
  (:action move-peg-onto-disk
    :parameters (?d - disk ?from - peg ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)     ;; ?d directly on source peg
      (clear-disk ?d)       ;; ?d is top (no disk above) -> peg had single disk
      (clear-disk ?tgt)     ;; target disk is top (no disk above)
      (smaller ?d ?tgt)     ;; moved disk is smaller than target disk
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      ;; relocate disk from peg to disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)

      ;; source peg becomes empty
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