(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on-disk ?d - disk ?s - disk)       ; disk ?d directly on disk ?s
    (on-peg ?d - disk ?p - peg)        ; disk ?d directly on peg ?p
    (clear ?d - disk)                  ; no disk on top of ?d
    (peg-empty ?p - peg)               ; no disk directly on peg ?p
    (agent1-disk ?d - disk)            ; disk allowed to be moved by agent_1
    (agent2-disk ?d - disk)            ; disk allowed to be moved by agent_2
    (smaller ?d1 - disk ?d2 - disk)    ; ?d1 is smaller than ?d2
  )

  ;; Agent 1 actions (can move disks A..H -> a..h)
  (:action move-agent_1-from-disk-to-empty
    :parameters (?d - disk ?s - disk ?dest - peg)
    :precondition (and
      (agent1-disk ?d)
      (on-disk ?d ?s)
      (clear ?d)
      (peg-empty ?dest)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-peg ?d ?dest)
      (clear ?d)
      (clear ?s)
      (not (peg-empty ?dest))
    )
  )

  (:action move-agent_1-from-disk-to-disk
    :parameters (?d - disk ?s - disk ?y - disk ?dest - peg)
    :precondition (and
      (agent1-disk ?d)
      (on-disk ?d ?s)
      (clear ?d)
      (clear ?y)
      (on-peg ?y ?dest)
      (smaller ?d ?y)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-disk ?d ?y)
      (clear ?d)
      (clear ?s)
      (not (clear ?y))
    )
  )

  (:action move-agent_1-from-peg-to-empty
    :parameters (?d - disk ?src - peg ?dest - peg)
    :precondition (and
      (agent1-disk ?d)
      (on-peg ?d ?src)
      (clear ?d)
      (peg-empty ?dest)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-peg ?d ?dest)
      (clear ?d)
      (peg-empty ?src)
      (not (peg-empty ?dest))
    )
  )

  (:action move-agent_1-from-peg-to-disk
    :parameters (?d - disk ?src - peg ?y - disk ?dest - peg)
    :precondition (and
      (agent1-disk ?d)
      (on-peg ?d ?src)
      (clear ?d)
      (clear ?y)
      (on-peg ?y ?dest)
      (smaller ?d ?y)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-disk ?d ?y)
      (clear ?d)
      (peg-empty ?src)
      (not (clear ?y))
    )
  )

  ;; Agent 2 actions (can move disks I..O -> i..o)
  (:action move-agent_2-from-disk-to-empty
    :parameters (?d - disk ?s - disk ?dest - peg)
    :precondition (and
      (agent2-disk ?d)
      (on-disk ?d ?s)
      (clear ?d)
      (peg-empty ?dest)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-peg ?d ?dest)
      (clear ?d)
      (clear ?s)
      (not (peg-empty ?dest))
    )
  )

  (:action move-agent_2-from-disk-to-disk
    :parameters (?d - disk ?s - disk ?y - disk ?dest - peg)
    :precondition (and
      (agent2-disk ?d)
      (on-disk ?d ?s)
      (clear ?d)
      (clear ?y)
      (on-peg ?y ?dest)
      (smaller ?d ?y)
    )
    :effect (and
      (not (on-disk ?d ?s))
      (on-disk ?d ?y)
      (clear ?d)
      (clear ?s)
      (not (clear ?y))
    )
  )

  (:action move-agent_2-from-peg-to-empty
    :parameters (?d - disk ?src - peg ?dest - peg)
    :precondition (and
      (agent2-disk ?d)
      (on-peg ?d ?src)
      (clear ?d)
      (peg-empty ?dest)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-peg ?d ?dest)
      (clear ?d)
      (peg-empty ?src)
      (not (peg-empty ?dest))
    )
  )

  (:action move-agent_2-from-peg-to-disk
    :parameters (?d - disk ?src - peg ?y - disk ?dest - peg)
    :precondition (and
      (agent2-disk ?d)
      (on-peg ?d ?src)
      (clear ?d)
      (clear ?y)
      (on-peg ?y ?dest)
      (smaller ?d ?y)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-disk ?d ?y)
      (clear ?d)
      (peg-empty ?src)
      (not (clear ?y))
    )
  )

)