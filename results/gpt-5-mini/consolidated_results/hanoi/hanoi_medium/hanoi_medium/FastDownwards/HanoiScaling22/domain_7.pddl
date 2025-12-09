(define (domain hanoi-consistent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage place)

  (:predicates
    (on ?d - disk ?x - place)
    (clear ?x - place)
    (smaller ?d1 - disk ?d2 - disk)
    (at-stage ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action move_disk_from_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move_disk_from_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move_disk_from_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )

  (:action move_disk_from_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (at-stage ?s)
      (next ?s ?s2)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (at-stage ?s))
      (at-stage ?s2)
    )
  )
)