(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    ; disk d is directly on support s (disk or peg)
    (on ?d - disk ?s - object)
    ; object (disk or peg) has nothing on top of it
    (clear ?o - object)
    ; ordering: smaller d1 d2 means d1 is strictly smaller than d2
    (smaller ?d1 - disk ?d2 - disk)
    ; agent permissions
    (can-move-agent1 ?d - disk)
    (can-move-agent2 ?d - disk)
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
      (clear ?d)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 1: move a top disk onto another disk (target must be larger)
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
      (clear ?d)
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
      (clear ?d)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2: move a top disk onto another disk (target must be larger)
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
      (clear ?d)
      (clear ?from)
      (not (clear ?to))
    )
  )
)