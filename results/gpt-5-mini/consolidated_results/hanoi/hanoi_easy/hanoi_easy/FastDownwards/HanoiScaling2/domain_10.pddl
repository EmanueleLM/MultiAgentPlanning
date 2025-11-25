(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; direct placement relations
    (on-peg ?d - disk ?p - peg)      ;; disk directly on a peg (bottom-most at that peg)
    (on-disk ?d - disk ?d2 - disk)   ;; disk directly on another disk

    ;; top / emptiness flags
    (clear-peg ?p - peg)             ;; peg has no disks
    (clear-disk ?d - disk)           ;; nothing is directly on top of this disk (disk is top of its stack)

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)  ;; d1 is smaller than d2

    ;; discrete stage/time modeling
    (stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
    (current ?s - stage)
  )

  ;; Move a top disk that is the only disk on its source peg to an empty destination peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)        ;; disk is top of its peg (hence the only disk on the peg)
      (clear-peg ?to)        ;; destination peg is empty
      (stage ?s) (stage ?s2) (current ?s) (next ?s ?s2)
    )
    :effect (and
      ;; relocation
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; peg occupancy updates
      (not (clear-peg ?to))  ;; destination no longer empty
      (clear-peg ?from)      ;; source peg becomes empty

      ;; top/disk updates (moved disk is top at destination)
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk that is the only disk on its source peg onto a top disk (stack onto disk).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?target - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)         ;; disk is top at source (only disk on peg)
      (clear-disk ?target)    ;; target disk is top and can receive
      (smaller ?d ?target)    ;; moved disk smaller than target
      (stage ?s) (stage ?s2) (current ?s) (next ?s ?s2)
    )
    :effect (and
      ;; relocation
      (not (on-peg ?d ?from))
      (on-disk ?d ?target)

      ;; source peg becomes empty
      (clear-peg ?from)

      ;; top/disk updates
      (not (clear-disk ?target))  ;; target no longer clear
      (clear-disk ?d)             ;; moved disk is top at destination

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from on top of a disk to an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)         ;; disk is top of its source disk
      (clear-peg ?to)         ;; destination peg is empty
      (stage ?s) (stage ?s2) (current ?s) (next ?s ?s2)
    )
    :effect (and
      ;; relocation
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; destination peg no longer empty
      (not (clear-peg ?to))

      ;; source disk becomes clear (no disk on top)
      (clear-disk ?from)

      ;; moved disk is top at destination
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from on top of a disk onto another top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?target - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)         ;; disk is top of its source disk
      (clear-disk ?target)    ;; target disk is top and can receive
      (smaller ?d ?target)    ;; size ordering
      (stage ?s) (stage ?s2) (current ?s) (next ?s ?s2)
    )
    :effect (and
      ;; relocation
      (not (on-disk ?d ?from))
      (on-disk ?d ?target)

      ;; source disk becomes clear (no disk on top)
      (clear-disk ?from)

      ;; target no longer clear, moved disk is clear (top)
      (not (clear-disk ?target))
      (clear-disk ?d)

      ;; advance stage
      (not (current ?s))
      (current ?s2)
    )
  )
)