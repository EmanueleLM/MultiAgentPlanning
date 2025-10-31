(define (domain hanoi-2agents-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types place step)

  (:predicates
    (on ?d - place ?p - place)
    (clear ?p - place)
    (smaller ?d1 - place ?d2 - place)
    (can-move-agent1 ?d - place)
    (can-move-agent2 ?d - place)
    (required-order ?s - step ?d - place ?from - place ?to - place)
    (current-step ?s - step)
    (next ?s - step ?s2 - step)
  )

  (:action agent1-move-to-peg
    :parameters (?d - place ?from - place ?to - place ?s - step ?snext - step)
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
    :parameters (?d - place ?from - place ?to - place ?s - step ?snext - step)
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
    :parameters (?d - place ?from - place ?to - place)
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
    :parameters (?d - place ?from - place ?to - place)
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