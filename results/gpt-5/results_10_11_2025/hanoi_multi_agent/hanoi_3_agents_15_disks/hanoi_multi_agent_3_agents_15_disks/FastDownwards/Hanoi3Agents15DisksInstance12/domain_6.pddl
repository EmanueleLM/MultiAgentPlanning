(define (domain hanoi-3peg-15-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    stage
    place
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?x - place)
    (clear ?x - place)
    (can-stack ?d - disk ?x - place)
    (at ?s - stage)
    (succ ?s - stage ?n - stage)
  )
  (:action move
    :parameters (?d - disk ?from - place ?to - place ?s - stage ?n - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-stack ?d ?to)
      (not (on ?d ?to))
      (at ?s)
      (succ ?s ?n)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?s))
      (at ?n)
    )
  )
)