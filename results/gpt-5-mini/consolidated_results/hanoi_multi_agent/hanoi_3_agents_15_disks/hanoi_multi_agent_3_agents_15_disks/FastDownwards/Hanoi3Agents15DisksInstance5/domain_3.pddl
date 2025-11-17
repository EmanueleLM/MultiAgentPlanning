(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place)

  (:predicates
    (on ?d - disk ?p - place)
    (clear ?p - place)
    (smaller ?x - disk ?y - disk)
    (agent1-disk ?d - disk)
    (agent2-disk ?d - disk)
    (agent3-disk ?d - disk)
  )

  ;; ----- agent 1 actions -----
  (:action move-agent1-to-peg
    :parameters (?d - disk ?below - place ?to - peg)
    :precondition (and
      (agent1-disk ?d)
      (on ?d ?below)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?below)
    )
  )

  (:action move-agent1-to-disk
    :parameters (?d - disk ?below - place ?to - disk)
    :precondition (and
      (agent1-disk ?d)
      (on ?d ?below)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?below)
    )
  )

  ;; ----- agent 2 actions -----
  (:action move-agent2-to-peg
    :parameters (?d - disk ?below - place ?to - peg)
    :precondition (and
      (agent2-disk ?d)
      (on ?d ?below)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?below)
    )
  )

  (:action move-agent2-to-disk
    :parameters (?d - disk ?below - place ?to - disk)
    :precondition (and
      (agent2-disk ?d)
      (on ?d ?below)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?below)
    )
  )

  ;; ----- agent 3 actions -----
  (:action move-agent3-to-peg
    :parameters (?d - disk ?below - place ?to - peg)
    :precondition (and
      (agent3-disk ?d)
      (on ?d ?below)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?below)
    )
  )

  (:action move-agent3-to-disk
    :parameters (?d - disk ?below - place ?to - disk)
    :precondition (and
      (agent3-disk ?d)
      (on ?d ?below)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?below))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?below)
    )
  )
)