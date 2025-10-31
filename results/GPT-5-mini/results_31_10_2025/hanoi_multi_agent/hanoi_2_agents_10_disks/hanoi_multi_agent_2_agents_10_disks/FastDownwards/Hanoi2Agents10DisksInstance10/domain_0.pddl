(define (domain hanoi_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)            ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)                  ; nothing is on top of place ?p
    (can_move_agent_1 ?d - disk)        ; agent_1 is permitted to move disk ?d
    (can_move_agent_2 ?d - disk)        ; agent_2 is permitted to move disk ?d
    (can_be_placed_on ?d - disk ?p - place) ; disk ?d may be placed on place ?p (size/peg constraint precomputed)
  )

  ; agent_1 moves (only allowed for disks with can_move_agent_1)
  (:action move_agent_1
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (can_move_agent_1 ?d)
                    (can_be_placed_on ?d ?to)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
             )
  )

  ; agent_2 moves (only allowed for disks with can_move_agent_2)
  (:action move_agent_2
    :parameters (?d - disk ?from - place ?to - place)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (can_move_agent_2 ?d)
                    (can_be_placed_on ?d ?to)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
             )
  )
)