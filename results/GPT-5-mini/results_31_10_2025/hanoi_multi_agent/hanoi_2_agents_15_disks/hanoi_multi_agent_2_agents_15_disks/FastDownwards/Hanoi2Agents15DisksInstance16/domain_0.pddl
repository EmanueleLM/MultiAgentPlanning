(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)
  (:predicates
    (on ?d - disk ?p - peg)            ; disk ?d is on peg ?p
    (smaller ?d1 - disk ?d2 - disk)   ; disk ?d1 is strictly smaller than disk ?d2 (static)
  )

  ;-- Actions for agent_1 (one action per disk)
  (:action move_agent1_A
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on A ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on A ?from))
      (on A ?to)
    )
  )

  (:action move_agent1_B
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on B ?from)
      (not (= ?from ?to))
      (not (on A ?from))
      (not (on A ?to))
    )
    :effect (and
      (not (on B ?from))
      (on B ?to)
    )
  )

  (:action move_agent1_C
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on C ?from)
      (not (= ?from ?to))
      (not (on A ?from))
      (not (on B ?from))
      (not (on A ?to))
      (not (on B ?to))
    )
    :effect (and
      (not (on C ?from))
      (on C ?to)
    )
  )

  (:action move_agent1_D
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on D ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))
    )
    :effect (and
      (not (on D ?from))
      (on D ?to)
    )
  )

  (:action move_agent1_E
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on E ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
    )
    :effect (and
      (not (on E ?from))
      (on E ?to)
    )
  )

  (:action move_agent1_F
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on F ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))   (not (on E ?to))
    )
    :effect (and
      (not (on F ?from))
      (on F ?to)
    )
  )

  (:action move_agent1_G
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on G ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))
    )
    :effect (and
      (not (on G ?from))
      (on G ?to)
    )
  )

  (:action move_agent1_H
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on H ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))
    )
    :effect (and
      (not (on H ?from))
      (on H ?to)
    )
  )

  (:action move_agent1_I
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on I ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
    )
    :effect (and
      (not (on I ?from))
      (on I ?to)
    )
  )

  (:action move_agent1_J
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on J ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))
    )
    :effect (and
      (not (on J ?from))
      (on J ?to)
    )
  )

  (:action move_agent1_K
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on K ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from)) (not (on J ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))   (not (on J ?to))
    )
    :effect (and
      (not (on K ?from))
      (on K ?to)
    )
  )

  (:action move_agent1_L
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on L ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from)) (not (on J ?from)) (not (on K ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))   (not (on J ?to))   (not (on K ?to))
    )
    :effect (and
      (not (on L ?from))
      (on L ?to)
    )
  )

  (:action move_agent1_M
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on M ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from)) (not (on J ?from)) (not (on K ?from)) (not (on L ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))   (not (on J ?to))   (not (on K ?to))   (not (on L ?to))
    )
    :effect (and
      (not (on M ?from))
      (on M ?to)
    )
  )

  (:action move_agent1_N
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on N ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from)) (not (on J ?from)) (not (on K ?from)) (not (on L ?from))
      (not (on M ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))   (not (on J ?to))   (not (on K ?to))   (not (on L ?to))
      (not (on M ?to))
    )
    :effect (and
      (not (on N ?from))
      (on N ?to)
    )
  )

  (:action move_agent1_O
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on O ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from)) (not (on J ?from)) (not (on K ?from)) (not (on L ?from))
      (not (on M ?from)) (not (on N ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))   (not (on J ?to))   (not (on K ?to))   (not (on L ?to))
      (not (on M ?to))   (not (on N ?to))
    )
    :effect (and
      (not (on O ?from))
      (on O ?to)
    )
  )

  ;-- Actions for agent_2 (one action per disk) - same preconditions/effects but agent-distinct names
  (:action move_agent2_A
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on A ?from)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on A ?from))
      (on A ?to)
    )
  )

  (:action move_agent2_B
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on B ?from)
      (not (= ?from ?to))
      (not (on A ?from))
      (not (on A ?to))
    )
    :effect (and
      (not (on B ?from))
      (on B ?to)
    )
  )

  (:action move_agent2_C
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on C ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from))
      (not (on A ?to))   (not (on B ?to))
    )
    :effect (and
      (not (on C ?from))
      (on C ?to)
    )
  )

  (:action move_agent2_D
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on D ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))
    )
    :effect (and
      (not (on D ?from))
      (on D ?to)
    )
  )

  (:action move_agent2_E
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on E ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
    )
    :effect (and
      (not (on E ?from))
      (on E ?to)
    )
  )

  (:action move_agent2_F
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on F ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))   (not (on E ?to))
    )
    :effect (and
      (not (on F ?from))
      (on F ?to)
    )
  )

  (:action move_agent2_G
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on G ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))
    )
    :effect (and
      (not (on G ?from))
      (on G ?to)
    )
  )

  (:action move_agent2_H
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on H ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))
    )
    :effect (and
      (not (on H ?from))
      (on H ?to)
    )
  )

  (:action move_agent2_I
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on I ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
    )
    :effect (and
      (not (on I ?from))
      (on I ?to)
    )
  )

  (:action move_agent2_J
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on J ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))
    )
    :effect (and
      (not (on J ?from))
      (on J ?to)
    )
  )

  (:action move_agent2_K
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on K ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from)) (not (on J ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))   (not (on J ?to))
    )
    :effect (and
      (not (on K ?from))
      (on K ?to)
    )
  )

  (:action move_agent2_L
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on L ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from)) (not (on J ?from)) (not (on K ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))   (not (on J ?to))   (not (on K ?to))
    )
    :effect (and
      (not (on L ?from))
      (on L ?to)
    )
  )

  (:action move_agent2_M
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on M ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from)) (not (on J ?from)) (not (on K ?from)) (not (on L ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))   (not (on J ?to))   (not (on K ?to))   (not (on L ?to))
    )
    :effect (and
      (not (on M ?from))
      (on M ?to)
    )
  )

  (:action move_agent2_N
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on N ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from)) (not (on J ?from)) (not (on K ?from)) (not (on L ?from))
      (not (on M ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))   (not (on J ?to))   (not (on K ?to))   (not (on L ?to))
      (not (on M ?to))
    )
    :effect (and
      (not (on N ?from))
      (on N ?to)
    )
  )

  (:action move_agent2_O
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on O ?from)
      (not (= ?from ?to))
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from))
      (not (on E ?from)) (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      (not (on I ?from)) (not (on J ?from)) (not (on K ?from)) (not (on L ?from))
      (not (on M ?from)) (not (on N ?from))
      (not (on A ?to))   (not (on B ?to))   (not (on C ?to))   (not (on D ?to))
      (not (on E ?to))   (not (on F ?to))   (not (on G ?to))   (not (on H ?to))
      (not (on I ?to))   (not (on J ?to))   (not (on K ?to))   (not (on L ?to))
      (not (on M ?to))   (not (on N ?to))
    )
    :effect (and
      (not (on O ?from))
      (on O ?to)
    )
  )

)