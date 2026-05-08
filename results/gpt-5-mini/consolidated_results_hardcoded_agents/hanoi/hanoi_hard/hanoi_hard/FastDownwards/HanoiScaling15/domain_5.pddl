(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    stage
    disk peg - support
  )

  (:predicates
    ;; disk d is directly on support s (s is a disk or a peg)
    (on ?d - disk ?s - support)

    ;; support s has nothing directly on it (top-of-stack / empty peg)
    (clear ?s - support)

    ;; static size ordering: ?a is smaller than ?b
    (smaller ?a - disk ?b - disk)

    ;; discrete ordered stages (successor relation)
    (succ ?t1 - stage ?t2 - stage)

    ;; marker for the current stage (unique in a valid trajectory)
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
      (not (on ?disk ?to))    ;; prevent no-op when already there
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)           ;; the source peg becomes clear after removing its top disk
      (not (clear ?to))       ;; destination peg now has something on it
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
  (:action mover-move-disk-to-peg
    :parameters (?disk - disk ?from - disk ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)        ;; disk is directly on some supporting disk
      (clear ?disk)           ;; disk is top of its stack
      (clear ?to)             ;; destination peg is empty (top)
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)           ;; the disk that supported ?disk becomes clear (now top)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on a peg to stack on top of another disk (must be smaller).
  (:action mover-move-peg-to-disk
    :parameters (?disk - disk ?from - peg ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)        ;; disk is directly on the source peg
      (clear ?disk)           ;; disk is top
      (clear ?to)             ;; target disk is top of its stack
      (smaller ?disk ?to)     ;; moved disk must be smaller than target disk
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)           ;; source peg becomes clear
      (not (clear ?to))       ;; target disk no longer clear (has disk on top)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on another disk to stack on top of another disk (must be smaller).
  (:action mover-move-disk-to-disk
    :parameters (?disk - disk ?from - disk ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?disk ?from)        ;; disk is directly on some supporting disk
      (clear ?disk)           ;; disk is top
      (clear ?to)             ;; target disk is top
      (smaller ?disk ?to)     ;; size ordering: moved disk smaller than target disk
      (current ?t)
      (succ ?t ?t2)
      (not (on ?disk ?to))
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (clear ?from)           ;; the former supporting disk becomes clear (now top)
      (not (clear ?to))       ;; target disk no longer clear
      (not (current ?t))
      (current ?t2)
    )
  )
)