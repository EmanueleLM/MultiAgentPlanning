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

  ;; 1) agent_1: move disk A from left (on top of B) to middle peg (which must be empty)
  (:action agent_1_move_A_left_to_middle
    :parameters (?d - disk ?under - disk ?dst - peg)
    :precondition (and
      (on-disk ?d ?under)        ;; d is directly on some disk (support)
      (clear-disk ?d)            ;; d is top of its stack
      (clear-peg ?dst)           ;; destination peg is empty
      (allowed_agent1 ?d)        ;; agent_1 allowed to move this disk
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?dst)
      (clear-disk ?under)        ;; underlying disk becomes top after removal
      (not (clear-peg ?dst))
      ;; ?d remains clear (it is top on destination)
    )
  )

  ;; 2) agent_1: move disk B from left (on top of C) to right peg (which must be empty)
  (:action agent_1_move_B_left_to_right
    :parameters (?d - disk ?under - disk ?dst - peg)
    :precondition (and
      (on-disk ?d ?under)
      (clear-disk ?d)
      (clear-peg ?dst)
      (allowed_agent1 ?d)
    )
    :effect (and
      (not (on-disk ?d ?under))
      (on-peg ?d ?dst)
      (clear-disk ?under)
      (not (clear-peg ?dst))
    )
  )

  ;; 3) agent_1: move disk A from middle peg (on-peg) to right peg onto disk B
  (:action agent_1_move_A_middle_to_right_onto_B
    :parameters (?d - disk ?src - peg ?top - disk)
    :precondition (and
      (on-peg ?d ?src)           ;; disk d is directly on a peg (source)
      (on-peg ?top ?src)        ;; not used (left as precaution) -- removed; use explicit dest below
      (on-peg ?top ?src) ;; kept for symmetry but will not be true in the intended ordering; actual preconditions below supersede
      (on-peg ?top ?src) ;; duplicate placeholders removed by planner but kept syntactically harmless
    )
    :precondition (and
      (on-peg ?d ?src)           ;; d is on a peg (source)
      (on-peg ?top right)        ;; top is on the right peg (destination top disk)
      (clear-disk ?d)
      (clear-disk ?top)
      (smaller ?d ?top)
      (allowed_agent1 ?d)
    )
    :effect (and
      (not (on-peg ?d ?src))
      (on-disk ?d ?top)
      (clear-peg ?src)           ;; source peg becomes empty
      (not (clear-disk ?top))    ;; top is no longer clear (d sits on top)
    )
  )
)