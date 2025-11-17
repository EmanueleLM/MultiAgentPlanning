(define (domain hanoi-2agent-20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    place
    peg disk - place
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?x - disk ?y - disk)
    (controls ?a - agent ?d - disk)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - place ?to - peg)
    :precondition (and
      (controls ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )

  (:action move-onto-disk
    :parameters (?ag - agent ?d - disk ?from - place ?to - disk)
    :precondition (and
      (controls ?ag ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
    )
  )
)