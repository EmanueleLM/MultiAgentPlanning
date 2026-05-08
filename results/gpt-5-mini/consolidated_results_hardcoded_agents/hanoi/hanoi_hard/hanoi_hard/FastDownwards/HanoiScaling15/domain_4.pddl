(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg - object
    stage
  )

  (:predicates
    ;; disk d is directly on support s (s is either a disk or a peg)
    (on ?d - disk ?s - object)

    ;; nothing is directly on support s (top-of-stack / empty peg)
    (clear ?s - object)

    ;; static size ordering: ?a is smaller than ?b
    (smaller ?a - disk ?b - disk)

    ;; discrete ordered stages (successor relation)
    (succ ?t1 - stage ?t2 - stage)

    ;; marker for the current stage
    (current ?t - stage)
  )

  ;; Move a top disk that is directly on a peg to an empty peg.
  (:action mover-move-peg-to-peg
    :parameters (?disk - disk ?from - peg ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)        ;; disk is directly on the source peg
      (clear ?disk)           ;; disk is top (nothing above it)
      (clear ?to)             ;; destination peg is empty (top)
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))    ;; avoid no-op / same-support moves
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)           ;; source peg becomes empty
      (not (clear ?to))       ;; destination peg no longer empty
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action mover-move-disk-to-peg
    :parameters (?disk - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)        ;; disk on another disk
      (clear ?disk)           ;; disk is top of its stack
      (clear ?to)             ;; destination peg is empty
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)           ;; the disk that supported ?disk becomes top
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on a peg to stack on top of another disk (must be smaller).
  (:action mover-move-peg-to-disk
    :parameters (?disk - disk ?from - peg ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)        ;; disk on a peg
      (clear ?disk)           ;; disk is top
      (clear ?to)             ;; target disk is top of its stack
      (smaller ?disk ?to)     ;; size constraint: moved disk smaller than target disk
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)           ;; source peg becomes empty
      (not (clear ?to))       ;; target disk no longer clear (now has disk on top)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on another disk to stack on top of another disk (must be smaller).
  (:action mover-move-disk-to-disk
    :parameters (?disk - disk ?from - disk ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)        ;; disk on a disk
      (clear ?disk)           ;; disk is top
      (clear ?to)             ;; target disk is top
      (smaller ?disk ?to)     ;; size ordering
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)           ;; the former supporting disk becomes top
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )
)