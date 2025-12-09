(define (domain tower-of-hanoi-staged)
  (:requirements :strips :typing :negative-preconditions)
  ;; declare disk and peg as subtypes of place
  (:types disk peg - place stage)

  (:predicates
    ;; stage progression
    (next ?s1 - stage ?s2 - stage)
    (at-stage ?s - stage)

    ;; stacking and top predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)

    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; move disk onto an empty peg
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?snext - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?snext)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (on ?d ?to))
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

  ;; move disk onto another disk (must be smaller than the disk below)
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?snext - stage)
    :precondition (and
      (at-stage ?s)
      (next ?s ?snext)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (on ?d ?to))
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