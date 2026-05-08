(define (domain hanoi_multi_agent)
  (:requirements :typing :negative-preconditions)
  (:types disk1 disk2 - disk peg)

  (:predicates
    (on-disk ?d - disk ?below - disk)
    (on-peg ?d - disk ?p - peg)
    (clear ?d - disk)
    (empty ?p - peg)
    (smaller ?d - disk ?d2 - disk)
  )

  (:action move_from_disk_to_empty_by_agent_1
    :parameters (?d - disk1 ?below - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (empty ?to))
      (clear ?below)
      (clear ?d)
    )
  )

  (:action move_from_disk_to_disk_by_agent_1
    :parameters (?d - disk1 ?below - disk ?dst - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?dst)
      (not (clear ?dst))
      (clear ?below)
      (clear ?d)
    )
  )

  (:action move_from_peg_to_empty_by_agent_1
    :parameters (?d - disk1 ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
      (clear ?d)
    )
  )

  (:action move_from_peg_to_disk_by_agent_1
    :parameters (?d - disk1 ?from - peg ?dst - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?dst)
      (not (clear ?dst))
      (empty ?from)
      (clear ?d)
    )
  )

  (:action move_from_disk_to_empty_by_agent_2
    :parameters (?d - disk2 ?below - disk ?to - peg)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)
      (not (empty ?to))
      (clear ?below)
      (clear ?d)
    )
  )

  (:action move_from_disk_to_disk_by_agent_2
    :parameters (?d - disk2 ?below - disk ?dst - disk)
    :precondition (and
      (on-disk ?d ?below)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-disk ?d ?dst)
      (not (clear ?dst))
      (clear ?below)
      (clear ?d)
    )
  )

  (:action move_from_peg_to_empty_by_agent_2
    :parameters (?d - disk2 ?from - peg ?to - peg)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (empty ?to))
      (empty ?from)
      (clear ?d)
    )
  )

  (:action move_from_peg_to_disk_by_agent_2
    :parameters (?d - disk2 ?from - peg ?dst - disk)
    :precondition (and
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?dst)
      (not (clear ?dst))
      (empty ?from)
      (clear ?d)
    )
  )
)