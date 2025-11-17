(define (domain hanoi_multi_agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on-disk ?d - disk ?s - disk)
    (on-peg  ?d - disk ?p - peg)
    (clear-disk ?d - disk)
    (clear-peg  ?p - peg)
    (smaller ?d - disk ?e - disk)
    (can-move ?ag - agent ?d - disk)
  )

  (:action move-from-disk-to-empty-peg
    :parameters (?ag - agent ?d - disk ?from - disk ?to - peg)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-peg ?to) (can-move ?ag ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (on-peg ?d ?to)
              (clear-disk ?from)
              (not (clear-peg ?to))
              (clear-disk ?d)
            )
  )

  (:action move-from-peg-to-empty-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-peg ?to) (can-move ?ag ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (on-peg ?d ?to)
              (clear-peg ?from)
              (not (clear-peg ?to))
              (clear-disk ?d)
            )
  )

  (:action move-from-disk-onto-disk
    :parameters (?ag - agent ?d - disk ?from - disk ?t - disk)
    :precondition (and (on-disk ?d ?from) (clear-disk ?d) (clear-disk ?t) (smaller ?d ?t) (can-move ?ag ?d))
    :effect (and
              (not (on-disk ?d ?from))
              (on-disk ?d ?t)
              (clear-disk ?from)
              (not (clear-disk ?t))
              (clear-disk ?d)
            )
  )

  (:action move-from-peg-onto-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?t - disk)
    :precondition (and (on-peg ?d ?from) (clear-disk ?d) (clear-disk ?t) (smaller ?d ?t) (can-move ?ag ?d))
    :effect (and
              (not (on-peg ?d ?from))
              (on-disk ?d ?t)
              (clear-peg ?from)
              (not (clear-disk ?t))
              (clear-disk ?d)
            )
  )
)