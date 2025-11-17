(define (domain hanoi-2agents-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    stage
    place
    disk peg - place
  )
  (:predicates
    (on ?x - disk ?s - place)
    (clear ?s - place)
    (smaller ?x - disk ?y - disk)
    (allowed1 ?x - disk)
    (allowed2 ?x - disk)
    (current ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move_agent_1_to_peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (allowed1 ?d)
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move_agent_1_to_disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (allowed1 ?d)
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move_agent_2_to_peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (allowed2 ?d)
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move_agent_2_to_disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (allowed2 ?d)
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on ?d ?to)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)