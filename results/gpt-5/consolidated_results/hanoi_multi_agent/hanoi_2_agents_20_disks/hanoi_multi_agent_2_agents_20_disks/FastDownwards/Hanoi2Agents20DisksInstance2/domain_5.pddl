(define (domain hanoi-2agent-20-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support
    peg disk - support
    agent step
  )
  (:predicates
    (on ?d - disk ?s - support)
    (clear ?s - support)
    (smaller-than ?x - disk ?y - disk)
    (can-move ?a - agent ?d - disk)
    (at-step ?s - step)
    (next ?s1 - step ?s2 - step)
    (scheduled-agent ?s - step ?a - agent)
    (scheduled-disk ?s - step ?d - disk)
    (scheduled-from ?s - step ?f - support)
    (scheduled-to ?s - step ?t - support)
  )

  (:action execute_scheduled_to_peg
    :parameters (?ag - agent ?d - disk ?from - support ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (scheduled-agent ?s ?ag)
      (scheduled-disk ?s ?d)
      (scheduled-from ?s ?from)
      (scheduled-to ?s ?to)
      (can-move ?ag ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?to))
      (on ?d ?to)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )

  (:action execute_scheduled_to_disk
    :parameters (?ag - agent ?d - disk ?from - support ?to - disk ?s - step ?s2 - step)
    :precondition (and
      (at-step ?s)
      (next ?s ?s2)
      (scheduled-agent ?s ?ag)
      (scheduled-disk ?s ?d)
      (scheduled-from ?s ?from)
      (scheduled-to ?s ?to)
      (can-move ?ag ?d)
      (clear ?d)
      (on ?d ?from)
      (clear ?to)
      (smaller-than ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (clear ?from)
      (not (clear ?to))
      (on ?d ?to)
      (not (at-step ?s))
      (at-step ?s2)
    )
  )
)