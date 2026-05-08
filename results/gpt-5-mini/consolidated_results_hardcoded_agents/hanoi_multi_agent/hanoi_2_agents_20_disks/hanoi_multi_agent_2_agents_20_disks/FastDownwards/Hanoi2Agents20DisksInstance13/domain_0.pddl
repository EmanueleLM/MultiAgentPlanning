(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)

  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)         ; disk ?d is on peg ?p
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is smaller than ?d2
    (agent1-enabled)
    (agent2-enabled)
  )

  ;; Agent 1 move actions (one schema for each disk to allow size-specific negative preconditions).
  ;; Each action moves a single disk from one peg to another, only if no smaller disk is on the source
  ;; (so the disk is the top disk on the source) and no smaller disk is on the destination (so placing is legal).

  ;; Move A (A is the smallest disk; no smaller disks to check)
  (:action agent_1_move_A
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent1-enabled)
      (on A ?from)
      (not (on A ?to))
    )
    :effect (and
      (not (on A ?from))
      (on A ?to)
    )
  )

  ;; Move B (A is smaller than B)
  (:action agent_1_move_B
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent1-enabled)
      (on B ?from)
      (not (on A ?from))  ;; A must not be on source (so B is top)
      (not (on A ?to))    ;; A must not be on destination (so B can be placed)
      (not (on B ?to))
    )
    :effect (and
      (not (on B ?from))
      (on B ?to)
    )
  )

  ;; Move C (A and B are smaller)
  (:action agent_1_move_C
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent1-enabled)
      (on C ?from)
      (not (on A ?from))
      (not (on B ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
    )
    :effect (and
      (not (on C ?from))
      (on C ?to)
    )
  )

  ;; Move D (A, B, C are smaller)
  (:action agent_1_move_D
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent1-enabled)
      (on D ?from)
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
      (not (on D ?to))
    )
    :effect (and
      (not (on D ?from))
      (on D ?to)
    )
  )

  ;; Move E (A, B, C, D are smaller)
  (:action agent_1_move_E
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent1-enabled)
      (on E ?from)
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on D ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
      (not (on D ?to))
      (not (on E ?to))
    )
    :effect (and
      (not (on E ?from))
      (on E ?to)
    )
  )

  ;; Agent 2 move actions - defined but disabled in the initial state (agent2-enabled not set).
  ;; Same size restrictions as Agent 1. Agent 2 had no available moves in the provided data,
  ;; so these actions will be unusable unless agent2-enabled is set in the problem.

  (:action agent_2_move_A
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent2-enabled)
      (on A ?from)
      (not (on A ?to))
    )
    :effect (and
      (not (on A ?from))
      (on A ?to)
    )
  )

  (:action agent_2_move_B
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent2-enabled)
      (on B ?from)
      (not (on A ?from))
      (not (on A ?to))
      (not (on B ?to))
    )
    :effect (and
      (not (on B ?from))
      (on B ?to)
    )
  )

  (:action agent_2_move_C
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent2-enabled)
      (on C ?from)
      (not (on A ?from))
      (not (on B ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
    )
    :effect (and
      (not (on C ?from))
      (on C ?to)
    )
  )

  (:action agent_2_move_D
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent2-enabled)
      (on D ?from)
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
      (not (on D ?to))
    )
    :effect (and
      (not (on D ?from))
      (on D ?to)
    )
  )

  (:action agent_2_move_E
    :parameters (?from - peg ?to - peg)
    :precondition (and
      (agent2-enabled)
      (on E ?from)
      (not (on A ?from))
      (not (on B ?from))
      (not (on C ?from))
      (not (on D ?from))
      (not (on A ?to))
      (not (on B ?to))
      (not (on C ?to))
      (not (on D ?to))
      (not (on E ?to))
    )
    :effect (and
      (not (on E ?from))
      (on E ?to)
    )
  )

)