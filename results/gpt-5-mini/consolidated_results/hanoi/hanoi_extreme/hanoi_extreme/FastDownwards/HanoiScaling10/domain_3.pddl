(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)        ; disk is directly on support (disk or peg)
    (clear ?s - support)              ; there is no disk on this support (it is top)
    (smaller ?x - disk ?y - disk)     ; x is smaller than y (strict ordering)
    (current ?t - step)               ; current time/stage
    (next ?t1 - step ?t2 - step)      ; successor relation for stages
  )

  ;; Move a top disk onto an empty peg (peg must be clear)
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?peg - peg ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)           ; d is top of its support
      (clear ?peg)         ; peg has no disk on it (empty)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)        ; support from becomes clear (its top removed)
      (not (clear ?peg))   ; peg no longer clear after placing d
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk onto another top disk (target disk must be clear and larger)
  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?target - disk ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)                 ; d is top of its support
      (clear ?target)            ; target disk is top of its support
      (smaller ?d ?target)       ; can't place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)              ; support from becomes clear
      (not (clear ?target))      ; target disk is no longer clear (d placed on it)
      (not (current ?t))
      (current ?t2)
    )
  )
)