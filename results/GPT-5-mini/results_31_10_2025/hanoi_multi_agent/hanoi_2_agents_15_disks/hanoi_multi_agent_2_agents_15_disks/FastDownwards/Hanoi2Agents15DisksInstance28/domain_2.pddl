(define (domain hanoi-two-agent-15)
  (:requirements :strips :negative-preconditions)

  (:predicates
    (on ?d ?p)
    (clear ?p)
    (smaller ?d1 ?d2)
    (agent1 ?d)
    (agent2 ?d)
  )

  ;; agent_1 generic move to a place (peg or disk treated as a place)
  (:action agent_1-move-to-place
    :parameters (?d ?from ?to)
    :precondition (and
      (agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; agent_1 generic move onto another disk (target disk must be larger)
  (:action agent_1-move-to-disk
    :parameters (?d ?from ?onto)
    :precondition (and
      (agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?onto)
      (smaller ?d ?onto)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?onto)
      (not (clear ?onto))
      (clear ?from)
    )
  )

  ;; agent_2 generic move to a place (peg or disk treated as a place)
  (:action agent_2-move-to-place
    :parameters (?d ?from ?to)
    :precondition (and
      (agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; agent_2 generic move onto another disk (target disk must be larger)
  (:action agent_2-move-to-disk
    :parameters (?d ?from ?onto)
    :precondition (and
      (agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?onto)
      (smaller ?d ?onto)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?onto)
      (not (clear ?onto))
      (clear ?from)
    )
  )
)