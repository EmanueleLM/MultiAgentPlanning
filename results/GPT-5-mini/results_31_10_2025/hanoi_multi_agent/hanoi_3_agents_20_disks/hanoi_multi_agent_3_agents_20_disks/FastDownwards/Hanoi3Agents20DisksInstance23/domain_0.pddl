(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent)

  (:predicates
    (on ?d - disk ?p - place)        ; disk d is directly on place p (peg or disk)
    (clear ?p - place)               ; place p has nothing on top
    (smaller ?d1 - disk ?d2 - disk)  ; d1 is smaller than d2
    (agent-can-move ?ag - agent ?d - disk) ; agent can move this disk (capability)
    (can-place ?d - disk ?p - place) ; static: disk d may be placed on place p by size/type
  )

  ;; Agent 1 moves disks A..G
  (:action agent_1_move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent-can-move agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (not (= ?d ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 2 moves disks H..N
  (:action agent_2_move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent-can-move agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (not (= ?d ?to))
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; Agent 3 moves disks O..T
  (:action agent_3_move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent-can-move agent3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (not (= ?d ?to))
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