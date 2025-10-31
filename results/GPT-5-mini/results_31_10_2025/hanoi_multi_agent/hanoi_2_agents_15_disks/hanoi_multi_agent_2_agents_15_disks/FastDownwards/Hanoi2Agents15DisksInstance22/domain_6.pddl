(define (domain hanoi-2agents-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    (on ?d - disk ?p - (either disk peg))
    (clear ?x - (either disk peg))
    (smaller ?d1 - disk ?d2 - disk)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (required-order ?s - step ?d - disk ?from - (either disk peg) ?to - (either disk peg))
    (current-step ?s - step)
    (next ?s - step ?s2 - step)
  )

  (:action agent1-move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg ?s - step ?snext - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent1 ?d)
      (required-order ?s ?d ?from ?to)
      (current-step ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  (:action agent1-move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk ?s - step ?snext - step)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move-agent1 ?d)
      (required-order ?s ?d ?from ?to)
      (current-step ?s)
      (next ?s ?snext)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  (:action agent2-move-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action agent2-move-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move-agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)