(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)        ; disk is directly on support (disk or peg)
    (clear ?s - support)              ; there is no disk on this support (it is top)
    (smaller ?x - disk ?y - disk)     ; x is smaller than y (strict ordering)
    (current ?t - step)               ; current stage/timepoint
    (next ?t1 - step ?t2 - step)      ; successor relation for stages
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)           ; d is top of its support
      (clear ?to)          ; destination peg top must be empty
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)        ; the support that d was on becomes top (clear)
      (not (clear ?to))    ; destination peg is no longer clear
      (not (current ?t))
      (current ?t2)
    )
  )

  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?target - disk ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)                 ; d is top of its support
      (clear ?target)            ; target disk is top of its support
      (smaller ?d ?target)       ; d must be smaller than target
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)              ; the support that d was on becomes top (clear)
      (not (clear ?target))      ; target disk is no longer clear
      (not (current ?t))
      (current ?t2)
    )
  )
)