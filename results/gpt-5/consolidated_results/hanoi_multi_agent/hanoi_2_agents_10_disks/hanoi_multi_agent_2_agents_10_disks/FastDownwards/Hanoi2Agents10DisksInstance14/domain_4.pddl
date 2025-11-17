(define (domain hanoi-2agents-10disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg - support
    disk - support
    disk_a_e - disk
    disk_f_j - disk
  )
  (:predicates
    (peg ?p - peg)
    (disk ?d - disk)
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (top ?d - disk ?p - peg)
  )

  ; Agent 1 actions (disks A-E)
  (:action move_from_disk_to_peg_agent_1
    :parameters (?d - disk_a_e ?u - disk ?p - peg ?q - peg)
    :precondition (and
      (on ?d ?u)
      (clear ?d)
      (clear ?q)
      (top ?d ?p)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?q)
      (clear ?u)
      (not (clear ?q))
      (not (top ?d ?p))
      (top ?u ?p)
      (top ?d ?q)
    )
  )

  (:action move_from_disk_to_disk_agent_1
    :parameters (?d - disk_a_e ?u - disk ?v - disk ?p - peg ?q - peg)
    :precondition (and
      (on ?d ?u)
      (clear ?d)
      (clear ?v)
      (smaller ?d ?v)
      (top ?d ?p)
      (top ?v ?q)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?v)
      (clear ?u)
      (not (clear ?v))
      (not (top ?d ?p))
      (top ?u ?p)
      (not (top ?v ?q))
      (top ?d ?q)
    )
  )

  (:action move_from_peg_to_peg_agent_1
    :parameters (?d - disk_a_e ?u - peg ?q - peg)
    :precondition (and
      (on ?d ?u)
      (clear ?d)
      (clear ?q)
      (top ?d ?u)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?q)
      (not (clear ?q))
      (clear ?u)
      (not (top ?d ?u))
      (top ?d ?q)
    )
  )

  (:action move_from_peg_to_disk_agent_1
    :parameters (?d - disk_a_e ?u - peg ?v - disk ?q - peg)
    :precondition (and
      (on ?d ?u)
      (clear ?d)
      (clear ?v)
      (smaller ?d ?v)
      (top ?d ?u)
      (top ?v ?q)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?v)
      (clear ?u)
      (not (clear ?v))
      (not (top ?d ?u))
      (not (top ?v ?q))
      (top ?d ?q)
    )
  )

  ; Agent 2 actions (disks F-J)
  (:action move_from_disk_to_peg_agent_2
    :parameters (?d - disk_f_j ?u - disk ?p - peg ?q - peg)
    :precondition (and
      (on ?d ?u)
      (clear ?d)
      (clear ?q)
      (top ?d ?p)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?q)
      (clear ?u)
      (not (clear ?q))
      (not (top ?d ?p))
      (top ?u ?p)
      (top ?d ?q)
    )
  )

  (:action move_from_disk_to_disk_agent_2
    :parameters (?d - disk_f_j ?u - disk ?v - disk ?p - peg ?q - peg)
    :precondition (and
      (on ?d ?u)
      (clear ?d)
      (clear ?v)
      (smaller ?d ?v)
      (top ?d ?p)
      (top ?v ?q)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?v)
      (clear ?u)
      (not (clear ?v))
      (not (top ?d ?p))
      (top ?u ?p)
      (not (top ?v ?q))
      (top ?d ?q)
    )
  )

  (:action move_from_peg_to_peg_agent_2
    :parameters (?d - disk_f_j ?u - peg ?q - peg)
    :precondition (and
      (on ?d ?u)
      (clear ?d)
      (clear ?q)
      (top ?d ?u)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?q)
      (not (clear ?q))
      (clear ?u)
      (not (top ?d ?u))
      (top ?d ?q)
    )
  )

  (:action move_from_peg_to_disk_agent_2
    :parameters (?d - disk_f_j ?u - peg ?v - disk ?q - peg)
    :precondition (and
      (on ?d ?u)
      (clear ?d)
      (clear ?v)
      (smaller ?d ?v)
      (top ?d ?u)
      (top ?v ?q)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?v)
      (clear ?u)
      (not (clear ?v))
      (not (top ?d ?u))
      (not (top ?v ?q))
      (top ?d ?q)
    )
  )
)