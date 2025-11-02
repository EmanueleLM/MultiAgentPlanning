(define (domain hanoi4instance13)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)

  (:predicates
    (on-peg ?d - disk ?p - peg)
    (on-disk ?d - disk ?b - disk)
    (clear-peg ?p - peg)
    (clear-disk ?d - disk)
    (smaller ?s - disk ?b - disk)
    (support ?d - disk ?p - peg)
    (controls ?ag - agent ?p - peg)
  )

  (:action move-from-peg-to-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg)
    :precondition (and
      (controls ?ag ?from)
      (on-peg ?d ?from)
      (support ?d ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)

      (clear-peg ?from)
      (not (clear-peg ?to))

      (not (support ?d ?from))
      (support ?d ?to)
    )
  )

  (:action move-from-disk-to-peg
    :parameters (?ag - agent ?d - disk ?below - disk ?from - peg ?to - peg)
    :precondition (and
      (controls ?ag ?from)
      (on-disk ?d ?below)
      (support ?below ?from)
      (clear-disk ?d)
      (clear-peg ?to)
    )
    :effect (and
      (not (on-disk ?d ?below))
      (on-peg ?d ?to)

      (clear-disk ?below)

      (not (clear-peg ?to))

      (not (support ?d ?from))
      (support ?d ?to)
    )
  )

  (:action move-from-peg-to-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?t - disk ?tsp - peg)
    :precondition (and
      (controls ?ag ?from)
      (on-peg ?d ?from)
      (support ?d ?from)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
      (support ?t ?tsp)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (on-disk ?d ?t)

      (not (clear-disk ?t))

      (clear-peg ?from)

      (not (support ?d ?from))
      (support ?d ?tsp)
    )
  )

  (:action move-from-disk-to-disk
    :parameters (?ag - agent ?d - disk ?fromdisk - disk ?t - disk ?sp - peg ?tsp - peg)
    :precondition (and
      (controls ?ag ?sp)
      (on-disk ?d ?fromdisk)
      (support ?fromdisk ?sp)
      (clear-disk ?d)
      (clear-disk ?t)
      (smaller ?d ?t)
      (support ?t ?tsp)
    )
    :effect (and
      (not (on-disk ?d ?fromdisk))
      (on-disk ?d ?t)

      (clear-disk ?fromdisk)

      (not (clear-disk ?t))

      (not (support ?d ?sp))
      (support ?d ?tsp)
    )
  )
)