(define (domain tower-hanoi-multiagent)
  ; Domain targeted for the Fast Downward planner
  (:requirements :strips :typing :negative-preconditions)
  (:types agent place)

  (:predicates
    ; disk or peg are both objects of type place; is-disk/is-peg distinguish them
    (on ?d - place ?p - place)          ; disk or peg ?d is directly on place ?p (place = peg OR disk)
    (clear ?p - place)                  ; there is no disk directly on top of place ?p
    (smaller ?d1 - place ?d2 - place)   ; ?d1 is smaller than ?d2 (size relation)
    (owner ?d - place ?a - agent)       ; agent ?a is allowed to move disk ?d
    (is-agent1 ?a - agent)               ; unary marker: this agent is agent1
    (is-agent2 ?a - agent)               ; unary marker: this agent is agent2
    (is-disk ?p - place)
    (is-peg ?p - place)
  )

  ; Agent 1: move disk to empty peg
  (:action agent_1-move-to-peg
    :parameters (?agent - agent ?d - place ?from - place ?to - place)
    :precondition (and
      (is-agent1 ?agent)
      (owner ?d ?agent)
      (is-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (is-peg ?to)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Agent 1: move disk onto another disk
  (:action agent_1-move-onto-disk
    :parameters (?agent - agent ?d - place ?from - place ?to - place)
    :precondition (and
      (is-agent1 ?agent)
      (owner ?d ?agent)
      (is-disk ?d)
      (is-disk ?to)
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

  ; Agent 2: move disk to empty peg
  (:action agent_2-move-to-peg
    :parameters (?agent - agent ?d - place ?from - place ?to - place)
    :precondition (and
      (is-agent2 ?agent)
      (owner ?d ?agent)
      (is-disk ?d)
      (on ?d ?from)
      (clear ?d)
      (is-peg ?to)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ; Agent 2: move disk onto another disk
  (:action agent_2-move-onto-disk
    :parameters (?agent - agent ?d - place ?from - place ?to - place)
    :precondition (and
      (is-agent2 ?agent)
      (owner ?d ?agent)
      (is-disk ?d)
      (is-disk ?to)
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