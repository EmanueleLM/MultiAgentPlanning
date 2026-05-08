(define (domain tower-of-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - support stage)

  (:predicates
    (on ?d - disk ?s - support)       ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - support)             ; support ?s has nothing directly on it (is top / empty)
    (smaller ?a - disk ?b - disk)    ; static size ordering: ?a is strictly smaller than ?b
    (next ?t1 - stage ?t2 - stage)   ; discrete stage successor relation
    (at-stage ?t - stage)            ; current stage marker (exactly one holds)
  )

  (:action move-to-peg
    :parameters (?d - disk ?from - support ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move-onto-disk
    :parameters (?d - disk ?from - support ?t - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (not (clear ?t))
      (clear ?from)
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)