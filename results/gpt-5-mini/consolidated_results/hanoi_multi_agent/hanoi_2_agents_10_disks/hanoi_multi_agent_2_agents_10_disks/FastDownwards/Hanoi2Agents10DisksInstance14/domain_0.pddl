(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types object disk peg)
  (:predicates
    (on ?d - disk ?x - object)        ; disk d is directly on object x (disk or peg)
    (clear ?x - object)              ; nothing on top of x (x may be a disk or a peg)
    (larger ?x - object ?y - object) ; x is larger than y (allows placing y on x)
    (agent_1_can_move ?d - disk)     ; agent 1 is allowed to move disk d
    (agent_2_can_move ?d - disk)     ; agent 2 is allowed to move disk d
  )

  ;; Agent 1 move action: moves a permitted disk from one object to another
  (:action agent_1_move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (agent_1_can_move ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )

  ;; Agent 2 move action: moves a permitted disk from one object to another
  (:action agent_2_move
    :parameters (?d - disk ?from - object ?to - object)
    :precondition (and
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (larger ?to ?d)
      (agent_2_can_move ?d)
      (not (= ?from ?to))
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (not (clear ?to))
      (clear ?from)
    )
  )
)