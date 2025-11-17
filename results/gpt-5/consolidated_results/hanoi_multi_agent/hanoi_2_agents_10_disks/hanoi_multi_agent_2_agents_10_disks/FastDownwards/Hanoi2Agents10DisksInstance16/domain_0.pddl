(define (domain hanoi_2agent_ordered)
  (:requirements :strips :typing)
  (:types
    agent
    place
    disk - place
    peg - place
    step
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
    ; sequencing/gating to enforce the exact ordered move list
    (phase ?s - step)
    (allowed-peg ?a - agent ?d - disk ?from - place ?to - peg ?s - step ?t - step)
    (allowed-disk ?a - agent ?d - disk ?from - place ?to - disk ?s - step ?t - step)
  )

  (:action move_to_peg
    :parameters (?a - agent ?d - disk ?from - place ?p - peg ?s - step ?t - step)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (clear ?p)
      (on ?d ?from)
      (phase ?s)
      (allowed-peg ?a ?d ?from ?p ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
      (not (phase ?s))
      (phase ?t)
    )
  )

  (:action move_to_disk
    :parameters (?a - agent ?d - disk ?from - place ?u - disk ?s - step ?t - step)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (clear ?u)
      (on ?d ?from)
      (smaller ?d ?u)
      (phase ?s)
      (allowed-disk ?a ?d ?from ?u ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?u)
      (clear ?from)
      (not (clear ?u))
      (not (phase ?s))
      (phase ?t)
    )
  )
)