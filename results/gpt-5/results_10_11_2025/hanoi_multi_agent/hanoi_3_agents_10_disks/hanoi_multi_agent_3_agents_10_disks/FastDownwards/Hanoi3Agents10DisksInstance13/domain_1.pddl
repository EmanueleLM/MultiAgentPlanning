(define (domain hanoi3agents10disks-scheduled)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent peg disk step
  )
  (:predicates
    ; disk locations by peg
    (at ?d - disk ?p - peg)
    ; permissions
    (permission ?a - agent ?d - disk)
    ; ordered move gating
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
    (scheduled ?s - step ?a - agent ?d - disk ?from - peg ?to - peg)
  )

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