(define (domain hanoi_multi_agent_2agents_20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on ?d - disk ?x - (either peg disk))
    (clear ?x - (either peg disk))
    (agent1_disk ?d - disk)
    (agent2_disk ?d - disk)
    (smaller ?d - disk ?e - disk)
  )

  ;; Agent 1 moves to a peg (peg destination)
  (:action move_agent1_to_peg
    :parameters (?d - disk ?from - (either peg disk) ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (agent1_disk ?d)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  ;; Agent 1 moves onto another disk (disk destination) - must be smaller than destination
  (:action move_agent1_to_disk
    :parameters (?d - disk ?from - (either peg disk) ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (agent1_disk ?d)
                    (smaller ?d ?to)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  ;; Agent 2 moves to a peg (peg destination)
  (:action move_agent2_to_peg
    :parameters (?d - disk ?from - (either peg disk) ?to - peg)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (agent2_disk ?d)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )

  ;; Agent 2 moves onto another disk (disk destination) - must be smaller than destination
  (:action move_agent2_to_disk
    :parameters (?d - disk ?from - (either peg disk) ?to - disk)
    :precondition (and
                    (on ?d ?from)
                    (clear ?d)
                    (clear ?to)
                    (agent2_disk ?d)
                    (smaller ?d ?to)
                  )
    :effect (and
              (not (on ?d ?from))
              (on ?d ?to)
              (clear ?from)
              (not (clear ?to))
            )
  )
)