(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - location)

  (:predicates
    ;; disk is directly on a location (disk or peg)
    (on ?d - disk ?loc - location)
    ;; location (disk or peg) has nothing directly on it
    (clear ?loc - location)
    ;; size ordering: ?d1 is smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; movement permissions for agents
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
    (can-move-agent3 ?d - disk)
  )

  ;; ---------- Agent 1 actions (may move A B C D) ----------
  ;; move an agent-1 disk onto an empty peg
  (:action agent1-move-to-peg
    :parameters (?d - disk ?from - location ?peg - peg)
    :precondition (and
      (can-move-agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (not (clear ?peg))
      (clear ?from)
    )
  )

  ;; move an agent-1 disk onto another disk (requires being smaller)
  (:action agent1-move-to-disk
    :parameters (?d - disk ?from - location ?dst - disk)
    :precondition (and
      (can-move-agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?from)
    )
  )

  ;; ---------- Agent 2 actions (may move E F G) ----------
  (:action agent2-move-to-peg
    :parameters (?d - disk ?from - location ?peg - peg)
    :precondition (and
      (can-move-agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (not (clear ?peg))
      (clear ?from)
    )
  )

  (:action agent2-move-to-disk
    :parameters (?d - disk ?from - location ?dst - disk)
    :precondition (and
      (can-move-agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?from)
    )
  )

  ;; ---------- Agent 3 actions (may move H I J) ----------
  (:action agent3-move-to-peg
    :parameters (?d - disk ?from - location ?peg - peg)
    :precondition (and
      (can-move-agent3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (not (clear ?peg))
      (clear ?from)
    )
  )

  (:action agent3-move-to-disk
    :parameters (?d - disk ?from - location ?dst - disk)
    :precondition (and
      (can-move-agent3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (not (clear ?dst))
      (clear ?from)
    )
  )
)