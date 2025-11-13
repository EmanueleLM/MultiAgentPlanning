(define (domain hanoi-coop-2agents-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg - support
    disk - support
    stage
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller ?x - disk ?y - disk)
    (belongs_agent1 ?d - disk)
    (belongs_agent2 ?d - disk)
    (atstage ?t - stage)
    (next ?t1 - stage ?t2 - stage)
  )

  (:action move_to_peg_agent_1
    :parameters (?d - disk ?from - support ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (belongs_agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (atstage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (atstage ?s))
      (atstage ?t)
    )
  )

  (:action move_onto_disk_agent_1
    :parameters (?d - disk ?from - support ?under - disk ?s - stage ?t - stage)
    :precondition (and
      (belongs_agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?under)
      (smaller ?d ?under)
      (atstage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?under)
      (clear ?from)
      (not (clear ?under))
      (not (atstage ?s))
      (atstage ?t)
    )
  )

  (:action move_to_peg_agent_2
    :parameters (?d - disk ?from - support ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (belongs_agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (atstage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (not (atstage ?s))
      (atstage ?t)
    )
  )

  (:action move_onto_disk_agent_2
    :parameters (?d - disk ?from - support ?under - disk ?s - stage ?t - stage)
    :precondition (and
      (belongs_agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?under)
      (smaller ?d ?under)
      (atstage ?s)
      (next ?s ?t)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?under)
      (clear ?from)
      (not (clear ?under))
      (not (atstage ?s))
      (atstage ?t)
    )
  )
)