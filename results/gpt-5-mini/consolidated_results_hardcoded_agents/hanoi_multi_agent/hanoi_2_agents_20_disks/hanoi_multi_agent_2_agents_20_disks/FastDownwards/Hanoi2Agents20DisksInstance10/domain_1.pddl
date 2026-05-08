(define (domain hanoi-2agents-20)
  (:requirements :strips :typing :negative-preconditions)
  (:types peg disk smalldisk largedisk)

  (:constants left middle right - peg)

  (:predicates
    ;; a disk is directly on some place (a peg or another disk)
    (on ?d - disk ?p - (either peg disk))
    ;; nothing is on top of this place (i.e., it's clear to receive a disk)
    (clear ?p - (either peg disk))
    ;; ordering relation: ?s is strictly smaller than ?b
    (smaller ?s - disk ?b - disk)
    ;; ownership: which agent may move a disk
    (can_move_by_1 ?d - disk)
    (can_move_by_2 ?d - disk)
  )

  ;; Generic move action for agent_1 moving their allowed disks
  (:action move_by_agent1_to_peg
    :parameters (?d - smalldisk ?from - (either peg disk) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_move_by_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_by_agent1_to_disk
    :parameters (?d - smalldisk ?from - (either peg disk) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can_move_by_1 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Generic move action for agent_2 moving their allowed disks
  (:action move_by_agent2_to_peg
    :parameters (?d - largedisk ?from - (either peg disk) ?to - peg)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (can_move_by_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  (:action move_by_agent2_to_disk
    :parameters (?d - largedisk ?from - (either peg disk) ?to - disk)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (can_move_by_2 ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)