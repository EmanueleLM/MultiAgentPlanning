(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ; disk is directly on peg
    (on-peg ?d - disk ?p - peg)
    ; disk is directly on another disk
    (on-disk ?d - disk ?s - disk)
    ; no disk directly on top of this disk (it is the top of its stack)
    (clear-disk ?d - disk)
    ; peg has no disk directly on it (i.e., peg is empty)
    (clear-peg ?p - peg)
    ; size ordering: ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)
  )

  ; Move a top disk that is directly on a peg to another empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      ; origin peg becomes empty (true)
      (clear-peg ?from)
      ; destination peg is no longer empty
      (not (clear-peg ?to))
      ; moved disk remains clear (it is top at destination)
      (clear-disk ?d)
    )
  )

  ; Move a top disk that is directly on a peg to be directly on top of another disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      ; origin peg becomes empty
      (clear-peg ?from)
      ; destination disk now has a disk on top, so it's not clear
      (not (clear-disk ?to))
      ; moved disk is now clear (top)
      (clear-disk ?d)
    )
  )

  ; Move a top disk that is directly on another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      ; the disk that was below becomes clear (top of its stack)
      (clear-disk ?from)
      ; destination peg is no longer empty
      (not (clear-peg ?to))
      ; moved disk is clear (top)
      (clear-disk ?d)
    )
  )

  ; Move a top disk that is directly on another disk to be directly on top of another disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      ; the disk that was below becomes clear (top)
      (clear-disk ?from)
      ; destination disk is no longer clear
      (not (clear-disk ?to))
      ; moved disk is clear (top)
      (clear-disk ?d)
    )
  )
)