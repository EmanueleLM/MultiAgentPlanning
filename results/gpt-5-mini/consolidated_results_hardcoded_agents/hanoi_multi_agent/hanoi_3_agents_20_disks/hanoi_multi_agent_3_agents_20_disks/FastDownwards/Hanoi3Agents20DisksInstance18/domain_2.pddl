(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?s - object)
    (clear ?x - object)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move1 ?d - disk)
    (can-move2 ?d - disk)
    (can-move3 ?d - disk)
  )

  (:action agent1-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and (can-move1 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action agent1-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and (can-move1 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action agent2-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and (can-move2 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action agent2-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and (can-move2 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action agent3-move-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and (can-move3 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action agent3-move-to-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and (can-move3 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )
)