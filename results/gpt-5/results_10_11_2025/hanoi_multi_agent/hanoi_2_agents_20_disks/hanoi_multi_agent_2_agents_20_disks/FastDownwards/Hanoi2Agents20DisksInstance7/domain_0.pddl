(define (domain hanoi_coop_20)
  (:requirements :strips :typing)
  (:types
    support
    peg - support
    disk - support
    agent
    step
  )
  (:predicates
    (disk ?d - disk)
    (peg ?p - peg)
    (agent ?a - agent)
    (on ?x - disk ?y - support)
    (on-peg ?d - disk ?p - peg)
    (clear ?x - support)
    (smaller ?x - disk ?y - disk)
    (placeable ?d - disk ?s - support)
    (can-move ?a - agent ?d - disk)
    (belongs ?x - support ?p - peg)
    (req-agent ?s - step ?a - agent)
    (req-disk ?s - step ?d - disk)
    (req-from ?s - step ?p - peg)
    (req-to ?s - step ?p - peg)
    (step ?s - step)
    (current ?s - step)
    (next ?s1 - step ?s2 - step)
  )

  (:action move
    :parameters
      (?a - agent
       ?d - disk
       ?from - support
       ?to - support
       ?s - step
       ?s2 - step
       ?pf - peg
       ?pt - peg)
    :precondition (and
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (placeable ?d ?to)
      (can-move ?a ?d)
      (current ?s)
      (next ?s ?s2)
      (req-agent ?s ?a)
      (req-disk ?s ?d)
      (req-from ?s ?pf)
      (req-to ?s ?pt)
      (belongs ?d ?pf)
      (belongs ?from ?pf)
      (belongs ?to ?pt)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
      (not (belongs ?d ?pf))
      (belongs ?d ?pt)
    )
  )
)