(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)        ; disk is directly on support (disk or peg)
    (clear ?s - support)              ; there is no disk on this support (top)
    (smaller ?x - disk ?y - disk)     ; x is smaller than y
    (current ?t - step)               ; current time/stage
    (next ?t1 - step ?t2 - step)      ; successor relation for stages
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - support ?peg - peg ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)           ; disk d has nothing on it (it's top)
      (clear ?peg)         ; target peg is empty (placing onto peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)        ; support from becomes clear (its top removed)
      (not (clear ?peg))   ; peg is no longer clear after placing d
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
      (clear ?target)            ; target disk has nothing on it (is top)
      (smaller ?d ?target)       ; cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)              ; support from becomes clear
      (not (clear ?target))      ; target disk is no longer clear
      (not (current ?t))
      (current ?t2)
    )
  )
)