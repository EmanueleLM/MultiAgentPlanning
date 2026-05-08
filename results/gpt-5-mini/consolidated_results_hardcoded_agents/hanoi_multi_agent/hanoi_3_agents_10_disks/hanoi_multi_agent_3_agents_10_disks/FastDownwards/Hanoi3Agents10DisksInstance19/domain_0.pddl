(define (domain multiagent-hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object
          place - object) ; disk and peg are subtypes of place via typing declaration below
  (:predicates
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (place = peg or disk)
    (clear ?p - place)              ; nothing on top of place ?p (peg or disk)
    (allowed1 ?d - disk)            ; agent_1 is allowed to move disk ?d
    (allowed2 ?d - disk)            ; agent_2 is allowed to move disk ?d
    (allowed3 ?d - disk)            ; agent_3 is allowed to move disk ?d
    (canplace ?d - disk ?p - place) ; static predicate: disk ?d may be placed on ?p (peg or disk)
  )

  ; move action for agent_1 (can move A-D)
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

  ; move action for agent_2 (can move E-G)
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

  ; move action for agent_3 (can move H-J)
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