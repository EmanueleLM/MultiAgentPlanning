(define (domain tower-hanoi-multiagent)
  ; Domain targeted for the FastDownwards planner
  (:requirements :strips :typing :negative-preconditions)
  (:types agent place peg disk - place)

  (:predicates
    (on ?d - disk ?p - place)            ; disk ?d is directly on place ?p (place = peg OR disk)
    (clear ?p - place)                  ; there is no disk directly on top of place ?p
    (smaller ?d1 - disk ?d2 - disk)     ; ?d1 is smaller than ?d2 (size relation)
    (owner ?d - disk ?a - agent)        ; agent ?a is allowed to move disk ?d
    (is-agent1 ?a - agent)              ; unary marker: this agent is agent1
    (is-agent2 ?a - agent)              ; unary marker: this agent is agent2
  )

  ; Agent 1: two move variants to respect STRIPS (move to empty peg; move onto a disk)
  (:action agent_1-move-to-peg
    :parameters (?agent - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (is-agent1 ?agent)
      (owner ?d ?agent)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent_1-move-onto-disk
    :parameters (?agent - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (is-agent1 ?agent)
      (owner ?d ?agent)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Agent 2: same two variants, but restricted to agent2 and disks it owns
  (:action agent_2-move-to-peg
    :parameters (?agent - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (is-agent2 ?agent)
      (owner ?d ?agent)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action agent_2-move-onto-disk
    :parameters (?agent - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (is-agent2 ?agent)
      (owner ?d ?agent)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)