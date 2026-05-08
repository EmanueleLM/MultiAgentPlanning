(define (domain hanoi-3agents-10disks)
  (:requirements :typing :negative-preconditions)
  (:types place - object
          disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (can-place ?d - disk ?p - place)
    (agent1_allowed ?d - disk)
    (agent2_allowed ?d - disk)
    (agent3_allowed ?d - disk)
  )

  (:action move-agent1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent1_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-agent2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent2_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-agent3
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent3_allowed ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)