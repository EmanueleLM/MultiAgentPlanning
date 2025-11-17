(define (domain hanoi3agents10disks-legal)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    support
    peg disk - support
  )

  (:predicates
    (on ?d - disk ?s - support)
    (top ?p - peg ?d - disk)
    (empty ?p - peg)
    (clear ?d - disk)
    (smaller ?d1 - disk ?d2 - disk)
    (permission ?a - agent ?d - disk)
  )

  (:action move-from-disk-to-empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?u - disk)
    :precondition (and
      (permission ?a ?d)
      (top ?from ?d)
      (on ?d ?u)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?u))
      (on ?d ?to)
      (not (top ?from ?d))
      (top ?from ?u)
      (clear ?u)
      (top ?to ?d)
      (not (empty ?to))
    )
  )

  (:action move-from-peg-to-empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (permission ?a ?d)
      (top ?from ?d)
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (top ?from ?d))
      (empty ?from)
      (top ?to ?d)
      (not (empty ?to))
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?u_from - disk ?u_to - disk)
    :precondition (and
      (permission ?a ?d)
      (top ?from ?d)
      (on ?d ?u_from)
      (clear ?d)
      (top ?to ?u_to)
      (smaller ?d ?u_to)
    )
    :effect (and
      (not (on ?d ?u_from))
      (on ?d ?u_to)
      (not (top ?from ?d))
      (top ?from ?u_from)
      (not (top ?to ?u_to))
      (top ?to ?d)
      (clear ?u_from)
      (not (clear ?u_to))
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?u_to - disk)
    :precondition (and
      (permission ?a ?d)
      (top ?from ?d)
      (on ?d ?from)
      (clear ?d)
      (top ?to ?u_to)
      (smaller ?d ?u_to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?u_to)
      (not (top ?from ?d))
      (empty ?from)
      (not (top ?to ?u_to))
      (top ?to ?d)
      (not (clear ?u_to))
    )
  )
)