(define (domain hanoi7)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support stage - object
    disk peg - support
  )

  (:predicates
    (on ?d - disk ?s - support)          ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - support)                 ; there is no disk directly on support ?s
    (smaller ?d1 - disk ?d2 - disk)      ; static size ordering: ?d1 is strictly smaller than ?d2
    (current ?t - stage)                 ; the current discrete stage token
    (next ?t1 - stage ?t2 - stage)       ; successor relation between stages
  )

  ;; Move a top disk (?d) from a support (?from) to an empty peg (?to),
  ;; consuming the current stage ?t and producing its successor ?t2.
  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )

  ;; Move a top disk (?d) from a support (?from) onto another disk (?to),
  ;; requiring ?d to be smaller than ?to, and advancing the stage token.
  (:action move-to-disk
    :parameters (?d - disk ?from - support ?to - disk ?t - stage ?t2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?t))
      (current ?t2)
    )
  )
)