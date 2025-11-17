(define (domain multi-agent-hanoi)
  (:requirements :strips :typing :equality)
  (:types
    place
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d - disk ?p - place)
    (permitted-a1 ?d - disk)
    (permitted-a2 ?d - disk)
    (permitted-a3 ?d - disk)
  )

  (:action move_agent_1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (permitted-a1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
      (not (= ?d ?to))
      (not (= ?d ?from))
    )
    :effect (and
      (on ?d ?to)
      (clear ?from)
      (not (on ?d ?from))
      (not (clear ?to))
    )
  )

  (:action move_agent_2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (permitted-a2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
      (not (= ?d ?to))
      (not (= ?d ?from))
    )
    :effect (and
      (on ?d ?to)
      (clear ?from)
      (not (on ?d ?from))
      (not (clear ?to))
    )
  )

  (:action move_agent_3
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (permitted-a3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (not (= ?from ?to))
      (not (= ?d ?to))
      (not (= ?d ?from))
    )
    :effect (and
      (on ?d ?to)
      (clear ?from)
      (not (on ?d ?from))
      (not (clear ?to))
    )
  )
)