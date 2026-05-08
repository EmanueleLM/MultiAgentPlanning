(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support step)

  (:predicates
    (on ?d - disk ?s - support)            ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - support)                   ; nothing directly on support ?s (disk or peg)
    (smaller ?d1 - disk ?d2 - disk)        ; ?d1 is smaller than ?d2 (static)
    (current ?st - step)                   ; current stage
    (next ?st - step ?st2 - step)          ; successor relation between stages
    (different ?x - support ?y - support)  ; explicit inequality between supports
  )

  ;; Move a top disk from any support (?from) onto an empty peg (?to)
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from any support (?from) onto another disk (?to), respecting size ordering
  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (different ?from ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)