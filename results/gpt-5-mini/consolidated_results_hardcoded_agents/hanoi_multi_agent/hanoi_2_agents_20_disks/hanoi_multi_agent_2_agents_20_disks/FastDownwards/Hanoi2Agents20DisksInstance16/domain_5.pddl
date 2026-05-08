(define (domain hanoi_multi_agent_2agents_20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent - object loc - object disk peg - loc)

  (:predicates
    (on ?d - disk ?x - loc)
    (clear ?x - loc)
    (agent1_disk ?d - disk)
    (agent2_disk ?d - disk)
    (smaller ?d - disk ?e - disk)
  )

  (:action move_agent1_to_peg
    :parameters (?d - disk ?from - loc ?to - peg)
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

  (:action move_agent1_to_disk
    :parameters (?d - disk ?from - loc ?to - disk)
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

  (:action move_agent2_to_peg
    :parameters (?d - disk ?from - loc ?to - peg)
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

  (:action move_agent2_to_disk
    :parameters (?d - disk ?from - loc ?to - disk)
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