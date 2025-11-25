(define (domain hanoi_staged)
  :requirements :strips :typing :negative-preconditions
  :types disk peg stage

  :predicates
    (on ?d - disk ?s - (either disk peg))
    (clear ?s - (either disk peg))
    (smaller ?d - disk ?s - (either disk peg))
    (current-stage ?st - stage)
    (succ ?s1 - stage ?s2 - stage)

  (:action move
    :parameters (?d - disk ?from - (either disk peg) ?to - (either disk peg) ?st - stage ?nst - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (current-stage ?st)
      (succ ?st ?nst)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current-stage ?st))
      (current-stage ?nst)
    )
  )
)