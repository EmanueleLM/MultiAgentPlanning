(define (domain hanoi-multi-agent)
  (:requirements :typing :negative-preconditions :action-costs)
  (:types disk peg agent)
  (:predicates
    (on ?x - disk ?y - disk)
    (ontable ?x - disk ?p - peg)
    (clear ?x - disk)
    (empty ?p - peg)
    (smaller ?x - disk ?y - disk)
    (permitted ?a - agent ?x - disk)
  )
  (:functions (total-cost))

  (:action move-disk-to-disk
    :parameters (?a - agent ?x - disk ?from - disk ?to - disk)
    :precondition (and
      (permitted ?a ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (on ?x ?to)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action move-disk-to-peg
    :parameters (?a - agent ?x - disk ?from - disk ?p - peg)
    :precondition (and
      (permitted ?a ?x)
      (on ?x ?from)
      (clear ?x)
      (empty ?p)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (ontable ?x ?p)
      (not (empty ?p))
      (increase (total-cost) 1)
    )
  )

  (:action move-peg-to-disk
    :parameters (?a - agent ?x - disk ?p - peg ?to - disk)
    :precondition (and
      (permitted ?a ?x)
      (ontable ?x ?p)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
    )
    :effect (and
      (not (ontable ?x ?p))
      (empty ?p)
      (on ?x ?to)
      (not (clear ?to))
      (increase (total-cost) 1)
    )
  )

  (:action move-peg-to-peg
    :parameters (?a - agent ?x - disk ?p1 - peg ?p2 - peg)
    :precondition (and
      (permitted ?a ?x)
      (ontable ?x ?p1)
      (clear ?x)
      (empty ?p2)
    )
    :effect (and
      (not (ontable ?x ?p1))
      (empty ?p1)
      (ontable ?x ?p2)
      (not (empty ?p2))
      (increase (total-cost) 1)
    )
  )
)