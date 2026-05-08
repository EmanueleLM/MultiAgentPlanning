(define (problem sokoban_problem)
  (:domain sokoban)
  
  (:objects
    player - player_type
    box1 - box_type
    goal1 - goal_type
    pos1 pos2 pos3 pos4 pos5 pos6 pos7 pos8 pos9 pos10 pos11 pos12
    pos13 pos14 pos15 pos16 pos17 pos18 pos19 pos20 pos21 pos22 pos23 - position
  )

  (:init
    (at player pos1)
    (box_at box1 pos9)
    (goal_at goal1 pos23)
    (wall_at wall1 pos3)
    (wall_at wall2 pos4)
    (wall_at wall3 pos5)
    (wall_at wall4 pos6)
    (wall_at wall5 pos7)
    (wall_at wall6 pos8)
    (adjacent pos1 pos2)
    (adjacent pos2 pos9)
    (adjacent pos9 pos10)
    (adjacent pos10 pos11)
    (adjacent pos11 pos12)
    (adjacent pos12 pos13)
    (adjacent pos13 pos14)
    (adjacent pos14 pos15)
    (adjacent pos15 pos16)
    (adjacent pos16 pos17)
    (adjacent pos17 pos18)
    (adjacent pos18 pos19)
    (adjacent pos19 pos20)
    (adjacent pos20 pos21)
    (adjacent pos21 pos22)
    (adjacent pos22 pos23)
    (clear pos2)
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
    (clear pos23)
  )

  (:goal
    (and
      (box_at box1 pos23)
      (goal_at goal1 pos23)
    )
  )
)