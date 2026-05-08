(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types object disk peg)
  (:predicates
    (on ?d - disk ?s - object)            ; disk d is directly on support s (disk or peg)
    (clear ?o - object)                  ; no disk on top of object o (disk or peg)
    (smaller ?d1 - disk ?d2 - disk)      ; d1 is smaller than d2
    (can-move-agent1 ?d - disk)          ; agent_1 is permitted to move disk d
    (can-move-agent2 ?d - disk)          ; agent_2 is permitted to move disk d
  )

  ;; Agent 1: move a top disk onto an empty peg
  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent1 ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 1: move a top disk onto another disk (must be larger)
  (:action move-agent1-onto-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move-agent1 ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2: move a top disk onto an empty peg
  (:action move-agent2-to-peg
    :parameters (?d - disk ?from - object ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move-agent2 ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2: move a top disk onto another disk (must be larger)
  (:action move-agent2-onto-disk
    :parameters (?d - disk ?from - object ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move-agent2 ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)