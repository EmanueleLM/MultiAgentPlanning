(define (domain hanoi-3agents-10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - object)
  (:predicates
    (on ?d - disk ?x - object)
    (clear ?x - object)
    (can-place ?d - disk ?x - object)
    (agent1_allowed ?d - disk)
    (agent2_allowed ?d - disk)
    (agent3_allowed ?d - disk)
  )

  (:action move-agent1
    :parameters (?d - disk ?from - object ?to - object)
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
    :parameters (?d - disk ?from - object ?to - object)
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
    :parameters (?d - disk ?from - object ?to - object)
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