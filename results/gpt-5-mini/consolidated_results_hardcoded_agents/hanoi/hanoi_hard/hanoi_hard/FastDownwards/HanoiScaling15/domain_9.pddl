(define (domain hanoi6)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk
    peg
    stage
  )

  (:predicates
    ;; direct support relations
    (on ?d - disk ?s - disk)         ;; disk ?d is directly on disk ?s
    (on-peg ?d - disk ?p - peg)     ;; disk ?d is directly on peg ?p

    ;; top / empty markers
    (clear-disk ?d - disk)          ;; disk ?d has nothing directly on it (is top of its stack)
    (clear-peg ?p - peg)            ;; peg ?p has nothing directly on it (is empty)

    ;; static size ordering (a is smaller than b)
    (smaller ?a - disk ?b - disk)

    ;; discrete ordered stages (successor relation)
    (succ ?t1 - stage ?t2 - stage)

    ;; marker for the current stage (exactly one true at any time via action effects)
    (current ?t - stage)
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
      ;; remove old support relation and add new support relation
      (not (on ?disk ?from))
      (on ?disk ?to)

      ;; supporting disk becomes top (clear)
      (clear-disk ?from)

      ;; target disk is no longer clear (it has ?disk on it)
      (not (clear-disk ?to))

      ;; advance stage: only one current at a time
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

      ;; supporting disk becomes top
      (clear-disk ?from)

      ;; destination peg is no longer empty
      (not (clear-peg ?to))

      ;; stage progression (enforces single move per stage)
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

      ;; source peg becomes empty (disk on-peg implies it was the only disk on that peg)
      (clear-peg ?from)

      ;; target disk no longer clear
      (not (clear-disk ?to))

      ;; stage progression
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

      ;; stage progression
      (not (current ?t))
      (current ?t2)
    )
  )
)