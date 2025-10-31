(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent)

  (:predicates
    ;; disk d is directly on place p (a place is either a peg or another disk)
    (on ?d - disk ?p - place)
    ;; place (peg or disk) has nothing on top
    (clear ?p - place)
    ;; size ordering (static)
    (smaller ?d1 - disk ?d2 - disk)
    ;; agent capability: agent can move this disk
    (agent-can-move ?ag - agent ?d - disk)
    ;; static table: can this disk be placed on this place (peg or disk)
    (can-place ?d - disk ?p - place)
  )

  ;; agent_1 moves (disks A..G)
  (:action agent_1_move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent-can-move agent_1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; agent_2 moves (disks H..N)
  (:action agent_2_move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent-can-move agent_2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  ;; agent_3 moves (disks O..T)
  (:action agent_3_move
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent-can-move agent_3 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-place ?d ?to)
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