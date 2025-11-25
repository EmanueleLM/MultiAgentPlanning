(define (domain hanoi)
  (:requirements :typing :strips :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ; disk d is immediately on disk support
    (on ?d - disk ?support - disk)
    ; disk d is immediately on peg p (bottom disk of that peg's stack)
    (on-peg ?d - disk ?p - peg)
    ; no disk is immediately on ?d (it is top of its stack)
    (clear-disk ?d - disk)
    ; peg has no disks
    (clear-peg ?p - peg)
    ; static size ordering: smaller d1 d2 means d1 is smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ; temporal successor between steps
    (next ?s1 - step ?s2 - step)
    ; which step is currently active
    (current ?s - step)
  )

  ;; Move a top disk that is currently directly on a peg onto another empty peg.
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

      ; move relations
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ; source peg becomes empty (since ?d was the only disk on ?from)
      (clear-peg ?from)

      ; destination peg becomes non-empty
      (not (clear-peg ?to))

      ; moved disk remains top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is currently directly on a peg onto another disk (stacking).
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

      ; move relations
      (not (on-peg ?d ?from))
      (on ?d ?top)

      ; source peg becomes empty
      (clear-peg ?from)

      ; the disk that received ?d is no longer clear
      (not (clear-disk ?top))

      ; moved disk is top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is currently on top of another disk onto an empty peg.
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

      ; move relations
      (not (on ?d ?from))
      (on-peg ?d ?to)

      ; the disk that supported ?d becomes top
      (clear-disk ?from)

      ; destination peg becomes non-empty
      (not (clear-peg ?to))

      ; moved disk is top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk that is currently on top of another disk onto another disk.
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

      ; move relations
      (not (on ?d ?from))
      (on ?d ?top)

      ; the disk that supported ?d becomes top
      (clear-disk ?from)

      ; top disk is no longer clear
      (not (clear-disk ?top))

      ; moved disk is top
      (clear-disk ?d)
    )
  )
)