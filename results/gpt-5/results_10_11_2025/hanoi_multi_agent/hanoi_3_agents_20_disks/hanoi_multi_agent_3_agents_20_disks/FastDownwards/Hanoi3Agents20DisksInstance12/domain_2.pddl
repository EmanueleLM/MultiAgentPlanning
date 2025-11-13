(define (domain hanoi3agents20_staged)
  (:requirements :strips :typing)
  (:types
    agent disk peg stage
  )
  (:predicates
    (on ?d - disk ?x - disk)
    (on-peg ?d - disk ?p - peg)
    (clear ?d - disk)
    (empty ?p - peg)
    (smaller ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
    (at ?s - stage)
    (succ ?s - stage ?t - stage)
  )

  (:action move-from-disk-to-empty-peg
    :parameters (?a - agent ?d - disk ?from - disk ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
      (at ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on-peg ?d ?to)
      (clear ?from)
      (not (empty ?to))
      (not (at ?s))
      (at ?t)
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?a - agent ?d - disk ?from - disk ?to - disk ?s - stage ?t - stage)
    :precondition (and
      (can-move ?a ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at ?s))
      (at ?t)
    )
  )

  (:action move-from-peg-to-empty-peg
    :parameters (?a - agent ?d - disk ?from - peg ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
      (at ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (empty ?from)
      (not (empty ?to))
      (not (at ?s))
      (at ?t)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?a - agent ?d - disk ?from - peg ?to - disk ?s - stage ?t - stage)
    :precondition (and
      (can-move ?a ?d)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on ?d ?to)
      (empty ?from)
      (not (clear ?to))
      (not (at ?s))
      (at ?t)
    )
  )
)