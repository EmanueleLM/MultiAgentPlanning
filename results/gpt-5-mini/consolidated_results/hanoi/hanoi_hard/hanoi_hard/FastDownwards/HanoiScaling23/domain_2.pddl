(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types support stage disk peg - support)

  (:predicates
    (on ?d - disk ?s - support)        ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - support)              ; nothing directly on support ?s
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is strictly smaller than ?d2
    (current ?st - stage)             ; current stage marker
    (next ?st - stage ?st1 - stage)   ; successor relation between stages
    (different ?s1 - support ?s2 - support) ; syntactic distinctness for supports
  )

  ;; Move a top disk from a peg onto another peg (advances the stage)
  (:action move-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg ?st - stage ?st1 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (different ?from ?to)
      (current ?st)
      (next ?st ?st1)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?st))
      (current ?st1)
    )
  )

  ;; Move a top disk from a peg onto a disk (destination disk must be larger) (advances stage)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?st - stage ?st1 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (different ?from ?to)
      (current ?st)
      (next ?st ?st1)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?st))
      (current ?st1)
    )
  )

  ;; Move a top disk from a disk onto a peg (advances stage)
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg ?st - stage ?st1 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (different ?from ?to)
      (current ?st)
      (next ?st ?st1)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?st))
      (current ?st1)
    )
  )

  ;; Move a top disk from one disk onto another disk (destination must be larger) (advances stage)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk ?st - stage ?st1 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (different ?from ?to)
      (current ?st)
      (next ?st ?st1)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current ?st))
      (current ?st1)
    )
  )
)