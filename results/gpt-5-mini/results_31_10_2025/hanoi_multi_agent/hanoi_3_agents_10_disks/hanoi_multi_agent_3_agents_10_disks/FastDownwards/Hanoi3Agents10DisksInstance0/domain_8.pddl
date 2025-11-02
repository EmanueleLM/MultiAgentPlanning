(define (domain hanoi-three-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types object agent)

  (:predicates
    (on ?d - object ?p - object)
    (clear ?o - object)
    (smaller ?d1 - object ?d2 - object)
    (allowed ?a - agent ?d - object)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - object ?from - object ?to - object)
    :precondition (and
      (allowed ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )

  (:action move-to-disk
    :parameters (?ag - agent ?d - object ?from - object ?to - object)
    :precondition (and
      (allowed ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
    )
  )
)