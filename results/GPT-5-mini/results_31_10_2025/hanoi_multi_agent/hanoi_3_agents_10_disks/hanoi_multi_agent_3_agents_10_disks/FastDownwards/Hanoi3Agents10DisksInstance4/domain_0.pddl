(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg support agent)
  ;; disks and pegs are supports (pegs are supports; disks will be declared as subtype of support in the problem objects)
  ;; We will treat disks and pegs both as supports by listing types in the problem; PDDL typing here keeps names separate.
  (:predicates
    (on ?d - disk ?s - support)      ;; direct support: disk ?d is directly on support ?s (support = peg or disk)
    (clear ?s - support)            ;; support ?s has no disk on top of it (top is free)
    (smaller ?d1 - disk ?d2 - disk) ;; disk ?d1 is smaller than disk ?d2 (static, domain knowledge)
    (can-act ?a - agent)            ;; availability flag for an agent (true = agent can execute moves)
  )

  ;; Agent 1 actions (moves allowed only if the agent is available)
  (:action agent_1_move_to_peg_empty
    :parameters (?disk - disk ?from - support ?to - peg)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?to)
      (can-act agent_1)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action agent_1_move_onto_disk
    :parameters (?disk - disk ?from - support ?below - disk)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?below)
      (smaller ?disk ?below)
      (can-act agent_1)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?below)
      (not (clear ?below))
      (clear ?from)
    )
  )

  ;; Agent 2 actions (defined but agent_2 will be unavailable in the problem initial state)
  (:action agent_2_move_to_peg_empty
    :parameters (?disk - disk ?from - support ?to - peg)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?to)
      (can-act agent_2)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action agent_2_move_onto_disk
    :parameters (?disk - disk ?from - support ?below - disk)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?below)
      (smaller ?disk ?below)
      (can-act agent_2)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?below)
      (not (clear ?below))
      (clear ?from)
    )
  )

  ;; Agent 3 actions (defined but agent_3 will be unavailable in the problem initial state)
  (:action agent_3_move_to_peg_empty
    :parameters (?disk - disk ?from - support ?to - peg)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?to)
      (can-act agent_3)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action agent_3_move_onto_disk
    :parameters (?disk - disk ?from - support ?below - disk)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?below)
      (smaller ?disk ?below)
      (can-act agent_3)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?below)
      (not (clear ?below))
      (clear ?from)
    )
  )
)