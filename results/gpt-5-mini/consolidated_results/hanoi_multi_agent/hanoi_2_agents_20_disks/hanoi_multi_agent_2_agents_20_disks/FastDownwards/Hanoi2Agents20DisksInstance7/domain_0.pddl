(define (domain hanoi_agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Agent 1 actions
  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
             (not (on ?d ?from))
             (on ?d ?to)
             (clear ?from)
             (not (clear ?to))
            )
  )

  (:action move-agent1-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
             (not (on ?d ?from))
             (on ?d ?to)
             (clear ?from)
             (not (clear ?to))
            )
  )

  ;; Agent 2 actions (defined but not required/used by the given move list)
  (:action move-agent2-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
             (not (on ?d ?from))
             (on ?d ?to)
             (clear ?from)
             (not (clear ?to))
            )
  )

  (:action move-agent2-onto-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
             (not (on ?d ?from))
             (on ?d ?to)
             (clear ?from)
             (not (clear ?to))
            )
  )
)