(define (domain hanoi-2agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?d - disk ?p - peg)
  )

  ;; Agent 1 actions: can move disks a-e only.
  (:action agent_1-move-a
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on a ?from)
    )
    :effect (and
      (not (on a ?from))
      (on a ?to)
    )
  )

  (:action agent_1-move-b
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on b ?from)
      (not (on a ?from))
      (not (on a ?to))
    )
    :effect (and
      (not (on b ?from))
      (on b ?to)
    )
  )

  (:action agent_1-move-c
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on c ?from)
      (not (on a ?from))
      (not (on b ?from))
      (not (on a ?to))
      (not (on b ?to))
    )
    :effect (and
      (not (on c ?from))
      (on c ?to)
    )
  )

  (:action agent_1-move-d
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on d ?from)
      (not (on a ?from))
      (not (on b ?from))
      (not (on c ?from))
      (not (on a ?to))
      (not (on b ?to))
      (not (on c ?to))
    )
    :effect (and
      (not (on d ?from))
      (on d ?to)
    )
  )

  (:action agent_1-move-e
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on e ?from)
      (not (on a ?from))
      (not (on b ?from))
      (not (on c ?from))
      (not (on d ?from))
      (not (on a ?to))
      (not (on b ?to))
      (not (on c ?to))
      (not (on d ?to))
    )
    :effect (and
      (not (on e ?from))
      (on e ?to)
    )
  )

  ;; Agent 2 actions: can move disks f-j only.
  (:action agent_2-move-f
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on f ?from)
      (not (on a ?from))
      (not (on b ?from))
      (not (on c ?from))
      (not (on d ?from))
      (not (on e ?from))
      (not (on a ?to))
      (not (on b ?to))
      (not (on c ?to))
      (not (on d ?to))
      (not (on e ?to))
    )
    :effect (and
      (not (on f ?from))
      (on f ?to)
    )
  )

  (:action agent_2-move-g
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on g ?from)
      (not (on a ?from))
      (not (on b ?from))
      (not (on c ?from))
      (not (on d ?from))
      (not (on e ?from))
      (not (on f ?from))
      (not (on a ?to))
      (not (on b ?to))
      (not (on c ?to))
      (not (on d ?to))
      (not (on e ?to))
      (not (on f ?to))
    )
    :effect (and
      (not (on g ?from))
      (on g ?to)
    )
  )

  (:action agent_2-move-h
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on h ?from)
      (not (on a ?from))
      (not (on b ?from))
      (not (on c ?from))
      (not (on d ?from))
      (not (on e ?from))
      (not (on f ?from))
      (not (on g ?from))
      (not (on a ?to))
      (not (on b ?to))
      (not (on c ?to))
      (not (on d ?to))
      (not (on e ?to))
      (not (on f ?to))
      (not (on g ?to))
    )
    :effect (and
      (not (on h ?from))
      (on h ?to)
    )
  )

  (:action agent_2-move-i
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on i ?from)
      (not (on a ?from))
      (not (on b ?from))
      (not (on c ?from))
      (not (on d ?from))
      (not (on e ?from))
      (not (on f ?from))
      (not (on g ?from))
      (not (on h ?from))
      (not (on a ?to))
      (not (on b ?to))
      (not (on c ?to))
      (not (on d ?to))
      (not (on e ?to))
      (not (on f ?to))
      (not (on g ?to))
      (not (on h ?to))
    )
    :effect (and
      (not (on i ?from))
      (on i ?to)
    )
  )

  (:action agent_2-move-j
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on j ?from)
      (not (on a ?from))
      (not (on b ?from))
      (not (on c ?from))
      (not (on d ?from))
      (not (on e ?from))
      (not (on f ?from))
      (not (on g ?from))
      (not (on h ?from))
      (not (on i ?from))
      (not (on a ?to))
      (not (on b ?to))
      (not (on c ?to))
      (not (on d ?to))
      (not (on e ?to))
      (not (on f ?to))
      (not (on g ?to))
      (not (on h ?to))
      (not (on i ?to))
    )
    :effect (and
      (not (on j ?from))
      (on j ?to)
    )
  )
)