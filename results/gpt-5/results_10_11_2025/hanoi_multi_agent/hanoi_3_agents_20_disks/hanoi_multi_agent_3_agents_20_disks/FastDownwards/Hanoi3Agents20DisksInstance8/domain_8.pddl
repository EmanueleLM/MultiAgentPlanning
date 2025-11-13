(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    agent support stage
    disk peg - support
  )
  (:predicates
    (on ?x - disk ?y - support)
    (clear ?y - support)
    (smaller ?x - disk ?y - disk)
    (assigned ?a - agent ?x - disk)
    (at ?s - stage)
    (succ ?s - stage ?t - stage)
  )

  (:action move-p2p
    :parameters (?ag - agent ?x - disk ?from - peg ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (assigned ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (at ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
      (not (at ?s))
      (at ?t)
    )
  )

  (:action move-p2d
    :parameters (?ag - agent ?x - disk ?from - peg ?to - disk ?s - stage ?t - stage)
    :precondition (and
      (assigned ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
      (at ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
      (not (at ?s))
      (at ?t)
    )
  )

  (:action move-d2p
    :parameters (?ag - agent ?x - disk ?from - disk ?to - peg ?s - stage ?t - stage)
    :precondition (and
      (assigned ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (at ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
      (not (at ?s))
      (at ?t)
    )
  )

  (:action move-d2d
    :parameters (?ag - agent ?x - disk ?from - disk ?to - disk ?s - stage ?t - stage)
    :precondition (and
      (assigned ?ag ?x)
      (on ?x ?from)
      (clear ?x)
      (clear ?to)
      (smaller ?x ?to)
      (at ?s)
      (succ ?s ?t)
    )
    :effect (and
      (not (on ?x ?from))
      (clear ?from)
      (on ?x ?to)
      (not (clear ?to))
      (clear ?x)
      (not (at ?s))
      (at ?t)
    )
  )
)