(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg phase)

  (:predicates
    ; disk location predicates:
    (on-peg ?d - disk ?p - peg)        ; disk is directly on a peg (top disk on that peg)
    (on-disk ?d - disk ?under - disk)  ; disk is directly on another disk

    ; top/empty markers:
    (clear-peg ?p - peg)               ; no disk is directly on this peg
    (clear-disk ?d - disk)             ; no disk is directly on this disk

    ; static size ordering:
    (smaller ?a - disk ?b - disk)      ; ?a is smaller than ?b

    ; discrete move phases (linear progression):
    (current-phase ?ph - phase)
    (next ?p1 - phase ?p2 - phase)
  )

  ; Move a top disk from one peg to another empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?ph - phase ?phnext - phase)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current-phase ?ph)
      (next ?ph ?phnext)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (not (clear-peg ?to))
      (clear-peg ?from)

      (not (current-phase ?ph))
      (current-phase ?phnext)
    )
  )

  ; Move a top disk from a peg onto a top disk (must be smaller)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?ph - phase ?phnext - phase)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current-phase ?ph)
      (next ?ph ?phnext)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (not (clear-disk ?to))
      (clear-peg ?from)

      (not (current-phase ?ph))
      (current-phase ?phnext)
    )
  )

  ; Move a top disk from on top of another disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?ph - phase ?phnext - phase)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (current-phase ?ph)
      (next ?ph ?phnext)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      ; the disk that was under ?d becomes top (clear)
      (clear-disk ?from)
      (not (clear-peg ?to))

      (not (current-phase ?ph))
      (current-phase ?phnext)
    )
  )

  ; Move a top disk from on top of one disk onto another top disk (must be smaller)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?ph - phase ?phnext - phase)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (current-phase ?ph)
      (next ?ph ?phnext)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      (not (clear-disk ?to))
      (clear-disk ?from)

      (not (current-phase ?ph))
      (current-phase ?phnext)
    )
  )
)