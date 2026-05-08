(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)     ; disk directly on a peg
    (on-disk ?d - disk ?s - disk)   ; disk directly on another disk
    (clear-disk ?d - disk)          ; disk has nothing on top
    (clear-peg ?p - peg)            ; peg has nothing on top
    (current ?t - stage)            ; current stage/timepoint
    (next ?t1 - stage ?t2 - stage)  ; stage successor relation
    (smaller ?d1 - disk ?d2 - disk) ; size ordering: d1 smaller than d2
  )

  ;; Move top disk from a peg to an empty peg
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (clear-peg ?from)
      (not (clear-peg ?to))

      (clear-disk ?d)

      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move top disk from a disk to an empty peg
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)

      (clear-disk ?from)
      (not (clear-peg ?to))

      (clear-disk ?d)

      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move top disk from a peg onto a top disk (must be smaller)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)

      (clear-peg ?from)
      (not (clear-disk ?to))

      (clear-disk ?d)

      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move top disk from a disk onto a top disk (must be smaller)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)

      (clear-disk ?from)
      (not (clear-disk ?to))

      (clear-disk ?d)

      (not (current ?t))
      (current ?t2)
    )
  )
)