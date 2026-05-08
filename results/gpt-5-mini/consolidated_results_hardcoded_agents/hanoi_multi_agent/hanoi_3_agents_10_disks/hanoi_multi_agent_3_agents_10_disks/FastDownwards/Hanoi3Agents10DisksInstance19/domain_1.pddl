(define (domain multiagent-hanoi-3agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)     ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)           ; nothing on top of place ?p (peg or disk)
    (allowed1 ?d - disk)         ; agent_1 may move ?d
    (allowed2 ?d - disk)         ; agent_2 may move ?d
    (allowed3 ?d - disk)         ; agent_3 may move ?d
    (canplace ?d - disk ?p - place) ; disk ?d may be placed onto place ?p (peg or disk)
  )

  ; move action for agent_1 (moves disks A-D)
  (:action move-agent_1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed1 ?d)
      (canplace ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ; move action for agent_2 (moves disks E-G)
  (:action move-agent_2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed2 ?d)
      (canplace ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ; move action for agent_3 (moves disks H-J)
  (:action move-agent_3
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (allowed3 ?d)
      (canplace ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?d)
      (not (clear ?to))
      (clear ?from)
    )
  )
)