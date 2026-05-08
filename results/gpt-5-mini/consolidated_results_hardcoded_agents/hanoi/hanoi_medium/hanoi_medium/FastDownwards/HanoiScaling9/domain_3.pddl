(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    (on ?d - disk ?s - support)        ; ?d is directly on support ?s (disk or peg)
    (clear ?s - support)              ; nothing is directly on support ?s (peg empty or disk has no disk on it)
    (curr ?st - stage)                ; current stage/timepoint
    (next ?st - stage ?st2 - stage)   ; successor-stage relation
    (smaller ?d1 - disk ?d2 - disk)   ; d1 is smaller than d2 (d1 may be placed on d2)
  )

  ;; Move a top disk to an empty peg (target must be a peg).
  (:action move-to-empty
    :parameters (?d - disk ?from - support ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (on ?d ?from)       ; ?d is directly on ?from
      (clear ?d)          ; ?d has nothing on top (it's the top disk on its support)
      (clear ?to)         ; target peg is empty
      (curr ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; after removing ?d, its former support has nothing directly on it
      (not (clear ?to))   ; target peg now has ?d on it
      (not (curr ?s))
      (curr ?snext)
    )
  )

  ;; Move a top disk onto another disk (target must be a disk and larger than moved disk).
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?s - stage ?snext - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)         ; nothing currently on top of target disk
      (smaller ?d ?to)    ; size constraint: moved disk smaller than target disk
      (curr ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (curr ?s))
      (curr ?snext)
    )
  )
)