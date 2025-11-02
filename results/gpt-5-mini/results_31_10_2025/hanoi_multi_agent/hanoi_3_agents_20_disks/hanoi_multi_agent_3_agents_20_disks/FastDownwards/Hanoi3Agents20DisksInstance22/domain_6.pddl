(define (domain hanoi_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types place - object disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (can-move-agent3 ?d - disk)
  )

  (:action move_agent_1_to_peg
    :parameters (?d - disk ?from - place ?p - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?p) (can-move-agent1 ?d))
    :effect (and (not (on ?d ?from)) (on ?d ?p) (clear ?from) (not (clear ?p)))
  )

  (:action move_agent_1_onto_disk
    :parameters (?d - disk ?from - place ?e - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?e) (smaller ?d ?e) (can-move-agent1 ?d))
    :effect (and (not (on ?d ?from)) (on ?d ?e) (clear ?from) (not (clear ?e)))
  )

  (:action move_agent_2_to_peg
    :parameters (?d - disk ?from - place ?p - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?p) (can-move-agent2 ?d))
    :effect (and (not (on ?d ?from)) (on ?d ?p) (clear ?from) (not (clear ?p)))
  )

  (:action move_agent_2_onto_disk
    :parameters (?d - disk ?from - place ?e - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?e) (smaller ?d ?e) (can-move-agent2 ?d))
    :effect (and (not (on ?d ?from)) (on ?d ?e) (clear ?from) (not (clear ?e)))
  )

  (:action move_agent_3_to_peg
    :parameters (?d - disk ?from - place ?p - peg)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?p) (can-move-agent3 ?d))
    :effect (and (not (on ?d ?from)) (on ?d ?p) (clear ?from) (not (clear ?p)))
  )

  (:action move_agent_3_onto_disk
    :parameters (?d - disk ?from - place ?e - disk)
    :precondition (and (on ?d ?from) (clear ?d) (clear ?e) (smaller ?d ?e) (can-move-agent3 ?d))
    :effect (and (not (on ?d ?from)) (on ?d ?e) (clear ?from) (not (clear ?e)))
  )
)