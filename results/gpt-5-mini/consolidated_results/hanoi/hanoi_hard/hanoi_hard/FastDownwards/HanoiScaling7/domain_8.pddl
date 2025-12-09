(define (domain hanoi-6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg time)

  (:predicates
    ;; disk stacking relations
    (on-disk ?d - disk ?under - disk)   ; ?d directly on top of another disk ?under
    (on-peg  ?d - disk ?p - peg)        ; ?d directly on top of peg ?p

    ;; clear status for supports (disks or pegs)
    (clear-disk ?d - disk)              ; nothing on top of disk ?d
    (clear-peg ?p - peg)                ; nothing on top of peg ?p

    ;; size ordering
    (larger ?big - disk ?small - disk)

    ;; discrete time model
    (now ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  ;; Move a disk that is on another disk, to a destination peg
  (:action move-from-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
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
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Move a disk that is on a peg, to another peg
  (:action move-from-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
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
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Move a disk that is on another disk, to another disk (requires size ordering)
  (:action move-from-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (clear-disk ?from)
      (not (clear-disk ?to))
      (not (now ?t))
      (now ?t2)
    )
  )

  ;; Move a disk that is on a peg, to a disk (requires size ordering)
  (:action move-from-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - time ?t2 - time)
    :precondition (and
      (now ?t)
      (next ?t ?t2)
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (clear-peg ?from)
      (not (clear-disk ?to))
      (not (now ?t))
      (now ?t2)
    )
  )
)