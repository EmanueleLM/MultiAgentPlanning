(define (domain hanoi_multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg support)

  (:predicates
    (on ?d - disk ?s - support)        ; disk directly on support (peg or disk)
    (clear ?s - support)              ; nothing is directly on this support
    (can_move_agent1 ?d - disk)
    (can_move_agent2 ?d - disk)
    (can_move_agent3 ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)   ; ?d1 is smaller than ?d2
  )

  ;; Agent 1: allowed to move A,B,C,D,E
  (:action move_agent1_to_peg
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (can_move_agent1 ?d)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move_agent1_to_disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (can_move_agent1 ?d)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Agent 2: allowed to move F,G,H,I,J
  (:action move_agent2_to_peg
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (can_move_agent2 ?d)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move_agent2_to_disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (can_move_agent2 ?d)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  ;; Agent 3: allowed to move K,L,M,N,O
  (:action move_agent3_to_peg
    :parameters (?d - disk ?from - support ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (can_move_agent3 ?d)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )

  (:action move_agent3_to_disk
    :parameters (?d - disk ?from - support ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (smaller ?d ?to)
                    (can_move_agent3 ?d)
                   )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (not (clear ?to))
              (clear ?from)
            )
  )
)