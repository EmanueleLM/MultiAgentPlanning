(define (domain hanoi-2agents-10)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    disk
    peg
    disk_agent1 disk_agent2 - disk
  )

  (:predicates
    (on ?d - disk ?below - disk)
    (on-peg ?d - disk ?p - peg)
    (clear_disk ?d - disk)
    (clear_peg ?p - peg)
    (smaller ?d1 - disk ?d2 - disk)
  )

  (:action agent_1_move_from_peg_to_peg
    :parameters (?d - disk_agent1 ?from - peg ?to - peg)
    :precondition (and (on-peg ?d ?from) (clear_disk ?d) (clear_peg ?to))
    :effect (and
              (not (on-peg ?d ?from)) (on-peg ?d ?to)
              (clear_peg ?from) (not (clear_peg ?to))
              (clear_disk ?d)
            )
  )

  (:action agent_1_move_from_disk_to_peg
    :parameters (?d - disk_agent1 ?from - disk ?to - peg)
    :precondition (and (on ?d ?from) (clear_disk ?d) (clear_peg ?to))
    :effect (and
              (not (on ?d ?from)) (on-peg ?d ?to)
              (clear_disk ?from) (not (clear_peg ?to))
              (clear_disk ?d)
            )
  )

  (:action agent_1_move_from_peg_to_disk
    :parameters (?d - disk_agent1 ?from - peg ?to - disk)
    :precondition (and (on-peg ?d ?from) (clear_disk ?d) (clear_disk ?to) (smaller ?d ?to))
    :effect (and
              (not (on-peg ?d ?from)) (on ?d ?to)
              (clear_peg ?from) (not (clear_disk ?to))
              (clear_disk ?d)
            )
  )

  (:action agent_1_move_from_disk_to_disk
    :parameters (?d - disk_agent1 ?from - disk ?to - disk)
    :precondition (and (on ?d ?from) (clear_disk ?d) (clear_disk ?to) (smaller ?d ?to))
    :effect (and
              (not (on ?d ?from)) (on ?d ?to)
              (clear_disk ?from) (not (clear_disk ?to))
              (clear_disk ?d)
            )
  )

  (:action agent_2_move_from_peg_to_peg
    :parameters (?d - disk_agent2 ?from - peg ?to - peg)
    :precondition (and (on-peg ?d ?from) (clear_disk ?d) (clear_peg ?to))
    :effect (and
              (not (on-peg ?d ?from)) (on-peg ?d ?to)
              (clear_peg ?from) (not (clear_peg ?to))
              (clear_disk ?d)
            )
  )

  (:action agent_2_move_from_disk_to_peg
    :parameters (?d - disk_agent2 ?from - disk ?to - peg)
    :precondition (and (on ?d ?from) (clear_disk ?d) (clear_peg ?to))
    :effect (and
              (not (on ?d ?from)) (on-peg ?d ?to)
              (clear_disk ?from) (not (clear_peg ?to))
              (clear_disk ?d)
            )
  )

  (:action agent_2_move_from_peg_to_disk
    :parameters (?d - disk_agent2 ?from - peg ?to - disk)
    :precondition (and (on-peg ?d ?from) (clear_disk ?d) (clear_disk ?to) (smaller ?d ?to))
    :effect (and
              (not (on-peg ?d ?from)) (on ?d ?to)
              (clear_peg ?from) (not (clear_disk ?to))
              (clear_disk ?d)
            )
  )

  (:action agent_2_move_from_disk_to_disk
    :parameters (?d - disk_agent2 ?from - disk ?to - disk)
    :precondition (and (on ?d ?from) (clear_disk ?d) (clear_disk ?to) (smaller ?d ?to))
    :effect (and
              (not (on ?d ?from)) (on ?d ?to)
              (clear_disk ?from) (not (clear_disk ?to))
              (clear_disk ?d)
            )
  )
)