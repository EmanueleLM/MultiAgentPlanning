(define (domain hanoi_3agents_15disks_staged_strict_v2)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    time
    support
    disk peg - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (controlled-by ?d - disk ?a - agent)
    (at ?t - time)
    (next ?t1 - time ?t2 - time)
  )

  (:action move-peg-peg
    :parameters (?a - agent ?d - disk ?p1 - peg ?p2 - peg ?t - time ?u - time)
    :precondition (and
      (on ?d ?p1)
      (clear ?d)
      (clear ?p2)
      (controlled-by ?d ?a)
      (at ?t)
      (next ?t ?u)
    )
    :effect (and
      (not (on ?d ?p1))
      (on ?d ?p2)
      (clear ?p1)
      (not (clear ?p2))
      (not (at ?t))
      (at ?u)
    )
  )

  (:action move-peg-disk
    :parameters (?a - agent ?d - disk ?p - peg ?tgt - disk ?t - time ?u - time)
    :precondition (and
      (on ?d ?p)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (controlled-by ?d ?a)
      (at ?t)
      (next ?t ?u)
    )
    :effect (and
      (not (on ?d ?p))
      (on ?d ?tgt)
      (clear ?p)
      (not (clear ?tgt))
      (not (at ?t))
      (at ?u)
    )
  )

  (:action move-disk-peg
    :parameters (?a - agent ?d - disk ?src - disk ?p - peg ?t - time ?u - time)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?p)
      (controlled-by ?d ?a)
      (at ?t)
      (next ?t ?u)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?p)
      (clear ?src)
      (not (clear ?p))
      (not (at ?t))
      (at ?u)
    )
  )

  (:action move-disk-disk
    :parameters (?a - agent ?d - disk ?src - disk ?tgt - disk ?t - time ?u - time)
    :precondition (and
      (on ?d ?src)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (controlled-by ?d ?a)
      (at ?t)
      (next ?t ?u)
    )
    :effect (and
      (not (on ?d ?src))
      (on ?d ?tgt)
      (clear ?src)
      (not (clear ?tgt))
      (not (at ?t))
      (at ?u)
    )
  )
)