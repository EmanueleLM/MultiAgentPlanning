(define (domain hanoi-multiagent)
  (:requirements :strips :typing)
  (:types disk peg agent)
  (:predicates
    (on ?x - disk ?y - disk)
    (on-peg ?x - disk ?p - peg)
    (clear ?x - disk)
    (clear-peg ?p - peg)
    (smaller ?x - disk ?y - disk)
  )

  (:action move-from-peg-to-peg-empty
    :parameters (?ag - agent ?x - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (clear ?x)
      (on-peg ?x ?p1)
      (clear-peg ?p2)
    )
    :effect (and
      (not (on-peg ?x ?p1))
      (on-peg ?x ?p2)
      (not (clear-peg ?p2))
      (clear-peg ?p1)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?ag - agent ?x - disk ?p1 - peg ?y - disk)
    :precondition (and
      (clear ?x)
      (on-peg ?x ?p1)
      (clear ?y)
      (smaller ?x ?y)
    )
    :effect (and
      (not (on-peg ?x ?p1))
      (on ?x ?y)
      (clear-peg ?p1)
      (not (clear ?y))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?ag - agent ?x - disk ?y - disk ?p2 - peg)
    :precondition (and
      (clear ?x)
      (on ?x ?y)
      (clear-peg ?p2)
    )
    :effect (and
      (not (on ?x ?y))
      (on-peg ?x ?p2)
      (not (clear-peg ?p2))
      (clear ?y)
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?ag - agent ?x - disk ?y - disk ?z - disk)
    :precondition (and
      (clear ?x)
      (on ?x ?y)
      (clear ?z)
      (smaller ?x ?z)
    )
    :effect (and
      (not (on ?x ?y))
      (on ?x ?z)
      (not (clear ?z))
      (clear ?y)
    )
  )
)