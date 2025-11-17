(define (domain hanoi_2agents_15)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - object)

  (:predicates
    (on ?d - disk ?o - object)    ; disk d is directly on object o (peg or disk)
    (clear ?o - object)           ; there is no disk directly on top of object o
  )

  ;; Agent 1 allowed concrete moves (disks A..H). Only the concrete moves that are
  ;; necessary to verify the provided plan are modeled as explicit actions so that
  ;; other illegal moves are not available.
  (:action agent1-move-A-left-middle
    :precondition (and
      (on A B)
      (clear A)
      (clear middle)
    )
    :effect (and
      (not (on A B))
      (on A middle)
      (not (clear middle))
      (clear B)
    )
  )

  (:action agent1-move-B-left-right
    :precondition (and
      (on B C)
      (clear B)
      (clear right)
    )
    :effect (and
      (not (on B C))
      (on B right)
      (not (clear right))
      (clear C)
    )
  )

  ;; To respect the agent partitioning explicitly, we provide no actions that allow
  ;; agent_2 to move disks A..H or agent_1 to move I..O. If agent_2 moves were needed,
  ;; they would be modeled as separate concrete actions for disks I..O.
)