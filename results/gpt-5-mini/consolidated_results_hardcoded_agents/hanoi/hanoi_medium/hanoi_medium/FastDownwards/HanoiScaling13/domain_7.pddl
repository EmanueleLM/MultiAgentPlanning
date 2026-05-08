(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on-peg ?d - disk ?p - peg)      ; disk directly on a peg (bottom-most on that peg)
    (on-disk ?d - disk ?s - disk)    ; disk directly on top of another disk
    (clear-peg ?p - peg)             ; peg has no disks
    (clear-disk ?d - disk)           ; no disk is on top of this disk (it is top of its stack)
    (smaller ?x - disk ?y - disk)    ; x is smaller than y (x may be placed on y)
    (curr ?t - stage)                ; current stage/timepoint
    (next ?t1 - stage ?t2 - stage)   ; successor relation on stages
  )

  ; Move a top disk from one peg to another empty peg (pegs must be distinct).
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (on-peg ?d ?to))
      (not (= ?from ?to))
      (curr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-peg ?from)
      (clear-disk ?d)
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ; Move a top disk from a peg onto the top of another disk.
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (not (on-disk ?d ?to))
      (not (= ?d ?to))
      (curr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-peg ?from)
      (clear-disk ?d)
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ; Move a top disk from on top of a disk onto an empty peg.
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
      (not (on-peg ?d ?to))
      (not (= ?d ?from))
      (curr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (clear-disk ?from)
      (clear-disk ?d)
      (not (curr ?t))
      (curr ?t2)
    )
  )

  ; Move a top disk from on top of a disk onto the top of a different disk.
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-disk ?d ?from)
      (clear-disk ?d)
      (clear-disk ?to)
      (smaller ?d ?to)
      (not (on-disk ?d ?to))
      (not (= ?d ?to))
      (not (= ?from ?to))
      (curr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on-disk ?d ?from))
      (on-disk ?d ?to)
      (not (clear-disk ?to))
      (clear-disk ?from)
      (clear-disk ?d)
      (not (curr ?t))
      (curr ?t2)
    )
  )
)