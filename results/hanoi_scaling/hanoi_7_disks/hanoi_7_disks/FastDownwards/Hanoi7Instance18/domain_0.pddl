(define (domain hanoi-domain)
  (:requirements :strips :typing)
  (:types disk peg)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?d2 - disk)
    (clear-disk ?d - disk)
    (clear-peg ?p - peg)
    (larger ?d1 - disk ?d2 - disk)
  )

  ;; Move a top disk from a peg onto an empty peg
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
      (not (clear-peg ?to))
      (clear-peg ?from)
    )
  )

  ;; Move a top disk from a peg onto a larger disk
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?below - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?below)
      (larger ?below ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?below)
      (not (clear-disk ?below))
      (clear-peg ?from)
    )
  )

  ;; Move a top disk from on top of a disk onto an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?under - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?to)
      (clear-disk ?under)
      (not (clear-peg ?to))
    )
  )

  ;; Move a top disk from on top of a disk onto a larger disk
  (:action move-disk-to-disk
    :parameters (?d - disk ?under - disk ?below - disk)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-disk ?below)
      (larger ?below ?d)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-disk ?d ?below)
      (clear-disk ?under)
      (not (clear-disk ?below))
    )
  )

)