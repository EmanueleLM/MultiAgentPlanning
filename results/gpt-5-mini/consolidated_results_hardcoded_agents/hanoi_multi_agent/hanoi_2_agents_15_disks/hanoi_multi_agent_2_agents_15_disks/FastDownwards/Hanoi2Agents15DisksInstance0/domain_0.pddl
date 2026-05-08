(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ; nothing on top of place ?p
    (can-move ?a - agent ?d - disk) ; agent capability: agent ?a may move disk ?d
    (smaller ?d - disk ?p - place)  ; disk ?d is smaller than place ?p (peg or disk)
  )

  ;; Agent 1 move action schema
  (:action move-agent_1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_1 ?d)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2 move action schema
  (:action move-agent_2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can-move agent_2 ?d)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)