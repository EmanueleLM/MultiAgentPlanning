(define (domain hanoi-2agents-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    stage
    peg
    disk
  )
  (:predicates
    (on ?x - disk ?y - disk)
    (on-peg ?x - disk ?p - peg)
    (clear ?x - disk)
    (empty ?p - peg)
    (smaller ?x - disk ?y - disk)
    (allowed1 ?x - disk)
    (allowed2 ?x - disk)
    (current ?s - stage)
    (next ?s1 - stage ?s2 - stage)
  )

  (:action move_agent_1_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (allowed1 ?d)
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on-peg ?d ?to)
      (not (empty ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move_agent_1_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
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

  (:action move_agent_1_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (allowed1 ?d)
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (empty ?from)
      (on-peg ?d ?to)
      (not (empty ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move_agent_1_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (allowed1 ?d)
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (empty ?from)
      (on ?d ?to)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move_agent_2_disk_to_peg
    :parameters (?d - disk ?from - disk ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (allowed2 ?d)
      (current ?s)
      (next ?s ?s2)
      (on ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (on-peg ?d ?to)
      (not (empty ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move_agent_2_disk_to_disk
    :parameters (?d - disk ?from - disk ?to - disk ?s - stage ?s2 - stage)
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

  (:action move_agent_2_peg_to_peg
    :parameters (?d - disk ?from - peg ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (allowed2 ?d)
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear ?d)
      (empty ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (empty ?from)
      (on-peg ?d ?to)
      (not (empty ?to))
      (not (current ?s))
      (current ?s2)
    )
  )

  (:action move_agent_2_peg_to_disk
    :parameters (?d - disk ?from - peg ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (allowed2 ?d)
      (current ?s)
      (next ?s ?s2)
      (on-peg ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on-peg ?d ?from))
      (empty ?from)
      (on ?d ?to)
      (not (clear ?to))
      (not (current ?s))
      (current ?s2)
    )
  )
)