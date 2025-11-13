(define (domain hanoi2agents15disks)
  (:requirements :strips :typing :equality)
  (:types agent disk peg)
  (:predicates
    (on ?x - disk ?y - disk)
    (on-peg ?x - disk ?p - peg)
    (clear ?x - disk)
    (empty ?p - peg)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?x - disk)
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?x - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (can-move ?a ?x)
      (clear ?x)
      (on-peg ?x ?p1)
      (empty ?p2)
      (not (= ?p1 ?p2))
    )
    :effect (and
      (on-peg ?x ?p2)
      (not (on-peg ?x ?p1))
      (empty ?p1)
      (not (empty ?p2))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?x - disk ?p - peg ?y - disk)
    :precondition (and
      (can-move ?a ?x)
      (clear ?x)
      (on-peg ?x ?p)
      (clear ?y)
      (smaller ?x ?y)
    )
    :effect (and
      (on ?x ?y)
      (not (on-peg ?x ?p))
      (empty ?p)
      (not (clear ?y))
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?x - disk ?y - disk ?p - peg)
    :precondition (and
      (can-move ?a ?x)
      (clear ?x)
      (on ?x ?y)
      (empty ?p)
    )
    :effect (and
      (on-peg ?x ?p)
      (not (on ?x ?y))
      (clear ?y)
      (not (empty ?p))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?x - disk ?y - disk ?z - disk)
    :precondition (and
      (can-move ?a ?x)
      (clear ?x)
      (on ?x ?y)
      (clear ?z)
      (smaller ?x ?z)
      (not (= ?y ?z))
    )
    :effect (and
      (on ?x ?z)
      (not (on ?x ?y))
      (clear ?y)
      (not (clear ?z))
    )
  )
)