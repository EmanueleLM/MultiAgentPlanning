(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent - object)

  (:predicates
    (on ?d - disk ?x - object)           ; disk ?d is directly on object ?x (disk or peg)
    (clear ?x - object)                 ; nothing is on top of ?x (disk or peg)
    (smaller ?d1 - disk ?d2 - disk)     ; ?d1 is strictly smaller than ?d2 (stacking order)
    (can-move ?ag - agent ?d - disk)    ; agent ?ag is permitted to move disk ?d
  )

  ;; Agent 1 actions (moves only disks they are permitted to move).
  ;; 1) from peg -> peg
  (:action move-agent1-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      ;; ?d remains clear (still no disk on top)
      (clear ?d)
    )
  )

  ;; 2) from peg -> disk
  (:action move-agent1-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (can-move agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)  ;; obey Tower of Hanoi rule: moving disk must be smaller than destination disk
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; 3) from disk -> peg
  (:action move-agent1-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (can-move agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (clear ?from) ;; ensures ?d is top; redundant with (clear ?d) but explicit for clarity
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; 4) from disk -> disk
  (:action move-agent1-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (can-move agent1 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  ;; Agent 2 actions (kept distinct). No can-move facts are asserted for agent2 in the problem
  ;; instance below, so these actions will be inapplicable there (this encodes "agent_2 performs no moves").
  (:action move-agent2-peg-to-peg
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-move agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move-agent2-peg-to-disk
    :parameters (?d - disk ?from - peg ?to - disk)
    :precondition (and
      (can-move agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move-agent2-disk-to-peg
    :parameters (?d - disk ?from - disk ?to - peg)
    :precondition (and
      (can-move agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (clear ?from)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)
      (not (clear ?to))
      (clear ?d)
    )
  )

  (:action move-agent2-disk-to-disk
    :parameters (?d - disk ?from - disk ?to - disk)
    :precondition (and
      (can-move agent2 ?d)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (smaller ?d ?to)
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