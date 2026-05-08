(define (domain hanoi-6disk-steps)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk placement relations:
    (on-peg ?d - disk ?p - peg)    ; disk is directly on a peg (bottom-of-stack case)
    (on-disk ?d - disk ?s - disk) ; disk is directly on another disk

    ;; top-of-stack and peg-empty bookkeeping (kept explicit and updated by actions)
    (top ?d - disk)               ; disk has nothing on top (is the topmost)
    (empty ?p - peg)              ; peg currently has no disks

    ;; static size ordering:
    (smaller ?a - disk ?b - disk)

    ;; discrete step progression:
    (next ?s - step ?s2 - step)
    (current ?s - step)
  )

  ;; Move a top disk that is directly on a peg onto an empty peg.
  (:action move-peg-to-peg-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (top ?d)
      (empty ?to)
    )
    :effect (and
      ;; advance step
      (not (current ?s))
      (current ?s2)

      ;; move disk
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; peg occupancy updates: source becomes empty (it had only ?d), target becomes non-empty
      (empty ?from)
      (not (empty ?to))

      ;; top bookkeeping: ?d remains top at its new location (no change needed to top predicate)
      ;; no other top predicates need changing because ?d was sole disk on ?from
    )
  )

  ;; Move a top disk that is directly on a peg onto a top disk (stacking on a disk).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; advance step
      (not (current ?s))
      (current ?s2)

      ;; move disk onto another disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; peg occupancy updates: source becomes empty (it had only ?d)
      (empty ?from)

      ;; top bookkeeping: target disk is no longer top, moved disk becomes top
      (not (top ?to))
      (top ?d)
    )
  )

  ;; Move a top disk that is directly on another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)
      (top ?d)
      (empty ?to)
    )
    :effect (and
      ;; advance step
      (not (current ?s))
      (current ?s2)

      ;; move disk to peg
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ;; peg occupancy updates
      (not (empty ?to))

      ;; top bookkeeping: moved disk becomes top at destination; the underlying disk becomes top at source
      (top ?d)
      (top ?from)
    )
  )

  ;; Move a top disk that is directly on another disk onto a top disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)
      (top ?d)
      (top ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; advance step
      (not (current ?s))
      (current ?s2)

      ;; move disk onto target disk
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ;; top bookkeeping: moved disk becomes top; underlying disk becomes top; target disk is no longer top
      (top ?d)
      (top ?from)
      (not (top ?to))
    )
  )
)