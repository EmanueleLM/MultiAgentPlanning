(define (domain tower-of-hanoi-5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg stage)

  (:predicates
    (on ?upper - disk ?lower - disk)
    (top ?p - peg ?d - disk)
    (smaller ?x - disk ?y - disk)
    (is-base ?d - disk)
    (successor ?s - stage ?s2 - stage)
    (stage-active ?s - stage)
    (different ?p1 - peg ?p2 - peg)
  )

  (:action move
    :parameters (?d - disk
                 ?below - disk
                 ?from - peg
                 ?destTop - disk
                 ?to - peg
                 ?s - stage
                 ?s2 - stage)
    :precondition (and
      (top ?from ?d)
      (on ?d ?below)
      (top ?to ?destTop)
      (not (is-base ?d))
      (not (smaller ?destTop ?d))
      (stage-active ?s)
      (successor ?s ?s2)
      (different ?from ?to)
    )
    :effect (and
      (not (top ?from ?d))
      (top ?from ?below)
      (not (top ?to ?destTop))
      (top ?to ?d)
      (not (on ?d ?below))
      (on ?d ?destTop)
      (not (stage-active ?s))
      (stage-active ?s2)
    )
  )
)