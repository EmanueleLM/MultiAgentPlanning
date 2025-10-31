(define (domain hanoi_two_agents_15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on ?d - disk ?p - peg)                   ; disk ?d is on peg ?p
    (top ?p - peg ?d - disk)                  ; ?d is the top disk on peg ?p
    (empty ?p - peg)                          ; peg ?p is empty
    (direct_below ?d1 - disk ?d2 - disk)      ; ?d1 is directly below ?d2 on same peg
    (smaller ?d1 - disk ?d2 - disk)           ; ?d1 is smaller than ?d2
    (can_move_agent1 ?d - disk)               ; agent_1 is allowed to move disk ?d
    (can_move_agent2 ?d - disk)               ; agent_2 is allowed to move disk ?d
  )

  ;; Agent 1: move a top disk ?d from ?from to an empty ?to, when there is a disk ?newtop directly below ?d on ?from
  (:action move_agent_1_to_empty_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?newtop - disk)
    :precondition (and
      (on ?d ?from)
      (top ?from ?d)
      (empty ?to)
      (direct_below ?newtop ?d)
      (can_move_agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (top ?from ?newtop)
      (not (direct_below ?newtop ?d))
      (not (empty ?to))
    )
  )

  ;; Agent 1: move a top disk ?d from ?from onto top disk ?d2 on ?to; there is a disk ?newtop directly below ?d on ?from
  (:action move_agent_1_on_top_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk ?newtop - disk)
    :precondition (and
      (on ?d ?from)
      (top ?from ?d)
      (top ?to ?d2)
      (smaller ?d ?d2)
      (direct_below ?newtop ?d)
      (can_move_agent1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (top ?to ?d2))
      (top ?from ?newtop)
      (not (direct_below ?newtop ?d))
      (direct_below ?d ?d2)
    )
  )

  ;; Agent 2: move a top disk ?d from ?from to an empty ?to, when there is a disk ?newtop directly below ?d on ?from
  (:action move_agent_2_to_empty_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?newtop - disk)
    :precondition (and
      (on ?d ?from)
      (top ?from ?d)
      (empty ?to)
      (direct_below ?newtop ?d)
      (can_move_agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (top ?from ?newtop)
      (not (direct_below ?newtop ?d))
      (not (empty ?to))
    )
  )

  ;; Agent 2: move a top disk ?d from ?from onto top disk ?d2 on ?to; there is a disk ?newtop directly below ?d on ?from
  (:action move_agent_2_on_top_with_below
    :parameters (?d - disk ?from - peg ?to - peg ?d2 - disk ?newtop - disk)
    :precondition (and
      (on ?d ?from)
      (top ?from ?d)
      (top ?to ?d2)
      (smaller ?d ?d2)
      (direct_below ?newtop ?d)
      (can_move_agent2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?to ?d)
      (not (top ?to ?d2))
      (top ?from ?newtop)
      (not (direct_below ?newtop ?d))
      (direct_below ?d ?d2)
    )
  )

  ;; Note: The domain supports moves where the moved disk has a disk directly below it.
  ;; This captures the necessary top→newtop update for our instance (top A with B below).
)