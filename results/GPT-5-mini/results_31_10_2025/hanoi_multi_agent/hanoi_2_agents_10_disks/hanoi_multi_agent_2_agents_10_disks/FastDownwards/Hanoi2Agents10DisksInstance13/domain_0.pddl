(define (domain hanoi-multi-agent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)
  (:predicates
    (on ?d - disk ?s - (either peg disk))    ; disk ?d is directly on peg or disk ?s
    (clear ?x - (either peg disk))          ; nothing is on top of ?x (peg or disk)
    (smaller ?a - disk ?b - disk)           ; ?a is strictly smaller than ?b
    (agent1disk ?d - disk)                  ; disk belongs to agent_1
    (agent2disk ?d - disk)                  ; disk belongs to agent_2
  )

  ;; Agent 1: move a top (clear) disk that agent_1 is allowed to move onto an empty peg
  (:action agent1-move-to-empty-peg
    :parameters (?d - disk ?from - (either peg disk) ?peg - peg)
    :precondition (and
      (agent1disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
      ;; ?d remains clear (nothing placed on top of it)
    )
  )

  ;; Agent 1: move a top disk onto another (clear) disk (respecting size ordering)
  (:action agent1-move-to-disk
    :parameters (?d - disk ?from - (either peg disk) ?dst - disk)
    :precondition (and
      (agent1disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (clear ?from)
      (not (clear ?dst))
      ;; ?d remains clear
    )
  )

  ;; Agent 2: move a top (clear) disk that agent_2 is allowed to move onto an empty peg
  (:action agent2-move-to-empty-peg
    :parameters (?d - disk ?from - (either peg disk) ?peg - peg)
    :precondition (and
      (agent2disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?peg)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)
      (not (clear ?peg))
    )
  )

  ;; Agent 2: move a top disk onto another (clear) disk (respecting size ordering)
  (:action agent2-move-to-disk
    :parameters (?d - disk ?from - (either peg disk) ?dst - disk)
    :precondition (and
      (agent2disk ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?dst)
      (smaller ?d ?dst)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?dst)
      (clear ?from)
      (not (clear ?dst))
    )
  )
)