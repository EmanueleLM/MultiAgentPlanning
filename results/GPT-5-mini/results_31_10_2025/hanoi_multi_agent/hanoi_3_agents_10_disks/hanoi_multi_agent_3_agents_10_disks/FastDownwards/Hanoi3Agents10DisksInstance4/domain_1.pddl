(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent - object)

  (:predicates
    ;; disk is directly on an object (another disk or a peg)
    (on ?d - disk ?s - object)
    ;; a support (peg or disk) has nothing on top of it
    (clear ?o - object)
    ;; static size relation: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; which agent is allowed to move which disk
    (allowed ?a - agent ?d - disk)
    ;; agent availability flag
    (can-act ?a - agent)
  )

  ;; Agent 1 actions
  (:action agent_1_move_to_peg_empty
    :parameters (?disk - disk ?from - object ?to - peg)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?to)
      (allowed agent_1 ?disk)
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
    :parameters (?disk - disk ?from - object ?below - disk)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?below)
      (smaller ?disk ?below)
      (allowed agent_1 ?disk)
      (can-act agent_1)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?below)
      (not (clear ?below))
      (clear ?from)
    )
  )

  ;; Agent 2 actions
  (:action agent_2_move_to_peg_empty
    :parameters (?disk - disk ?from - object ?to - peg)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?to)
      (allowed agent_2 ?disk)
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
    :parameters (?disk - disk ?from - object ?below - disk)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?below)
      (smaller ?disk ?below)
      (allowed agent_2 ?disk)
      (can-act agent_2)
    )
    :effect (and
      (not (on ?disk ?from))
      (on ?disk ?below)
      (not (clear ?below))
      (clear ?from)
    )
  )

  ;; Agent 3 actions
  (:action agent_3_move_to_peg_empty
    :parameters (?disk - disk ?from - object ?to - peg)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?to)
      (allowed agent_3 ?disk)
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
    :parameters (?disk - disk ?from - object ?below - disk)
    :precondition (and
      (on ?disk ?from)
      (clear ?disk)
      (clear ?below)
      (smaller ?disk ?below)
      (allowed agent_3 ?disk)
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