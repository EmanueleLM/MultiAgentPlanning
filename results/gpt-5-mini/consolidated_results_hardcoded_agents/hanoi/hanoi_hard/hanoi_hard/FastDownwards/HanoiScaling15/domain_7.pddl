(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk
    peg
    stage
  )

  (:predicates
    ;; direct support relations
    (on ?d - disk ?s - disk)         ;; disk d is directly on disk s
    (on-peg ?d - disk ?p - peg)     ;; disk d is directly on peg p

    ;; top / empty markers
    (clear-disk ?d - disk)          ;; disk has nothing directly on it (is top of its stack)
    (clear-peg ?p - peg)            ;; peg has nothing directly on it (is empty)

    ;; static size ordering (a is smaller than b)
    (smaller ?a - disk ?b - disk)

    ;; discrete ordered stages (successor relation)
    (succ ?t1 - stage ?t2 - stage)

    ;; marker for the current stage (exactly one true at any time via action effects)
    (current ?t - stage)
  )

  ;; Move a top disk that is directly on a disk to be on top of another disk (must be smaller).
  (:action mover-move-disk-to-disk
    :parameters (?disk - disk ?from - disk ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)
      (clear-disk ?disk)
      (clear-disk ?to)
      (smaller ?disk ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear-disk ?from)        ;; supporting disk becomes top
      (not (clear-disk ?to))    ;; target disk no longer top
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on a disk to an empty peg.
  (:action mover-move-disk-to-peg
    :parameters (?disk - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)
      (clear-disk ?disk)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on ?disk ?from))
      (on-peg ?disk ?to)
      (clear-disk ?from)        ;; the former supporting disk becomes top
      (not (clear-peg ?to))     ;; destination peg now occupied
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on a peg to be on top of another disk (must be smaller).
  (:action mover-move-peg-to-disk
    :parameters (?disk - disk ?from - peg ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?disk ?from)
      (clear-disk ?disk)
      (clear-disk ?to)
      (smaller ?disk ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on-peg ?disk ?from))
      (on ?disk ?to)
      (clear-peg ?from)        ;; source peg becomes empty
      (not (clear-disk ?to))   ;; target disk no longer top
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action mover-move-peg-to-peg
    :parameters (?disk - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on-peg ?disk ?from)
      (clear-disk ?disk)
      (clear-peg ?to)
      (current ?t)
      (succ ?t ?t2)
    )
    :effect (and
      (not (on-peg ?disk ?from))
      (on-peg ?disk ?to)
      (clear-peg ?from)        ;; source peg becomes empty
      (not (clear-peg ?to))    ;; destination peg now occupied
      (not (current ?t))
      (current ?t2)
    )
  )
)