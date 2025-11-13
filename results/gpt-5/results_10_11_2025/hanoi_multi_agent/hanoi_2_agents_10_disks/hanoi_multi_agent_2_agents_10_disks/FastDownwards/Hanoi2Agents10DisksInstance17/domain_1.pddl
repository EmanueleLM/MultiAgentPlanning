(define (domain hanoi2agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk peg agent
  )
  (:predicates
    (disk ?x - disk)
    (peg ?p - peg)
    (agent ?a - agent)
    (smaller ?x - disk ?y - disk)
    (on ?x - disk ?y - disk)
    (on-peg ?x - disk ?p - peg)
    (clear ?u - (either disk peg))
    (owns ?a - agent ?x - disk)
  )

  (:action move-from-peg-to-peg
    :parameters (?ag - agent ?x - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (owns ?ag ?x)
      (on-peg ?x ?p1)
      (clear ?x)
      (clear ?p2)
    )
    :effect (and
      (not (on-peg ?x ?p1))
      (on-peg ?x ?p2)
      (clear ?p1)
      (not (clear ?p2))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?ag - agent ?x - disk ?p1 - peg ?y - disk)
    :precondition (and
      (owns ?ag ?x)
      (on-peg ?x ?p1)
      (clear ?x)
      (clear ?y)
      (smaller ?x ?y)
    )
    :effect (and
      (not (on-peg ?x ?p1))
      (on ?x ?y)
      (clear ?p1)
      (not (clear ?y))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?ag - agent ?x - disk ?y - disk ?p2 - peg)
    :precondition (and
      (owns ?ag ?x)
      (on ?x ?y)
      (clear ?x)
      (clear ?p2)
    )
    :effect (and
      (not (on ?x ?y))
      (on-peg ?x ?p2)
      (clear ?y)
      (not (clear ?p2))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?ag - agent ?x - disk ?y - disk ?z - disk)
    :precondition (and
      (owns ?ag ?x)
      (on ?x ?y)
      (clear ?x)
      (clear ?z)
      (smaller ?x ?z)
    )
    :effect (and
      (not (on ?x ?y))
      (on ?x ?z)
      (clear ?y)
      (not (clear ?z))
    )
  )
)