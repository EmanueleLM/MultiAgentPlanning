(define (domain hanoi-agents)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)
    ;; sequencing predicates to force the provided ordered agent_1 moves
    (step0)
    (step1)
    (step2)
    (step3)
    (step4)
    (step5)
    (step6)
    (step7)
    (step8)
    (step9)
    (step10)
    ;; agent capability predicates (reflect permissions; problem will set only agent_1 capabilities)
    (can-agent1 ?d - disk)
    (can-agent2 ?d - disk)
  )

  ;; Agent 1: the provided, ordered move sequence is encoded as explicit actions.
  ;; Each action moves a specific disk from a specific source to a specific destination
  ;; and requires the corresponding step predicate. Preconditions explicitly ensure
  ;; Tower-of-Hanoi legality relative to the smaller disks A-D by enumerating checks
  ;; for smaller disks on source and destination (so we don't need general quantifiers).

  ;; 1) agent_1: move A from left to middle  (step0 -> step1)
  (:action agent1_move_A_left_middle
    :precondition (and
      (step0)
      (on a left)
      ;; A has no smaller disks; destination must not contain a smaller disk (none exist)
    )
    :effect (and
      (not (on a left)) (on a middle)
      (not (step0)) (step1)
    )
  )

  ;; 2) agent_1: move B from left to right  (step1 -> step2)
  (:action agent1_move_B_left_right
    :precondition (and
      (step1)
      (on b left)
      ;; B is top on source: A must not be on left
      (not (on a left))
      ;; destination must not have any disk smaller than B (i.e., A)
      (not (on a right))
    )
    :effect (and
      (not (on b left)) (on b right)
      (not (step1)) (step2)
    )
  )

  ;; 3) agent_1: move A from middle to right  (step2 -> step3)
  (:action agent1_move_A_middle_right
    :precondition (and
      (step2)
      (on a middle)
      ;; A has no smaller disks; destination must not have any disk smaller than A (none)
    )
    :effect (and
      (not (on a middle)) (on a right)
      (not (step2)) (step3)
    )
  )

  ;; 4) agent_1: move C from left to middle  (step3 -> step4)
  (:action agent1_move_C_left_middle
    :precondition (and
      (step3)
      (on c left)
      ;; C is top on source: A and B must not be on left
      (not (on a left)) (not (on b left))
      ;; destination must not contain a smaller disk than C (A or B)
      (not (on a middle)) (not (on b middle))
    )
    :effect (and
      (not (on c left)) (on c middle)
      (not (step3)) (step4)
    )
  )

  ;; 5) agent_1: move A from right to left  (step4 -> step5)
  (:action agent1_move_A_right_left
    :precondition (and
      (step4)
      (on a right)
      ;; A has no smaller disks; destination must not have any disk smaller than A (none)
    )
    :effect (and
      (not (on a right)) (on a left)
      (not (step4)) (step5)
    )
  )

  ;; 6) agent_1: move B from right to middle  (step5 -> step6)
  (:action agent1_move_B_right_middle
    :precondition (and
      (step5)
      (on b right)
      ;; B is top on source: A must not be on right
      (not (on a right))
      ;; destination must not contain a smaller disk than B (i.e., A)
      (not (on a middle))
    )
    :effect (and
      (not (on b right)) (on b middle)
      (not (step5)) (step6)
    )
  )

  ;; 7) agent_1: move A from left to middle  (step6 -> step7)
  (:action agent1_move_A_left_middle_2
    :precondition (and
      (step6)
      (on a left)
      ;; A has no smaller disks; destination must not have any disk smaller than A
      (not (on a middle)) ;; redundant but explicit
    )
    :effect (and
      (not (on a left)) (on a middle)
      (not (step6)) (step7)
    )
  )

  ;; 8) agent_1: move D from left to right  (step7 -> step8)
  (:action agent1_move_D_left_right
    :precondition (and
      (step7)
      (on d left)
      ;; D is top on source: A, B, C must not be on left
      (not (on a left)) (not (on b left)) (not (on c left))
      ;; destination must not contain any smaller disk than D (A, B, or C)
      (not (on a right)) (not (on b right)) (not (on c right))
    )
    :effect (and
      (not (on d left)) (on d right)
      (not (step7)) (step8)
    )
  )

  ;; 9) agent_1: move A from middle to right  (step8 -> step9)
  (:action agent1_move_A_middle_right_2
    :precondition (and
      (step8)
      (on a middle)
      ;; A has no smaller disks; destination must not have any disk smaller than A
      (not (on a right)) ;; explicit
    )
    :effect (and
      (not (on a middle)) (on a right)
      (not (step8)) (step9)
    )
  )

  ;; 10) agent_1: move B from middle to left  (step9 -> step10)
  (:action agent1_move_B_middle_left
    :precondition (and
      (step9)
      (on b middle)
      ;; B is top on source: A must not be on middle
      (not (on a middle))
      ;; destination must not contain any smaller disk than B (i.e., A)
      (not (on a left))
    )
    :effect (and
      (not (on b middle)) (on b left)
      (not (step9)) (step10)
    )
  )

  ;; Agent 2: generic move schema (kept distinct via name and a can-agent2 predicate).
  ;; It is present to reflect agent separation. In the provided scenario no can-agent2 facts
  ;; for the relevant disks are set, so these actions will be inert unless allowed in the problem.
  (:action agent2_move_disk
    :parameters (?d - disk ?from - peg ?to - peg)
    :precondition (and
      (can-agent2 ?d)
      (on ?d ?from)
      ;; Source: no smaller disk among {a,b,c,d} on the source (explicit checks for safety)
      ;; We conservatively require that none of the very small disks A-D are on the source
      ;; unless they are larger than ?d; since this action is generic, correctness depends on problem facts.
      ;; We keep these checks minimal to avoid unintended illegal placements (problem will usually not allow agent2).
      (not (and (can-agent1 a) (on a ?from)))
      (not (and (can-agent1 b) (on b ?from)))
      (not (and (can-agent1 c) (on c ?from)))
      (not (and (can-agent1 d) (on d ?from)))
      ;; Destination cannot have any of the very small disks on it (so we don't place onto a smaller disk)
      (not (and (can-agent1 a) (on a ?to)))
      (not (and (can-agent1 b) (on b ?to)))
      (not (and (can-agent1 c) (on c ?to)))
      (not (and (can-agent1 d) (on d ?to)))
    )
    :effect (and
      (not (on ?d ?from)) (on ?d ?to)
    )
  )

)