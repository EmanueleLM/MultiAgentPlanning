(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    (on ?d - disk ?s - support)        ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - support)              ; nothing directly on support ?s (top-of-stack)
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is strictly smaller than ?d2
    (current ?st - stage)             ; current stage marker
    (next ?st - stage ?st1 - stage)   ; successor relation between stages
    (different ?s1 - support ?s2 - support) ; explicit distinctness for supports
  )

  ;; Move a top disk from an empty peg onto an empty peg (advances the stage)
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

  ;; Move a top disk from an empty peg onto a top disk (destination disk must be on some support and larger) (advances stage)
  (:action move-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk ?to-parent - support ?st - stage ?st1 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (different ?from ?to)
      (on ?to ?to-parent)
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

  ;; Move a top disk from a top disk onto an empty peg (advances stage)
  (:action move-disk-to-peg
    :parameters (?d - disk ?from - disk ?from-parent - support ?to - peg ?st - stage ?st1 - stage)
    :precondition (and
      (on ?d ?from)
      (on ?from ?from-parent)
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

  ;; Move a top disk from a top disk onto another top disk (destination must be larger and on some support) (advances stage)
  (:action move-disk-to-disk
    :parameters (?d - disk ?from - disk ?from-parent - support ?to - disk ?to-parent - support ?st - stage ?st1 - stage)
    :precondition (and
      (on ?d ?from)
      (on ?from ?from-parent)
      (on ?to ?to-parent)
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