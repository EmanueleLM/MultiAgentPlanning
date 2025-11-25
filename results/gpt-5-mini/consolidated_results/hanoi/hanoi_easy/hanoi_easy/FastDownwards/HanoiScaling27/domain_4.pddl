(define (domain hanoi-mover-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-disk ?d - disk ?under - disk)
    (on-peg ?d - disk ?peg - peg)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (succ ?s1 - stage ?s2 - stage)
    (now ?s - stage)
  )

  ;; Move top disk from a peg onto an empty peg (advances stage).
  (:action mover-move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (clear-disk ?d)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move top disk from a peg onto a top disk (destination disk must be larger), advancing stage.
  (:action mover-move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
      (clear-disk ?d)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move top disk from a disk onto an empty peg, advancing stage.
  (:action mover-move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
      (clear-disk ?d)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move top disk from a disk onto a top disk (destination disk must be larger), advancing stage.
  (:action mover-move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
      (clear-disk ?d)
      (not (now ?s))
      (now ?s2)
    )
  )
)