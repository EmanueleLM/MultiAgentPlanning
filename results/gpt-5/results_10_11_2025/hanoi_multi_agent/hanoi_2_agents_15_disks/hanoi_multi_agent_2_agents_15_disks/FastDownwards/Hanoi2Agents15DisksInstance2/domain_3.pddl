(define (domain hanoi_two_agent)
  (:requirements :strips :typing)
  (:types
    support
    peg disk - support
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (top ?d - disk ?p - peg)
    (cap-agent1 ?d - disk)
    (cap-agent2 ?d - disk)
  )

  (:action move_to_peg_agent1
    :parameters (?d - disk ?from - support ?p - peg)
    :precondition (and
      (cap-agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (clear ?d)
    )
  )

  (:action move_to_disk_agent1
    :parameters (?d - disk ?from - support ?t - disk)
    :precondition (and
      (cap-agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?d)
    )
  )

  (:action move_to_peg_agent2
    :parameters (?d - disk ?from - support ?p - peg)
    :precondition (and
      (cap-agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (clear ?d)
    )
  )

  (:action move_to_disk_agent2
    :parameters (?d - disk ?from - support ?t - disk)
    :precondition (and
      (cap-agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?t)
      (smaller ?d ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?t)
      (clear ?from)
      (not (clear ?t))
      (clear ?d)
    )
  )
)