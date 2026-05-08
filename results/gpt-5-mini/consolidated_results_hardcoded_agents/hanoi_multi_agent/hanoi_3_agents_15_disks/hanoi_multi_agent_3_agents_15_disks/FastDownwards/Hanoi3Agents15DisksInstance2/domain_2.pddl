(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:constants A B C D E F G H I J K L M N O - disk)

  (:predicates
    (on ?d - disk ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
    (agent2-enabled)
    (agent3-enabled)
  )

  ;; Agent 1 actions: allowed to move A..E (only when top of their peg and respecting smaller-disk constraints)
  (:action agent_1_move_A
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on A ?from)
      ;; A is smallest: no smaller-disk preconditions
      ;; destination must not contain any disk smaller than A (none)
    )
    :effect (and
      (not (on A ?from))
      (on A ?to)
    )
  )

  (:action agent_1_move_B
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on B ?from)
      ;; B is top on ?from: A must not be on ?from
      (not (on A ?from))
      ;; destination must not have smaller disk A
      (not (on A ?to))
    )
    :effect (and
      (not (on B ?from))
      (on B ?to)
    )
  )

  (:action agent_1_move_C
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on C ?from)
      ;; C is top on ?from: A and B must not be on ?from
      (not (on A ?from))
      (not (on B ?from))
      ;; destination must not have A or B
      (not (on A ?to))
      (not (on B ?to))
    )
    :effect (and
      (not (on C ?from))
      (on C ?to)
    )
  )

  (:action agent_1_move_D
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on D ?from)
      ;; D is top on ?from: A,B,C must not be on ?from
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      ;; destination must not have A,B,C
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
    )
    :effect (and
      (not (on D ?from))
      (on D ?to)
    )
  )

  (:action agent_1_move_E
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (on E ?from)
      ;; E is top on ?from: A,B,C,D must not be on ?from
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on D ?from))
      ;; destination must not have A,B,C,D
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
      (not (on D ?to))
    )
    :effect (and
      (not (on E ?from))
      (on E ?to)
    )
  )

  ;; Agent 2 actions: F..J (require agent2-enabled to be true to allow these actions)
  (:action agent_2_move_F
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent2-enabled)
      (on F ?from)
      ;; F is top on ?from: smaller disks A..E must not be on ?from
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      ;; destination must not have A..E
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
    )
    :effect (and
      (not (on F ?from))
      (on F ?to)
    )
  )

  (:action agent_2_move_G
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent2-enabled)
      (on G ?from)
      ;; smaller on ?from: A..F must not be on ?from
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      (not (on F ?from))
      ;; destination must not have A..F
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to))
    )
    :effect (and
      (not (on G ?from))
      (on G ?to)
    )
  )

  (:action agent_2_move_H
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent2-enabled)
      (on H ?from)
      ;; smaller on ?from: A..G must not be on ?from
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      (not (on F ?from)) (not (on G ?from))
      ;; destination must not have A..G
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to))
    )
    :effect (and
      (not (on H ?from))
      (on H ?to)
    )
  )

  (:action agent_2_move_I
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent2-enabled)
      (on I ?from)
      ;; smaller on ?from: A..H must not be on ?from
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      (not (on F ?from)) (not (on G ?from)) (not (on H ?from))
      ;; destination must not have A..H
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to)) (not (on H ?to))
    )
    :effect (and
      (not (on I ?from))
      (on I ?to)
    )
  )

  (:action agent_2_move_J
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent2-enabled)
      (on J ?from)
      ;; smaller on ?from: A..I must not be on ?from
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      (not (on F ?from)) (not (on G ?from)) (not (on H ?from)) (not (on I ?from))
      ;; destination must not have A..I
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to)) (not (on H ?to)) (not (on I ?to))
    )
    :effect (and
      (not (on J ?from))
      (on J ?to)
    )
  )

  ;; Agent 3 actions: K..O (require agent3-enabled to be true)
  (:action agent_3_move_K
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent3-enabled)
      (on K ?from)
      ;; smaller on ?from: A..J must not be on ?from
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      (not (on F ?from)) (not (on G ?from)) (not (on H ?from)) (not (on I ?from)) (not (on J ?from))
      ;; destination must not have A..J
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to)) (not (on H ?to)) (not (on I ?to)) (not (on J ?to))
    )
    :effect (and
      (not (on K ?from))
      (on K ?to)
    )
  )

  (:action agent_3_move_L
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent3-enabled)
      (on L ?from)
      ;; smaller on ?from: A..K must not be on ?from
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      (not (on F ?from)) (not (on G ?from)) (not (on H ?from)) (not (on I ?from)) (not (on J ?from))
      (not (on K ?from))
      ;; destination must not have A..K
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to)) (not (on H ?to)) (not (on I ?to)) (not (on J ?to))
      (not (on K ?to))
    )
    :effect (and
      (not (on L ?from))
      (on L ?to)
    )
  )

  (:action agent_3_move_M
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent3-enabled)
      (on M ?from)
      ;; smaller on ?from: A..L must not be on ?from
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      (not (on F ?from)) (not (on G ?from)) (not (on H ?from)) (not (on I ?from)) (not (on J ?from))
      (not (on K ?from)) (not (on L ?from))
      ;; destination must not have A..L
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to)) (not (on H ?to)) (not (on I ?to)) (not (on J ?to))
      (not (on K ?to)) (not (on L ?to))
    )
    :effect (and
      (not (on M ?from))
      (on M ?to)
    )
  )

  (:action agent_3_move_N
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent3-enabled)
      (on N ?from)
      ;; smaller on ?from: A..M must not be on ?from
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      (not (on F ?from)) (not (on G ?from)) (not (on H ?from)) (not (on I ?from)) (not (on J ?from))
      (not (on K ?from)) (not (on L ?from)) (not (on M ?from))
      ;; destination must not have A..M
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to)) (not (on H ?to)) (not (on I ?to)) (not (on J ?to))
      (not (on K ?to)) (not (on L ?to)) (not (on M ?to))
    )
    :effect (and
      (not (on N ?from))
      (on N ?to)
    )
  )

  (:action agent_3_move_O
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent3-enabled)
      (on O ?from)
      ;; smaller on ?from: A..N must not be on ?from
      (not (on A ?from)) (not (on B ?from)) (not (on C ?from)) (not (on D ?from)) (not (on E ?from))
      (not (on F ?from)) (not (on G ?from)) (not (on H ?from)) (not (on I ?from)) (not (on J ?from))
      (not (on K ?from)) (not (on L ?from)) (not (on M ?from)) (not (on N ?from))
      ;; destination must not have A..N
      (not (on A ?to)) (not (on B ?to)) (not (on C ?to)) (not (on D ?to)) (not (on E ?to))
      (not (on F ?to)) (not (on G ?to)) (not (on H ?to)) (not (on I ?to)) (not (on J ?to))
      (not (on K ?to)) (not (on L ?to)) (not (on M ?to)) (not (on N ?to))
    )
    :effect (and
      (not (on O ?from))
      (on O ?to)
    )
  )
)