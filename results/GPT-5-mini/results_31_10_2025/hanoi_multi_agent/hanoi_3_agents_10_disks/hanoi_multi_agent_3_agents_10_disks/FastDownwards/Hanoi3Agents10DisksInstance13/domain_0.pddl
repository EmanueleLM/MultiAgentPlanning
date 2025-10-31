(define (domain multi-agent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place agent)
  (:types disk peg - place)
  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)              ; nothing on top of place ?p (disk or peg)
    (smaller ?d - disk ?p - place)  ; ?d is smaller than ?p (p can be disk or peg)
    (can-move ?a - agent ?d - disk) ; permission: agent ?a may move disk ?d
  )

  ;; Agent 1 move action
  (:action move-agent_1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move agent_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Agent 2 move action (available in domain but agent_2 has no permissions in initial state)
  (:action move-agent_2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move agent_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  ;; Agent 3 move action (agent_3 will have no permissions in the initial state)
  (:action move-agent_3
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can-move agent_3 ?d)
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