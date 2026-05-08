(define (domain hanoi2agents_hardcoded)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place agent step)

  (:constants
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 orchestrator - agent
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 - step
  )

  (:predicates
    (on ?d - disk ?s - place)
    (smaller ?d1 - disk ?d2 - disk)
    (at-step ?k - step)
  )

  (:action agent_1_move_01_A_left_middle
    :parameters ()
    :precondition (and
      (at-step step0)
      (on A left)
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
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

  (:action agent_1_move_02_B_left_right
    :parameters ()
    :precondition (and
      (at-step step1)
      (on B left)
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
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

  (:action agent_1_move_03_A_middle_right
    :parameters ()
    :precondition (and
      (at-step step2)
      (on A middle)
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      (on B right)
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
      (smaller A B)
    )
    :effect (and
      (not (on A middle))
      (on A right)
      (not (at-step step2))
      (at-step step3)
    )
  )

  (:action agent_1_move_04_C_left_middle
    :parameters ()
    :precondition (and
      (at-step step3)
      (on C left)
      (not (on A C)) (not (on B C)) (not (on C C)) (not (on D C)) (not (on E C))
      (not (on F C)) (not (on G C)) (not (on H C)) (not (on I C)) (not (on J C))
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

  (:action agent_1_move_05_A_right_left
    :parameters ()
    :precondition (and
      (at-step step4)
      (on A right)
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      (on D left)
      (not (on A D)) (not (on B D)) (not (on C D)) (not (on D D)) (not (on E D))
      (not (on F D)) (not (on G D)) (not (on H D)) (not (on I D)) (not (on J D))
      (smaller A D)
    )
    :effect (and
      (not (on A right))
      (on A left)
      (not (at-step step4))
      (at-step step5)
    )
  )

  (:action agent_1_move_06_B_right_middle
    :parameters ()
    :precondition (and
      (at-step step5)
      (on B right)
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
      (on C middle)
      (not (on A C)) (not (on B C)) (not (on C C)) (not (on D C)) (not (on E C))
      (not (on F C)) (not (on G C)) (not (on H C)) (not (on I C)) (not (on J C))
      (smaller B C)
    )
    :effect (and
      (not (on B right))
      (on B middle)
      (not (at-step step5))
      (at-step step6)
    )
  )

  (:action agent_1_move_07_A_left_middle
    :parameters ()
    :precondition (and
      (at-step step6)
      (on A left)
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      (on B middle)
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
      (smaller A B)
    )
    :effect (and
      (not (on A left))
      (on A middle)
      (not (at-step step6))
      (at-step step7)
    )
  )

  (:action agent_1_move_08_D_left_right
    :parameters ()
    :precondition (and
      (at-step step7)
      (on D left)
      (not (on A D)) (not (on B D)) (not (on C D)) (not (on D D)) (not (on E D))
      (not (on F D)) (not (on G D)) (not (on H D)) (not (on I D)) (not (on J D))
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

  (:action agent_1_move_09_A_middle_right
    :parameters ()
    :precondition (and
      (at-step step8)
      (on A middle)
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      (on D right)
      (not (on A D)) (not (on B D)) (not (on C D)) (not (on D D)) (not (on E D))
      (not (on F D)) (not (on G D)) (not (on H D)) (not (on I D)) (not (on J D))
      (smaller A D)
    )
    :effect (and
      (not (on A middle))
      (on A right)
      (not (at-step step8))
      (at-step step9)
    )
  )

  (:action agent_1_move_10_B_middle_left
    :parameters ()
    :precondition (and
      (at-step step9)
      (on B middle)
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
      (on E left)
      (not (on A E)) (not (on B E)) (not (on C E)) (not (on D E)) (not (on E E))
      (not (on F E)) (not (on G E)) (not (on H E)) (not (on I E)) (not (on J E))
      (smaller B E)
    )
    :effect (and
      (not (on B middle))
      (on B left)
      (not (at-step step9))
      (at-step step10)
    )
  )

  (:action agent_1_move_11_A_right_left
    :parameters ()
    :precondition (and
      (at-step step10)
      (on A right)
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
      (on B left)
      (not (on A B)) (not (on B B)) (not (on C B)) (not (on D B)) (not (on E B))
      (not (on F B)) (not (on G B)) (not (on H B)) (not (on I B)) (not (on J B))
      (smaller A B)
    )
    :effect (and
      (not (on A right))
      (on A left)
      (not (at-step step10))
      (at-step step11)
    )
  )

  (:action agent_1_move_12_C_middle_right
    :parameters ()
    :precondition (and
      (at-step step11)
      (on C middle)
      (not (on A C)) (not (on B C)) (not (on C C)) (not (on D C)) (not (on E C))
      (not (on F C)) (not (on G C)) (not (on H C)) (not (on I C)) (not (on J C))
      (on D right)
      (not (on A D)) (not (on B D)) (not (on C D)) (not (on D D)) (not (on E D))
      (not (on F D)) (not (on G D)) (not (on H D)) (not (on I D)) (not (on J D))
      (smaller C D)
    )
    :effect (and
      (not (on C middle))
      (on C right)
      (not (at-step step11))
      (at-step step12)
    )
  )

  (:action agent_1_move_13_A_left_middle
    :parameters ()
    :precondition (and
      (at-step step12)
      (on A left)
      (not (on A A)) (not (on B A)) (not (on C A)) (not (on D A)) (not (on E A))
      (not (on F A)) (not (on G A)) (not (on H A)) (not (on I A)) (not (on J A))
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