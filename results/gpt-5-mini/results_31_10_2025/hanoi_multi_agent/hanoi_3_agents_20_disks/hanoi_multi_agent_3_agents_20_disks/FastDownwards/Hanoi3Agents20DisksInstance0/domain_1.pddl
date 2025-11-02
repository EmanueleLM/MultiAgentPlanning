(define (domain hanoi-3agent-20disk)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent - object)

  (:predicates
    ;; on ?d ?x means disk ?d is directly on object ?x (object can be a disk or a peg)
    (on ?d - disk ?x - object)
    ;; clear ?x means there is no disk on top of object ?x (object can be disk or peg)
    (clear ?x - object)
    ;; agent permission: agent can move disk
    (can-move ?a - agent ?d - disk)
    ;; smaller relation: ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
  )

  ;; Agent 1 moves: to peg
  (:action move_agent_1_to_peg
    :parameters (?d - disk ?from - object ?p - peg)
    :precondition (and
      (can-move agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (not (clear ?p))
      (clear ?from)
    )
  )

  ;; Agent 1 moves: to disk
  (:action move_agent_1_to_disk
    :parameters (?d - disk ?from - object ?d2 - disk)
    :precondition (and
      (can-move agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?d2)
      (not (clear ?d2))
      (clear ?from)
    )
  )

  ;; Agent 2 moves: to peg
  (:action move_agent_2_to_peg
    :parameters (?d - disk ?from - object ?p - peg)
    :precondition (and
      (can-move agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (not (clear ?p))
      (clear ?from)
    )
  )

  ;; Agent 2 moves: to disk
  (:action move_agent_2_to_disk
    :parameters (?d - disk ?from - object ?d2 - disk)
    :precondition (and
      (can-move agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?d2)
      (not (clear ?d2))
      (clear ?from)
    )
  )

  ;; Agent 3 moves: to peg
  (:action move_agent_3_to_peg
    :parameters (?d - disk ?from - object ?p - peg)
    :precondition (and
      (can-move agent_3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?p)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?p)
      (not (clear ?p))
      (clear ?from)
    )
  )

  ;; Agent 3 moves: to disk
  (:action move_agent_3_to_disk
    :parameters (?d - disk ?from - object ?d2 - disk)
    :precondition (and
      (can-move agent_3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?d2)
      (smaller ?d ?d2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?d2)
      (not (clear ?d2))
      (clear ?from)
    )
  )
)