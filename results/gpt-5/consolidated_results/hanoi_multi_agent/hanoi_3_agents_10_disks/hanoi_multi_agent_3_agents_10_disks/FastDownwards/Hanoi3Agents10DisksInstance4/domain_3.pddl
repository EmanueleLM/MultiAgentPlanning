(define (domain multi-agent-hanoi-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    peg disk - place
    stage
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d - disk ?p - place)
    (permitted-a1 ?d - disk)
    (permitted-a2 ?d - disk)
    (permitted-a3 ?d - disk)
    (step ?s - stage)
    (next ?s - stage ?t - stage)
  )

  (:action move_agent_1
    :parameters (?d - disk ?from - place ?to - place ?s - stage ?t - stage)
    :precondition (and
      (permitted-a1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (step ?s)
      (next ?s ?t)
    )
    :effect (and
      (on ?d ?to)
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?to))
      (not (step ?s))
      (step ?t)
    )
  )

  (:action move_agent_2
    :parameters (?d - disk ?from - place ?to - place ?s - stage ?t - stage)
    :precondition (and
      (permitted-a2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (step ?s)
      (next ?s ?t)
    )
    :effect (and
      (on ?d ?to)
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?to))
      (not (step ?s))
      (step ?t)
    )
  )

  (:action move_agent_3
    :parameters (?d - disk ?from - place ?to - place ?s - stage ?t - stage)
    :precondition (and
      (permitted-a3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (step ?s)
      (next ?s ?t)
    )
    :effect (and
      (on ?d ?to)
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?to))
      (not (step ?s))
      (step ?t)
    )
  )
)