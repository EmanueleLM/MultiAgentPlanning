(define (domain hanoi_2agent)
  (:requirements :strips :typing)
  (:types
    agent
    place
    disk - place
    peg - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move_to_peg
    :parameters (?a - agent ?d - disk ?from - place ?p - peg)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (clear ?from)
      (not (clear ?p))
    )
  )

  (:action move_to_disk
    :parameters (?a - agent ?d - disk ?from - place ?u - disk)
    :precondition (and
      (can-move ?a ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?u)
      (smaller ?d ?u)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?u)
      (clear ?from)
      (not (clear ?u))
    )
  )
)