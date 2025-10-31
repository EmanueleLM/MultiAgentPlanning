(define (domain hanoi-two-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?d - disk ?p - (either disk peg))
    (clear ?x - (either disk peg)) ; true if nothing is directly on ?x (for pegs: peg empty)
    (agent1 ?d - disk)
    (agent2 ?d - disk)
    (larger ?big - disk ?small - disk)
  )

  ;; Agent 1 actions: may move disks A-E
  (:action move-agent1-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?peg - peg)
    :precondition (and
      (agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)        ; the support (disk or peg) becomes clear (no disk directly on it)
      (not (clear ?peg))   ; peg now has a disk on it (not empty)
      (clear ?d)           ; moved disk has nothing on it
    )
  )

  (:action move-agent1-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)      ; cannot place larger disk on smaller one
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; Agent 2 actions: may move disks F-J
  (:action move-agent2-to-peg
    :parameters (?d - disk ?from - (either disk peg) ?peg - peg)
    :precondition (and
      (agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
      (clear ?d)
    )
  )

  (:action move-agent2-to-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - disk)
    :precondition (and
      (agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )
)