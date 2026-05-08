(define (problem sokoban_problem)
  (:domain sokoban)
  
  (:objects
    player - player_type
    box1 - box_type
    ; Define positions only for accessible spaces (not walls)
    pos_start pos_box pos_goal pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8 pos9 pos10 pos11 pos12 pos13 pos14 pos15 pos16 pos17 pos18 pos19 pos20 pos21 pos22 - position
  )

  (:init
    ; Initial positions
    (at player pos_start)
    (box_at box1 pos_box)
    (goal pos_goal)

    ; Accessible path positions
    (adjacent pos_start pos1)
    (adjacent pos1 pos2) (adjacent pos2 pos3) (adjacent pos3 pos4)
    (adjacent pos4 pos5) (adjacent pos5 pos6) (adjacent pos6 pos7)
    (adjacent pos7 pos8) (adjacent pos8 pos9) (adjacent pos9 pos10)
    (adjacent pos10 pos11) (adjacent pos11 pos12) (adjacent pos12 pos13)
    (adjacent pos13 pos14) (adjacent pos14 pos15) (adjacent pos15 pos16)
    (adjacent pos16 pos17) (adjacent pos17 pos18) (adjacent pos18 pos19)
    (adjacent pos19 pos20) (adjacent pos20 pos21) (adjacent pos21 pos22)
    (adjacent pos22 pos_goal)

    ; Initially clear positions
    (clear pos1)
    (clear pos2)
    (clear pos3)
    (clear pos4)
    (clear pos5)
    (clear pos6)
    (clear pos7)
    (clear pos8)
    (clear pos9)
    (clear pos10)
    (clear pos11)
    (clear pos12)
    (clear pos13)
    (clear pos14)
    (clear pos15)
    (clear pos16)
    (clear pos17)
    (clear pos18)
    (clear pos19)
    (clear pos20)
    (clear pos21)
    (clear pos22)
    (clear pos_goal)
  )

  (:goal
    (box_at box1 pos_goal)
  )
)