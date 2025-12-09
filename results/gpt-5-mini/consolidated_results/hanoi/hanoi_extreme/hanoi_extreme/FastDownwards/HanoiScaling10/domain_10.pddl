(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)      ; disk directly on support (disk or peg)
    (clear ?s - support)             ; support has no disk on top
    (smaller ?x - disk ?y - disk)    ; x is smaller than y
    (current ?t - step)              ; current time/stage
    (next ?t1 - step ?t2 - step)     ; successor relation on steps (linear ordering)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - step ?t2 - step)
    :precondition (and
      (current ?t)
      (next ?t ?t2)
      (on ?d ?from)
      (clear ?d)          ; ?d is the top disk on its support
      (clear ?to)         ; destination peg must be empty (top clear)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; support ?from becomes clear after removing ?d
      (not (clear ?to))   ; destination peg no longer clear
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
      (clear ?d)            ; ?d is the top disk on its support
      (clear ?target)       ; target disk must have no disk on top
      (smaller ?d ?target)  ; cannot place larger on smaller
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?target)
      (clear ?from)         ; support ?from becomes clear after removing ?d
      (not (clear ?target)) ; target disk no longer clear
      (not (current ?t))
      (current ?t2)
    )
  )
)