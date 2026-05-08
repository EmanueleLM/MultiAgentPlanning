(define (domain hanoi_multiagent_3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk - place)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (can_move_agent1 ?d - disk)
    (can_move_agent2 ?d - disk)
    (can_move_agent3 ?d - disk)
  )

  (:action agent_1_move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (can_move_agent1 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action agent_1_move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (can_move_agent1 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action agent_2_move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (can_move_agent2 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action agent_2_move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (can_move_agent2 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action agent_3_move-to-peg
    :parameters (?d - disk ?from - place ?to - peg)
    :precondition (and (can_move_agent3 ?d) (on ?d ?from) (clear ?d) (clear ?to))
    :effect (and (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )

  (:action agent_3_move-to-disk
    :parameters (?d - disk ?from - place ?to - disk)
    :precondition (and (can_move_agent3 ?d) (on ?d ?from) (clear ?d) (clear ?to) (smaller ?d ?to))
    :effect (and (not (on ?d ?from)) (on ?d ?to) (clear ?from) (not (clear ?to)))
  )
)