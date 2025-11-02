(define (domain hanoi2agents_hardcoded)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent step)

  (:predicates
    ;; disk is directly on either a peg or another disk
    (on ?d - disk ?s - (either disk peg))
    ;; size ordering: smaller ?d1 ?d2 means ?d1 is strictly smaller than ?d2
    (smaller ?d1 - disk ?d2 - disk)
    ;; which step of the hardcoded sequence we are at (only one true at a time)
    (at-step ?k - step)
  )

  ;; Step 0 -> 1: agent_1: move A left->middle
  (:action agent_1_move_01_A_left_middle
    :parameters ()
    :precondition (and
      (at-step step0)
      (on A left)
      ;; A must be top (no disk on A)
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      ;; middle peg must be empty
      (not (on A middle)) (not (on B middle)) (not (on C middle)) (not (on D middle)) (not (on E middle))
      (not (on F middle)) (not (on G middle)) (not (on H middle)) (not (on I middle)) (not (on J middle))
    )
    :effect (and
      (not (on A left))
      (on A middle)
      (not (at-step step0))
      (at-step step1)
    )
  )

  ;; Step 1 -> 2: agent_1: move B left->right
  (:action agent_1_move_02_B_left_right
    :parameters ()
    :precondition (and
      (at-step step1)
      (on B left)
      ;; B must be top
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
      ;; right peg must be empty
      (not (on A right)) (not (on B right)) (not (on C right)) (not (on D right)) (not (on E right))
      (not (on F right)) (not (on G right)) (not (on H right)) (not (on I right)) (not (on J right))
    )
    :effect (and
      (not (on B left))
      (on B right)
      (not (at-step step1))
      (at-step step2)
    )
  )

  ;; Step 2 -> 3: agent_1: move A middle->right (onto B)
  (:action agent_1_move_03_A_middle_right
    :parameters ()
    :precondition (and
      (at-step step2)
      (on A middle)
      ;; A must be top
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      ;; target is disk B and B must be top
      (on B right)
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
      ;; size constraint: A smaller than B
      (smaller A B)
    )
    :effect (and
      (not (on A middle))
      (on A right)
      (not (at-step step2))
      (at-step step3)
    )
  )

  ;; Step 3 -> 4: agent_1: move C left->middle
  (:action agent_1_move_04_C_left_middle
    :parameters ()
    :precondition (and
      (at-step step3)
      (on C left)
      ;; C must be top
      (not (on A C)) (not (on B C)) (not (on C C)) (not (on D C)) (not (on E C))
      (not (on F C)) (not (on G C)) (not (on H C)) (not (on I C)) (not (on J C))
      ;; middle peg must be empty (at this moment)
      (not (on A middle)) (not (on B middle)) (not (on C middle)) (not (on D middle)) (not (on E middle))
      (not (on F middle)) (not (on G middle)) (not (on H middle)) (not (on I middle)) (not (on J middle))
    )
    :effect (and
      (not (on C left))
      (on C middle)
      (not (at-step step3))
      (at-step step4)
    )
  )

  ;; Step 4 -> 5: agent_1: move A right->left
  (:action agent_1_move_05_A_right_left
    :parameters ()
    :precondition (and
      (at-step step4)
      (on A right)
      ;; A must be top
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      ;; left top must be D (i.e., D must be top on left)
      (on D left)
      (not (on A D)) (not (on B D)) (not (on C D)) (not (on D D)) (not (on E D))
      (not (on F D)) (not (on G D)) (not (on H D)) (not (on I D)) (not (on J D))
      ;; size constraint A smaller than D
      (smaller A D)
    )
    :effect (and
      (not (on A right))
      (on A left)
      (not (at-step step4))
      (at-step step5)
    )
  )

  ;; Step 5 -> 6: agent_1: move B right->middle (onto C)
  (:action agent_1_move_06_B_right_middle
    :parameters ()
    :precondition (and
      (at-step step5)
      (on B right)
      ;; B must be top
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
      ;; target is disk C and C must be top
      (on C middle)
      (not (on A C)) (not (on B C)) (not (on C C)) (not (on D C)) (not (on E C))
      (not (on F C)) (not (on G C)) (not (on H C)) (not (on I C)) (not (on J C))
      ;; size constraint: B smaller than C
      (smaller B C)
    )
    :effect (and
      (not (on B right))
      (on B middle)
      (not (at-step step5))
      (at-step step6)
    )
  )

  ;; Step 6 -> 7: agent_1: move A left->middle (onto B)
  (:action agent_1_move_07_A_left_middle
    :parameters ()
    :precondition (and
      (at-step step6)
      (on A left)
      ;; A must be top
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      ;; target is disk B and B must be top
      (on B middle)
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
      ;; size constraint: A smaller than B
      (smaller A B)
    )
    :effect (and
      (not (on A left))
      (on A middle)
      (not (at-step step6))
      (at-step step7)
    )
  )

  ;; Step 7 -> 8: agent_1: move D left->right
  (:action agent_1_move_08_D_left_right
    :parameters ()
    :precondition (and
      (at-step step7)
      (on D left)
      ;; D must be top
      (not (on A D)) (not (on B D)) (not (on C D)) (not (on D D)) (not (on E D))
      (not (on F D)) (not (on G D)) (not (on H D)) (not (on I D)) (not (on J D))
      ;; right peg must be empty at this moment
      (not (on A right)) (not (on B right)) (not (on C right)) (not (on D right)) (not (on E right))
      (not (on F right)) (not (on G right)) (not (on H right)) (not (on I right)) (not (on J right))
    )
    :effect (and
      (not (on D left))
      (on D right)
      (not (at-step step7))
      (at-step step8)
    )
  )

  ;; Step 8 -> 9: agent_1: move A middle->right (onto D)
  (:action agent_1_move_09_A_middle_right
    :parameters ()
    :precondition (and
      (at-step step8)
      (on A middle)
      ;; A must be top
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      ;; target is disk D and D must be top
      (on D right)
      (not (on A D)) (not (on B D)) (not (on C D)) (not (on D D)) (not (on E D))
      (not (on F D)) (not (on G D)) (not (on H D)) (not (on I D)) (not (on J D))
      ;; size constraint
      (smaller A D)
    )
    :effect (and
      (not (on A middle))
      (on A right)
      (not (at-step step8))
      (at-step step9)
    )
  )

  ;; Step 9 -> 10: agent_1: move B middle->left (onto E)
  (:action agent_1_move_10_B_middle_left
    :parameters ()
    :precondition (and
      (at-step step9)
      (on B middle)
      ;; B must be top
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
      ;; left top is E and must be top
      (on E left)
      (not (on A E)) (not (on B E)) (not (on C E)) (not (on D E)) (not (on E E))
      (not (on F E)) (not (on G E)) (not (on H E)) (not (on I E)) (not (on J E))
      ;; size constraint
      (smaller B E)
    )
    :effect (and
      (not (on B middle))
      (on B left)
      (not (at-step step9))
      (at-step step10)
    )
  )

  ;; Step 10 -> 11: agent_1: move A right->left (onto B)
  (:action agent_1_move_11_A_right_left
    :parameters ()
    :precondition (and
      (at-step step10)
      (on A right)
      ;; A must be top
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      ;; left top is B and B must be top
      (on B left)
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
      ;; size constraint
      (smaller A B)
    )
    :effect (and
      (not (on A right))
      (on A left)
      (not (at-step step10))
      (at-step step11)
    )
  )

  ;; Step 11 -> 12: agent_1: move C middle->right (onto D)
  (:action agent_1_move_12_C_middle_right
    :parameters ()
    :precondition (and
      (at-step step11)
      (on C middle)
      ;; C must be top
      (not (on A C)) (not (on B C)) (not (on C C)) (not (on D C)) (not (on E C))
      (not (on F C)) (not (on G C)) (not (on H C)) (not (on I C)) (not (on J C))
      ;; target is disk D and must be top
      (on D right)
      (not (on A D)) (not (on B D)) (not (on C D)) (not (on D D)) (not (on E D))
      (not (on F D)) (not (on G D)) (not (on H D)) (not (on I D)) (not (on J D))
      ;; size constraint
      (smaller C D)
    )
    :effect (and
      (not (on C middle))
      (on C right)
      (not (at-step step11))
      (at-step step12)
    )
  )

  ;; Step 12 -> 13: agent_1: move A left->middle
  (:action agent_1_move_13_A_left_middle
    :parameters ()
    :precondition (and
      (at-step step12)
      (on A left)
      ;; A must be top
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      ;; middle must be empty (so final A is alone on middle)
      (not (on A middle)) (not (on B middle)) (not (on C middle)) (not (on D middle)) (not (on E middle))
      (not (on F middle)) (not (on G middle)) (not (on H middle)) (not (on I middle)) (not (on J middle))
    )
    :effect (and
      (not (on A left))
      (on A middle)
      (not (at-step step12))
      (at-step step13)
    )
  )
)