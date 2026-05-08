(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - support
    stage
    support
  )

  (:predicates
    (on ?d - disk ?s - support)        ; disk directly on a support (peg or disk)
    (clear ?s - support)               ; support has nothing directly on it (is top)
    (smaller ?a - disk ?b - disk)      ; static size ordering: ?a is smaller than ?b
    (succ ?t1 - stage ?t2 - stage)     ; discrete ordered stages
    (current ?t - stage)               ; marker for the current stage
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action mover-move-peg-to-peg
    :parameters (?disk - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?to)
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action mover-move-disk-to-peg
    :parameters (?disk - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?to)
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on a peg to stack on top of another disk (must be smaller).
  (:action mover-move-peg-to-disk
    :parameters (?disk - disk ?from - peg ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?to)
      (smaller ?disk ?to)
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on another disk to stack on top of another disk (must be smaller).
  (:action mover-move-disk-to-disk
    :parameters (?disk - disk ?from - disk ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?to)
      (smaller ?disk ?to)
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )
)