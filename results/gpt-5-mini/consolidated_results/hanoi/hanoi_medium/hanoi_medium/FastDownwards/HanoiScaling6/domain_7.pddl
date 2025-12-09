(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; stage progression
    (cur ?s - step)
    (succ ?s - step ?t - step)

    ;; position relations
    (on-peg ?d - disk ?p - peg)        ; disk is directly on a peg (bottom disk of that peg)
    (on-disk ?d - disk ?under - disk) ; disk is directly on top of another disk

    ;; top-of-stack / emptiness flags
    (clear ?d - disk)  ; disk has no disk on top
    (empty ?p - peg)   ; peg has no disks

    ;; static ordering and distinctness helpers
    (smaller ?a - disk ?b - disk)
    (diff-peg ?p1 - peg ?p2 - peg)
    (diff-disk ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk that is the sole disk on its peg onto an empty peg.
  ;; Preconditions enforce: disk is bottom on its peg, is clear (so it is the only disk on that peg),
  ;; destination peg is empty, stages advance, and pegs differ.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
      (diff-peg ?from ?to)
    )
    :effect (and
      ;; remove from source peg, place as bottom on target peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update emptiness flags for pegs
      (not (empty ?to))
      (empty ?from)

      ;; stage progression
      (not (cur ?s))
      (cur ?t)
    )
  )

  ;; Move a disk that is the sole disk on its peg onto another disk (target must be top and larger).
  ;; Preconditions: disk is bottom on its peg and clear (sole disk), target disk is clear (top),
  ;; size ordering, stages advance.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?tgt - disk ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (diff-disk ?d ?tgt)
    )
    :effect (and
      ;; remove from source peg, place on top of target disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)

      ;; source peg becomes empty (because disk was sole disk)
      (empty ?from)

      ;; target disk is no longer clear
      (not (clear ?tgt))

      ;; stage progression
      (not (cur ?s))
      (cur ?t)
    )
  )

  ;; Move a top disk that is on top of another disk onto an empty peg.
  ;; Preconditions: disk is directly on another disk and is clear (top), destination peg empty, stages advance.
  (:action move-disk-to-empty
    :parameters (?d - disk ?under - disk ?to - peg ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-disk ?d ?under)
      (clear ?d)
      (empty ?to)
      (diff-disk ?d ?under)
    )
    :effect (and
      ;; remove disk from above its under-disk, place as bottom on target peg
      (not (on-disk ?d ?under))
      (on-peg ?d ?to)

      ;; target peg is no longer empty
      (not (empty ?to))

      ;; under disk becomes clear (since d was top)
      (clear ?under)

      ;; stage progression
      (not (cur ?s))
      (cur ?t)
    )
  )

  ;; Move a top disk that is on top of another disk onto another disk (target must be top and larger).
  ;; Preconditions: moving disk is top, target disk is top, size ordering, stages advance.
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?tgt - disk ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-disk ?d ?under)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (diff-disk ?d ?tgt)
      (diff-disk ?under ?tgt)
    )
    :effect (and
      ;; detach from under-disk and attach to target disk
      (not (on-disk ?d ?under))
      (on-disk ?d ?tgt)

      ;; under-disk becomes clear, target stops being clear
      (clear ?under)
      (not (clear ?tgt))

      ;; stage progression
      (not (cur ?s))
      (cur ?t)
    )
  )
)