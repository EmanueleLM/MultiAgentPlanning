(define (domain hanoi-6disk-steps)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ; disk d is directly on peg p
    (on-peg ?d - disk ?p - peg)
    ; disk d is directly on top of disk s
    (on-disk ?d - disk ?s - disk)

    ; a disk has no disk on top of it (is top)
    (clear-disk ?d - disk)
    ; a peg has no disks on it (is empty)
    (clear-peg ?p - peg)

    ; static size ordering: smaller ?a ?b means ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)

    ; discrete step progression
    (next ?s - step ?s2 - step)
    (current ?s - step)
  )

  ; Move a top disk that is directly on a peg to an empty peg (peg->peg).
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      ; advance step
      (not (current ?s))
      (current ?s2)

      ; location update
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ; occupancy updates: source peg becomes empty; destination no longer empty
      (clear-peg ?from)
      (not (clear-peg ?to))
    )
  )

  ; Move a top disk that is directly on a peg onto a larger top disk (peg->disk).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ; source peg becomes empty; destination disk no longer clear
      (clear-peg ?from)
      (not (clear-disk ?to))
    )
  )

  ; Move a top disk that is on top of another disk to an empty peg (disk->peg).
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ; the former support disk becomes clear; destination peg no longer empty
      (clear-disk ?from)
      (not (clear-peg ?to))
    )
  )

  ; Move a top disk that is on top of another disk onto a larger top disk (disk->disk).
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (current ?s))
      (current ?s2)

      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      ; the former support disk becomes clear; destination disk no longer clear
      (clear-disk ?from)
      (not (clear-disk ?to))
    )
  )
)