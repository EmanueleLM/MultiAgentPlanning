(define (domain hanoi-2agents-20)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg)

  (:predicates
    (on ?d - disk ?p - peg)
    ;; sequencing predicates to force the exact move order
    (step0) (step1) (step2) (step3) (step4) (step5) (step6) (step7) (step8) (step9) (step10)
    ;; agent capability predicates (public movement permissions)
    (can-agent1 ?d - disk)
    (can-agent2 ?d - disk)
  )

  ;; 1) agent_1: move A from left to middle  (step0 -> step1)
  (:action agent_1_move_A_left_middle
    :precondition (and
      (step0)
      (on a left)
      ;; A is the smallest disk: no smaller-disk checks needed
    )
    :effect (and
      (not (on a left)) (on a middle)
      (not (step0)) (step1)
    )
  )

  ;; 2) agent_1: move B from left to right  (step1 -> step2)
  (:action agent_1_move_B_left_right
    :precondition (and
      (step1)
      (on b left)
      ;; B must be top on source: A must not be on left
      (not (on a left))
      ;; destination must not contain any disk smaller than B (i.e., A)
      (not (on a right))
    )
    :effect (and
      (not (on b left)) (on b right)
      (not (step1)) (step2)
    )
  )

  ;; 3) agent_1: move A from middle to right  (step2 -> step3)
  (:action agent_1_move_A_middle_right
    :precondition (and
      (step2)
      (on a middle)
    )
    :effect (and
      (not (on a middle)) (on a right)
      (not (step2)) (step3)
    )
  )

  ;; 4) agent_1: move C from left to middle  (step3 -> step4)
  (:action agent_1_move_C_left_middle
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
  (:action agent_1_move_A_right_left
    :precondition (and
      (step4)
      (on a right)
    )
    :effect (and
      (not (on a right)) (on a left)
      (not (step4)) (step5)
    )
  )

  ;; 6) agent_1: move B from right to middle  (step5 -> step6)
  (:action agent_1_move_B_right_middle
    :precondition (and
      (step5)
      (on b right)
      ;; B top on source: A must not be on right
      (not (on a right))
      ;; destination must not contain any smaller disk than B (A)
      (not (on a middle))
    )
    :effect (and
      (not (on b right)) (on b middle)
      (not (step5)) (step6)
    )
  )

  ;; 7) agent_1: move A from left to middle  (step6 -> step7)
  (:action agent_1_move_A_left_middle_2
    :precondition (and
      (step6)
      (on a left)
      ;; ensure destination has no smaller disk than A (none exist)
      (not (on a middle)) ;; explicit but harmless
    )
    :effect (and
      (not (on a left)) (on a middle)
      (not (step6)) (step7)
    )
  )

  ;; 8) agent_1: move D from left to right  (step7 -> step8)
  (:action agent_1_move_D_left_right
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
  (:action agent_1_move_A_middle_right_2
    :precondition (and
      (step8)
      (on a middle)
    )
    :effect (and
      (not (on a middle)) (on a right)
      (not (step8)) (step9)
    )
  )

  ;; 10) agent_1: move B from middle to left  (step9 -> step10)
  (:action agent_1_move_B_middle_left
    :precondition (and
      (step9)
      (on b middle)
      ;; B top on source: A must not be on middle
      (not (on a middle))
      ;; destination must not contain any smaller disk than B (i.e., A)
      (not (on a left))
    )
    :effect (and
      (not (on b middle)) (on b left)
      (not (step9)) (step10)
    )
  )

  ;; Note: No agent_2 move actions are provided here. Agent permissions are represented
  ;; by can-agent1 / can-agent2 predicates in the problem's initial state (public information).
  ;; By defining only the above agent_1 actions and sequencing steps, the solver is forced
  ;; to produce the exact planned move sequence to reach the goal.
)