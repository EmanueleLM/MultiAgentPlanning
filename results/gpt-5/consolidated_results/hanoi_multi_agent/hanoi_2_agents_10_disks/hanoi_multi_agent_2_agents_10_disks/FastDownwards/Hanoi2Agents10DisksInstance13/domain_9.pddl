(define (domain hanoi_2agents_10disks_staged_strict_v3)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent
    place
    peg disk - place
    stage
  )
  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?d1 - disk ?d2 - disk)
    (may-move ?a - agent ?d - disk)
    (at ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action move-to-peg
    :parameters (?ag - agent ?d - disk ?from - place ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (may-move ?ag ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (at ?s)
      (next ?s ?t)
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

  (:action move-to-disk
    :parameters (?ag - agent ?d1 - disk ?from - place ?d2 - disk ?s - stage ?t - stage)
    :precondition (and
      (may-move ?ag ?d1)
      (clear ?d1)
      (on ?d1 ?from)
      (clear ?d2)
      (smaller ?d1 ?d2)
      (at ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?d1 ?from))
      (on ?d1 ?d2)
      (clear ?from)
      (not (clear ?d2))
      (not (at ?s))
      (at ?t)
    )
  )
)