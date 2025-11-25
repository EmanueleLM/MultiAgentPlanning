(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    ;; relations encoding the immediate support:
    (on-peg ?d - disk ?p - peg)    ;; disk directly on a peg
    (on-disk ?d - disk ?p - disk)  ;; disk directly on another disk

    ;; top/clear predicates for pegs and disks
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)

    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk)

    ;; explicit discrete-stage progression
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk from a peg onto an empty peg (advance stage).
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      ;; advance stage token
      (not (current ?s))
      (current ?s2)

      ;; update support relations
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      ;; update clear predicates for pegs
      (clear-peg ?from)
      (not (clear-peg ?to))

      ;; the moved disk remains clear on top at its new location
      (clear-disk ?d)
    )
  )

  ;; Move a top disk from a disk onto an empty peg (advance stage).
  (:action move-disk-to-peg
    :parameters (?d - disk ?below - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      ;; advance stage token
      (not (current ?s))
      (current ?s2)

      ;; update support relations
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      ;; below disk becomes clear (its top was removed)
      (clear-disk ?below)

      ;; update peg clear predicates
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk from a peg onto a disk (advance stage).
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; advance stage token
      (not (current ?s))
      (current ?s2)

      ;; update support relations
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      ;; update clears: source peg becomes clear, target disk no longer clear
      (clear-peg ?from)
      (not (clear-disk ?to))

      ;; moved disk remains clear on top
      (clear-disk ?d)
    )
  )

  ;; Move a top disk from a disk onto a disk (advance stage).
  (:action move-disk-to-disk
    :parameters (?d - disk ?below - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on-disk ?d ?below)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      ;; advance stage token
      (not (current ?s))
      (current ?s2)

      ;; update support relations
      (not (on-disk ?d ?below))
      (on-disk ?d ?to)

      ;; below disk becomes clear, target disk no longer clear
      (clear-disk ?below)
      (not (clear-disk ?to))

      ;; moved disk remains clear on top
      (clear-disk ?d)
    )
  )
)