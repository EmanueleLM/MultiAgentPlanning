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
    (on ?x - disk ?y - support)
    (clear ?x - support)
    (top ?d - disk ?p - peg)
    (smaller ?x - disk ?y - disk)
    (peg ?p - peg)
    (disk ?d - disk)
    (placeable ?d - disk ?s - support)
  )

  (:action move_agent_1
    :parameters (?d - disk_a_e ?u - support ?v - support)
    :precondition (and
      (disk ?d)
      (on ?d ?u)
      (clear ?d)
      (clear ?v)
      (placeable ?d ?v)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?v)
      (clear ?u)
      (not (clear ?v))
    )
  )

  (:action move_agent_2
    :parameters (?d - disk_f_j ?u - support ?v - support)
    :precondition (and
      (disk ?d)
      (on ?d ?u)
      (clear ?d)
      (clear ?v)
      (placeable ?d ?v)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?v)
      (clear ?u)
      (not (clear ?v))
    )
  )
)