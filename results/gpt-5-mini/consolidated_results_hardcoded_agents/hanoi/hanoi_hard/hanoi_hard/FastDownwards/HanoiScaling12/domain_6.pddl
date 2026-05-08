(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types surface stage disk peg - surface)

  (:predicates
    ;; stage progression
    (next ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)

    ;; stacking and clear/top predicates: surfaces are pegs or disks
    (on ?d - disk ?x - surface)
    (clear ?x - surface)

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; move a top disk onto an empty peg (target is a peg surface)
  (:action move-to-peg
    :parameters (?d - disk ?from - surface ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?snext)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )

  ;; move a top disk onto another disk (target must be larger)
  (:action move-onto-disk
    :parameters (?d - disk ?from - surface ?to - disk ?s - stage ?snext - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?snext)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-stage ?s))
      (at-stage ?snext)
    )
  )
)