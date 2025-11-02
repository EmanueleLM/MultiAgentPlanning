(define (domain hanoi-2agents-15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (above ?upper - disk ?lower - disk)        ; directly above relationship: upper is directly on lower
    (top ?p - peg ?d - disk)                   ; d is the current top disk of peg p (may be a base disk)
    (can_move_agent1 ?d - disk)                ; disk may be moved by agent_1
    (can_move_agent2 ?d - disk)                ; disk may be moved by agent_2
    (larger ?d1 - disk ?d2 - disk)             ; d1 is strictly larger than d2
  )

  ;; Agent 1 moves a disk that they are allowed to move.
  ;; Parameters:
  ;; ?d - disk being moved (must be top of source peg)
  ;; ?p - source peg
  ;; ?q - destination peg
  ;; ?x - the disk directly below ?d on source peg (becomes new top of source after move)
  ;; ?t - current top disk of destination peg (must be larger than ?d; could be a base disk)
  (:action move_agent1
    :parameters (?d - disk ?p - peg ?q - peg ?x - disk ?t - disk)
    :precondition (and
      (top ?p ?d)
      (above ?d ?x)
      (top ?q ?t)
      (larger ?t ?d)
      (can_move_agent1 ?d)
    )
    :effect (and
      (not (top ?p ?d))
      (not (top ?q ?t))
      (top ?p ?x)
      (top ?q ?d)
      (not (above ?d ?x))
      (above ?d ?t)
    )
  )

  ;; Agent 2 moves a disk that they are allowed to move.
  (:action move_agent2
    :parameters (?d - disk ?p - peg ?q - peg ?x - disk ?t - disk)
    :precondition (and
      (top ?p ?d)
      (above ?d ?x)
      (top ?q ?t)
      (larger ?t ?d)
      (can_move_agent2 ?d)
    )
    :effect (and
      (not (top ?p ?d))
      (not (top ?q ?t))
      (top ?p ?x)
      (top ?q ?d)
      (not (above ?d ?x))
      (above ?d ?t)
    )
  )
)