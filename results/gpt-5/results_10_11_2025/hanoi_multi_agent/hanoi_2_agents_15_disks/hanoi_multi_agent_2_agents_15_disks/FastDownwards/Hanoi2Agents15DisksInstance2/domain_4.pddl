(define (domain hanoi_two_agent)
  (:requirements :strips :typing)
  (:types
    stage
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (cap-agent1 ?d - disk)
    (cap-agent2 ?d - disk)
    (curr ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move_to_peg_agent1
    :parameters (?d - disk ?from - support ?p - peg ?t - stage ?t2 - stage)
    :precondition (and
      (cap-agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
      (curr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  (:action move_to_disk_agent1
    :parameters (?d - disk ?from - support ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (cap-agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (curr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?tgt)
      (clear ?from)
      (not (clear ?tgt))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  (:action move_to_peg_agent2
    :parameters (?d - disk ?from - support ?p - peg ?t - stage ?t2 - stage)
    :precondition (and
      (cap-agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
      (curr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (not (curr ?t))
      (curr ?t2)
    )
  )

  (:action move_to_disk_agent2
    :parameters (?d - disk ?from - support ?tgt - disk ?t - stage ?t2 - stage)
    :precondition (and
      (cap-agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?tgt)
      (smaller ?d ?tgt)
      (curr ?t)
      (next ?t ?t2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?tgt)
      (clear ?from)
      (not (clear ?tgt))
      (not (curr ?t))
      (curr ?t2)
    )
  )
)