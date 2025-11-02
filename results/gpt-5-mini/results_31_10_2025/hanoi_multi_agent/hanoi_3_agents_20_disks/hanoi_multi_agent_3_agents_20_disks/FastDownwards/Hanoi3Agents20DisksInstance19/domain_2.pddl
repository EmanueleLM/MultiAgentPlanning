(define (domain hanoi_3agents_20disks)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    ;; disk stacked directly on another disk
    (on-disk ?d - disk ?under - disk)
    ;; disk directly on a peg
    (on-peg ?d - disk ?p - peg)
    ;; a disk has nothing on top of it (is top of its stack)
    (clear-disk ?d - disk)
    ;; a peg has no disk directly on it
    (clear-peg ?p - peg)
    ;; which agent is allowed to move which disk (encoded as predicate facts in the problem)
    (allowed_agent1 ?d - disk)
    (allowed_agent2 ?d - disk)
    (allowed_agent3 ?d - disk)
    ;; size ordering: smaller ?x ?y means x is strictly smaller than y
    (smaller ?x - disk ?y - disk)
  )

  ;; Agent-scoped primitive moves only. Each action name indicates which agent performs it.
  ;; We provide only the exact primitive moves derived from the solution so the planner
  ;; cannot perform other moves that would violate the orchestrated plan.

  ;; 1) agent_1: move disk A from left to middle
  (:action agent_1_move_A_left_to_middle
    :precondition (and
      (on-disk A B)        ;; A directly on B initially
      (clear-disk A)       ;; A is top of left stack
      (clear-peg middle)   ;; destination peg middle is empty
      (allowed_agent1 A)   ;; agent_1 allowed to move A
    )
    :effect (and
      (not (on-disk A B))
      (on-peg A middle)
      (clear-disk B)        ;; B becomes top on left after A removed
      (not (clear-peg middle))
    )
  )

  ;; 2) agent_1: move disk B from left to right
  (:action agent_1_move_B_left_to_right
    :precondition (and
      (on-disk B C)         ;; B directly on C initially
      (clear-disk B)        ;; B is top of left stack after A removed
      (clear-peg right)     ;; destination peg right is empty
      (allowed_agent1 B)    ;; agent_1 allowed to move B
    )
    :effect (and
      (not (on-disk B C))
      (on-peg B right)
      (clear-disk C)        ;; C becomes top on left after B removed
      (not (clear-peg right))
    )
  )

  ;; 3) agent_1: move disk A from middle to right onto disk B
  (:action agent_1_move_A_middle_to_right_onto_B
    :precondition (and
      (on-peg A middle)     ;; A is on the middle peg
      (on-peg B right)      ;; B is on the right peg (destination top)
      (clear-disk A)
      (clear-disk B)
      (smaller A B)
      (allowed_agent1 A)
    )
    :effect (and
      (not (on-peg A middle))
      (on-disk A B)
      (clear-peg middle)        ;; middle becomes empty after A removed
      (not (clear-disk B))      ;; B is no longer clear (A on top)
      (clear-disk A)
    )
  )
)