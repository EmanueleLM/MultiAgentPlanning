(define (domain hanoi_agents_domain)
  (:requirements :strips :typing)
  (:types disk peg agent)
  (:predicates
    (on ?d - disk ?u - disk)
    (on-peg ?d - disk ?p - peg)
    (clear ?d - disk)
    (clear-peg ?p - peg)
    (in-peg ?d - disk ?p - peg)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
  )

  (:action move-from-peg-to-empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (clear ?d)
      (clear-peg ?to))
    :effect (and
      (not (on-peg ?d ?from))
      (clear-peg ?from)
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (not (in-peg ?d ?from))
      (in-peg ?d ?to))
  )

  (:action move-from-disk-to-empty
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?u - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?u)
      (in-peg ?u ?from)
      (in-peg ?d ?from)
      (clear ?d)
      (clear-peg ?to))
    :effect (and
      (not (on ?d ?u))
      (clear ?u)
      (on-peg ?d ?to)
      (not (clear-peg ?to))
      (not (in-peg ?d ?from))
      (in-peg ?d ?to))
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?t - disk)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?t)
      (in-peg ?t ?to)
      (smaller ?d ?t))
    :effect (and
      (not (on-peg ?d ?from))
      (clear-peg ?from)
      (on ?d ?t)
      (not (clear ?t))
      (not (in-peg ?d ?from))
      (in-peg ?d ?to))
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?u - disk ?t - disk)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?u)
      (in-peg ?u ?from)
      (in-peg ?d ?from)
      (clear ?d)
      (clear ?t)
      (in-peg ?t ?to)
      (smaller ?d ?t))
    :effect (and
      (not (on ?d ?u))
      (clear ?u)
      (on ?d ?t)
      (not (clear ?t))
      (not (in-peg ?d ?from))
      (in-peg ?d ?to))
  )
)