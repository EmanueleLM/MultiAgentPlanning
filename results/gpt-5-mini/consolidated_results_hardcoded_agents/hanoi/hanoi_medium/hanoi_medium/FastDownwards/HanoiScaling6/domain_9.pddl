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
    (clear ?d - disk)  ; disk has no disk on top (is movable)
    (empty ?p - peg)   ; peg has no disks

    ;; static ordering and distinctness helpers
    (smaller ?a - disk ?b - disk)
    (diff-peg ?p1 - peg ?p2 - peg)
    (diff-disk ?d1 - disk ?d2 - disk)
  )

  ;; Move a disk that is the sole disk on its peg onto an empty peg.
  (:action move-peg-to-empty
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-peg ?d ?from)
      (clear ?d)            ; top and sole disk on that peg
      (empty ?to)
      (diff-peg ?from ?to)
    )
    :effect (and
      ;; move support from source peg to destination peg
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; target peg is no longer empty, source becomes empty
      (not (empty ?to))
      (empty ?from)

      ;; moved disk remains clear (top)
      (clear ?d)

      ;; stage progression: advance current step
      (not (cur ?s))
      (cur ?t)
    )
  )

  ;; Move a disk that is the sole disk on its peg onto another disk (target must be top and larger).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?tgt - disk ?s - step ?t - step)
    :precondition (and
      (cur ?s)
      (succ ?s ?t)
      (on-peg ?d ?from)
      (clear ?d)            ; moving disk is sole disk on its peg
      (clear ?tgt)          ; target disk is top of its stack
      (smaller ?d ?tgt)
      (diff-disk ?d ?tgt)
    )
    :effect (and
      ;; detach from source peg, attach to target disk
      (not (on-peg ?d ?from))
      (on-disk ?d ?tgt)

      ;; source peg becomes empty
      (empty ?from)

      ;; target disk is no longer clear
      (not (clear ?tgt))

      ;; moved disk is top
      (clear ?d)

      ;; stage progression
      (not (cur ?s))
      (cur ?t)
    )
  )

  ;; Move a top disk that is on top of another disk onto an empty peg.
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
      ;; remove disk-from-disk support, place as bottom on target peg
      (not (on-disk ?d ?under))
      (on-peg ?d ?to)

      ;; target peg is no longer empty
      (not (empty ?to))

      ;; the under-disk becomes clear (its top removed)
      (clear ?under)

      ;; moved disk is top
      (clear ?d)

      ;; stage progression
      (not (cur ?s))
      (cur ?t)
    )
  )

  ;; Move a top disk that is on top of another disk onto another disk (target must be top and larger).
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

      ;; under-disk becomes clear, target disk no longer clear
      (clear ?under)
      (not (clear ?tgt))

      ;; moved disk is top
      (clear ?d)

      ;; stage progression
      (not (cur ?s))
      (cur ?t)
    )
  )
)