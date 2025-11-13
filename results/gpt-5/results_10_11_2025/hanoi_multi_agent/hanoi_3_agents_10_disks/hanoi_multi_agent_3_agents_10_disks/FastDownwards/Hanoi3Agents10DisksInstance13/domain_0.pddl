(define (domain hanoi-agents-3peg-10disk)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent peg disk step
  )
  (:predicates
    ; location of each disk
    (at ?d - disk ?p - peg)
    ; optional structural predicates (declared for completeness with the spec)
    (on ?d1 - disk ?d2 - disk)
    (on-peg ?d - disk ?p - peg)
    (clear ?x) ; may be used for disks or pegs, left untyped to allow both
    ; static size ordering
    (smaller ?d1 - disk ?d2 - disk)
    ; permissions
    (permission ?a - agent ?d - disk)
    ; ordered move gating
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
    (scheduled ?s - step ?a - agent ?d - disk ?from - peg ?to - peg)
  )

  ; Single move operator; ordered execution is enforced via step parameters.
  (:action move
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (current ?s)
      (next ?s ?s2)
      (scheduled ?s ?a ?d ?from ?to)
      (permission ?a ?d)
      (at ?d ?from)
    )
    :effect (and
      (not (at ?d ?from))
      (at ?d ?to)
      (not (current ?s))
      (current ?s2)
    )
  )
)