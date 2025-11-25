(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?support - disk)    ; disk ?d is immediately on disk ?support
    (on-peg ?d - disk ?p - peg)       ; disk ?d is immediately on peg ?p
    (clear-disk ?d - disk)            ; no disk is immediately on ?d (it is top)
    (clear-peg ?p - peg)              ; peg ?p has no disks on it (empty)
    (smaller ?d1 - disk ?d2 - disk)   ; static size ordering: ?d1 is smaller than ?d2
    (next ?s1 - step ?s2 - step)      ; temporal successor relation between steps
    (current ?s - step)               ; which step is currently active
  )

  ;; Move a disk that is currently directly on a peg onto another empty peg.
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (clear-peg ?from)
      (not (clear-peg ?to))

      (clear-disk ?d)
    )
  )

  ;; Move a disk that is currently directly on a peg onto another disk (stacking).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?top - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?top)
      (smaller ?d ?top)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on ?d ?top)

      (clear-peg ?from)

      (not (clear-disk ?top))
      (clear-disk ?d)
    )
  )

  ;; Move a disk that is currently on top of another disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (on ?d ?from))
      (on-peg ?d ?to)

      (clear-disk ?from)

      (not (clear-peg ?to))
      (clear-disk ?d)
    )
  )

  ;; Move a disk that is currently on top of another disk onto another disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?top - disk ?s1 - step ?s2 - step)
    :precondition (and
      (current ?s1)
      (next ?s1 ?s2)
      (on ?d ?from)
      (clear-disk ?d)
      (clear-disk ?top)
      (smaller ?d ?top)
    )
    :effect (and
      (not (current ?s1))
      (current ?s2)

      (not (on ?d ?from))
      (on ?d ?top)

      (clear-disk ?from)

      (not (clear-disk ?top))
      (clear-disk ?d)
    )
  )
)