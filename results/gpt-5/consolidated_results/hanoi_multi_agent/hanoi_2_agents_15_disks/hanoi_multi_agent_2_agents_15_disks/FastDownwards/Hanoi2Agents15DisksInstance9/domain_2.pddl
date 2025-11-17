(define (domain hanoi2agents15disksinstance9)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    loc - object
    peg disk - loc
  )
  (:predicates
    (on ?d - disk ?l - loc)
    (clear ?l - loc)
    (smaller ?x - disk ?y - disk)
    (controlled-by-agent1 ?d - disk)
    (controlled-by-agent2 ?d - disk)
  )

  (:action move-a1-to-peg
    :parameters (?d - disk ?s - loc ?p - peg)
    :precondition (and
      (controlled-by-agent1 ?d)
      (clear ?d)
      (on ?d ?s)
      (clear ?p)
    )
    :effect (and
      (on ?d ?p)
      (not (on ?d ?s))
      (clear ?s)
      (not (clear ?p))
    )
  )

  (:action move-a1-to-disk
    :parameters (?d - disk ?s - loc ?t - disk)
    :precondition (and
      (controlled-by-agent1 ?d)
      (clear ?d)
      (on ?d ?s)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (on ?d ?t)
      (not (on ?d ?s))
      (clear ?s)
      (not (clear ?t))
    )
  )

  (:action move-a2-to-peg
    :parameters (?d - disk ?s - loc ?p - peg)
    :precondition (and
      (controlled-by-agent2 ?d)
      (clear ?d)
      (on ?d ?s)
      (clear ?p)
    )
    :effect (and
      (on ?d ?p)
      (not (on ?d ?s))
      (clear ?s)
      (not (clear ?p))
    )
  )

  (:action move-a2-to-disk
    :parameters (?d - disk ?s - loc ?t - disk)
    :precondition (and
      (controlled-by-agent2 ?d)
      (clear ?d)
      (on ?d ?s)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (on ?d ?t)
      (not (on ?d ?s))
      (clear ?s)
      (not (clear ?t))
    )
  )
)