(define (domain hanoi_two_agent_sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    place
    peg disk - place
    agent
    step
  )

  (:predicates
    (on ?d - disk ?x - place)
    (on-peg ?d - disk ?p - peg)
    (clear ?x - place)
    (smaller ?d1 - disk ?d2 - disk)
    (can-move ?a - agent ?d - disk)
    (atstep ?s - step)
    (next ?s1 - step ?s2 - step)
    (required ?s - step ?a - agent ?d - disk ?from - peg ?to - peg)
  )

  (:action move-onto-peg
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?support - place ?s - step ?s2 - step)
    :precondition (and
      (atstep ?s)
      (next ?s ?s2)
      (required ?s ?ag ?d ?from ?to)
      (can-move ?ag ?d)
      (on-peg ?d ?from)
      (on ?d ?support)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?support)
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (atstep ?s))
      (atstep ?s2)
    )
  )

  (:action move-onto-disk
    :parameters (?ag - agent ?d - disk ?from - peg ?to - peg ?support - place ?onto - disk ?s - step ?s2 - step)
    :precondition (and
      (atstep ?s)
      (next ?s ?s2)
      (required ?s ?ag ?d ?from ?to)
      (can-move ?ag ?d)
      (on-peg ?d ?from)
      (on ?d ?support)
      (clear ?d)
      (clear ?onto)
      (on-peg ?onto ?to)
      (smaller ?d ?onto)
    )
    :effect (and
      (not (on ?d ?support))
      (on ?d ?onto)
      (not (clear ?onto))
      (clear ?support)
      (not (on-peg ?d ?from))
      (on-peg ?d ?to)
      (not (atstep ?s))
      (atstep ?s2)
    )
  )
)