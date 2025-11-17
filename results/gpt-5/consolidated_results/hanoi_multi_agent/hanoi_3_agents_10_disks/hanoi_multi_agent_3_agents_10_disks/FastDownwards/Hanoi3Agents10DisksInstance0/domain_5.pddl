(define (domain hanoi-multiagent-3agents-10disks-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    stage
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - disk)
    (on-peg ?d - disk ?p - peg)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (controls ?a - agent ?d - disk)
    (current ?t - stage)
    (succ ?t1 - stage ?t2 - stage)
  )

  (:action move-from-peg-to-peg
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg ?t1 - stage ?t2 - stage)
    :precondition (and
      (controls ?a ?d)
      (on-peg ?d ?p1)
      (clear ?d)
      (clear ?p2)
      (succ ?t1 ?t2)
      (current ?t1)
    )
    :effect (and
      (not (on-peg ?d ?p1))
      (on-peg ?d ?p2)
      (clear ?p1)
      (not (clear ?p2))
      (not (current ?t1))
      (current ?t2)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?p - peg ?s - disk ?t1 - stage ?t2 - stage)
    :precondition (and
      (controls ?a ?d)
      (on-peg ?d ?p)
      (clear ?d)
      (clear ?s)
      (smaller ?d ?s)
      (succ ?t1 ?t2)
      (current ?t1)
    )
    :effect (and
      (not (on-peg ?d ?p))
      (on ?d ?s)
      (clear ?p)
      (not (clear ?s))
      (not (current ?t1))
      (current ?t2)
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?a - agent ?d - disk ?s - disk ?p - peg ?t1 - stage ?t2 - stage)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?s)
      (clear ?d)
      (clear ?p)
      (succ ?t1 ?t2)
      (current ?t1)
    )
    :effect (and
      (not (on ?d ?s))
      (on-peg ?d ?p)
      (clear ?s)
      (not (clear ?p))
      (not (current ?t1))
      (current ?t2)
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?s - disk ?t - disk ?t1 - stage ?t2 - stage)
    :precondition (and
      (controls ?a ?d)
      (on ?d ?s)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
      (succ ?t1 ?t2)
      (current ?t1)
    )
    :effect (and
      (not (on ?d ?s))
      (on ?d ?t)
      (clear ?s)
      (not (clear ?t))
      (not (current ?t1))
      (current ?t2)
    )
  )
)