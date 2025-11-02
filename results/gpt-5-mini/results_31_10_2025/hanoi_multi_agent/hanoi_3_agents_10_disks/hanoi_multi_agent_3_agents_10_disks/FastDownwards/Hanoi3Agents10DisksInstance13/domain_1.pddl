(define (domain multi-agent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types place agent)
  (:types disk peg - place)

  (:predicates
    ;; disk is directly on place (disk or peg)
    (on ?d - disk ?p - place)
    ;; nothing on top of place (disk or peg)
    (clear ?p - place)
    ;; ordering: ?d is smaller than ?p (p can be disk or peg)
    (smaller ?d - disk ?p - place)
    ;; permission: agent may move disk
    (can-move ?a - agent ?d - disk)
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

  ;; Agent 2 move action
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

  ;; Agent 3 move action
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