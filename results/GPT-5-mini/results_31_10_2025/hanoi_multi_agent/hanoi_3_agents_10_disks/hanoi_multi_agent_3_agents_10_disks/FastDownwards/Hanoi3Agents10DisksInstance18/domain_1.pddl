(define (domain hanoi_agents_10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ;; disk is directly on object (either a peg or another disk)
    (on ?d - disk ?p - object)

    ;; object (disk or peg) has nothing on top of it
    (clear ?o - object)

    ;; static relation: disk may be placed on object (peg or larger disk)
    (can-place ?d - disk ?p - object)

    ;; capability facts: which agent can move which disk
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (can-move-agent3 ?d - disk)
  )

  ;; agent_1 action (moves A B C D only via capability facts)
  (:action agent_1-move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (can-move-agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; agent_2 action (moves E F G only)
  (:action agent_2-move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; agent_3 action (moves H I J only)
  (:action agent_3-move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (can-move-agent3 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)