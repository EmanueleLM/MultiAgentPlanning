(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk d is immediately on place p (disk or peg)
    (clear ?p - place)               ; nothing is on top of place p
    (smaller ?a - place ?b - place)  ; a is smaller than b (only asserted for disk pairs)
    (agent1disk ?d - disk)           ; disk is movable by agent_1
    (agent2disk ?d - disk)           ; disk is movable by agent_2
  )

  ;; Agent 1 moves: may move only disks labeled A-E
  (:action move-agent1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent1disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (smaller ?to ?d))        ; forbid placing a larger disk onto a smaller one
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Agent 2 moves: may move only disks labeled F-J
  (:action move-agent2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (agent2disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (not (smaller ?to ?d))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )
)