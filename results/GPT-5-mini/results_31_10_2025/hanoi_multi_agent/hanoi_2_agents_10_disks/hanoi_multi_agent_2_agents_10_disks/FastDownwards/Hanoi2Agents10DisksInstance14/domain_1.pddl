(define (domain hanoi-multiagent)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?x - object)        ; disk d is directly on object x (disk or peg)
    (clear ?x - object)              ; nothing on top of x (x may be a disk or a peg)
    (larger ?x - object ?y - object) ; x is larger than y (allows placing y on x)
    (agent_1_can_move ?d - disk)     ; agent 1 is allowed to move disk d
    (agent_2_can_move ?d - disk)     ; agent 2 is allowed to move disk d
  )

  ;; Agent 1: allowed to move disks A..E (enforced in problem via agent_1_can_move facts)
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

  ;; Agent 2: allowed to move disks F..J (enforced in problem via agent_2_can_move facts)
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