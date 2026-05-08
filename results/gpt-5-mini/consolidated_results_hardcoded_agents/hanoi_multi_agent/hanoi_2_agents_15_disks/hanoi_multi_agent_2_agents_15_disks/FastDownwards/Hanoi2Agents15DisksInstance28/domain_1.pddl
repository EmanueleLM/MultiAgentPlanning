(define (domain hanoi-two-agent-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is immediately on place ?p (a peg or another disk)
    (clear ?p - place)              ; nothing is immediately on place ?p (p is top or empty)
    (smaller ?d1 - disk ?d2 - disk) ; disk ?d1 is smaller than ?d2 (static)
    (agent1 ?d - disk)              ; agent_1 is allowed to move disk ?d
    (agent2 ?d - disk)              ; agent_2 is allowed to move disk ?d
  )

  ;; agent_1 generic move to a place (peg or disk treated as place)
  (:action agent_1-move-to-place
    :parameters (?d - disk ?from - place ?to - place)
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
    :parameters (?d - disk ?from - place ?onto - disk)
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

  ;; agent_2 generic move to a place (peg or disk treated as place)
  (:action agent_2-move-to-place
    :parameters (?d - disk ?from - place ?to - place)
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
    :parameters (?d - disk ?from - place ?onto - disk)
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