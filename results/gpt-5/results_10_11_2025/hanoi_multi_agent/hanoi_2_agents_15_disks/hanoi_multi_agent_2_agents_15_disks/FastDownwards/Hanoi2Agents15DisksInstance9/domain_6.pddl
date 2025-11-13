(define (domain hanoi2agents15disksinstance9)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    loc - object
    peg disk - loc
    stage - object
  )
  (:predicates
    (on ?d - disk ?l - loc)
    (clear ?l - loc)
    (smaller ?x - disk ?y - disk)
    (controlled-by-agent1 ?d - disk)
    (controlled-by-agent2 ?d - disk)
    (curr-stage ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  (:action move-a1-to-peg
    :parameters (?d - disk ?s - loc ?p - peg ?t1 - stage ?t2 - stage)
    :precondition (and
      (controlled-by-agent1 ?d)
      (clear ?d)
      (on ?d ?s)
      (clear ?p)
      (curr-stage ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (on ?d ?p)
      (not (on ?d ?s))
      (clear ?s)
      (not (clear ?p))
      (not (curr-stage ?t1))
      (curr-stage ?t2)
    )
  )

  (:action move-a1-to-disk
    :parameters (?d - disk ?s - loc ?t - disk ?t1 - stage ?t2 - stage)
    :precondition (and
      (controlled-by-agent1 ?d)
      (clear ?d)
      (on ?d ?s)
      (clear ?t)
      (smaller ?d ?t)
      (curr-stage ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (on ?d ?t)
      (not (on ?d ?s))
      (clear ?s)
      (not (clear ?t))
      (not (curr-stage ?t1))
      (curr-stage ?t2)
    )
  )

  (:action move-a2-to-peg
    :parameters (?d - disk ?s - loc ?p - peg ?t1 - stage ?t2 - stage)
    :precondition (and
      (controlled-by-agent2 ?d)
      (clear ?d)
      (on ?d ?s)
      (clear ?p)
      (curr-stage ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (on ?d ?p)
      (not (on ?d ?s))
      (clear ?s)
      (not (clear ?p))
      (not (curr-stage ?t1))
      (curr-stage ?t2)
    )
  )

  (:action move-a2-to-disk
    :parameters (?d - disk ?s - loc ?t - disk ?t1 - stage ?t2 - stage)
    :precondition (and
      (controlled-by-agent2 ?d)
      (clear ?d)
      (on ?d ?s)
      (clear ?t)
      (smaller ?d ?t)
      (curr-stage ?t1)
      (succ ?t1 ?t2)
    )
    :effect (and
      (on ?d ?t)
      (not (on ?d ?s))
      (clear ?s)
      (not (clear ?t))
      (not (curr-stage ?t1))
      (curr-stage ?t2)
    )
  )
)