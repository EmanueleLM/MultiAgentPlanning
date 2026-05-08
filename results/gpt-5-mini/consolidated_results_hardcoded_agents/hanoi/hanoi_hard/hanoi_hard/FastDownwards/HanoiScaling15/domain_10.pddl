(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on ?d - disk ?s - disk)       ; ?d is directly on top of disk ?s
    (on-peg ?d - disk ?p - peg)   ; ?d is directly on peg ?p
    (clear-disk ?d - disk)        ; nothing directly on ?d (it is top of its stack)
    (clear-peg ?p - peg)          ; peg ?p has no disks on it
    (smaller ?a - disk ?b - disk) ; static size ordering: ?a is smaller than ?b
    (succ ?t1 - stage ?t2 - stage) ; successor relation for discrete stages
    (current ?t - stage)          ; marker for the current stage (exactly one true)
  )

  ;; Move a top disk that is directly on another disk onto another disk (target must be larger).
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

      ;; after removal, the supporting disk becomes clear
      (clear-disk ?from)

      ;; the target disk is no longer clear
      (not (clear-disk ?to))

      ;; advance stage (enforces exactly one move per stage)
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on another disk to an empty peg.
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

      ;; after removal, the supporting disk becomes clear
      (clear-disk ?from)

      ;; destination peg is no longer empty
      (not (clear-peg ?to))

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk that is directly on a peg onto another disk (target must be larger).
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

      ;; source peg becomes empty (on-peg implies this disk was directly on the peg)
      (clear-peg ?from)

      ;; target disk no longer clear
      (not (clear-disk ?to))

      ;; advance stage
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

      ;; source peg becomes empty
      (clear-peg ?from)

      ;; destination peg is no longer empty
      (not (clear-peg ?to))

      ;; advance stage
      (not (current ?t))
      (current ?t2)
    )
  )
)