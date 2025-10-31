(define (problem hanoi_2agent_10_instance26)
  (:domain hanoi_two_agent_10)

  (:objects
    a b c d e f g h i j
    base_left base_middle base_right
    left middle right
    agent1 agent2 orchestrator
  )

  (:init
    (at a left) (at b left) (at c left) (at d left) (at e left)
    (at f left) (at g left) (at h left) (at i left) (at j left)

    (at base_left left) (at base_middle middle) (at base_right right)

    (above a b) (above b c) (above c d) (above d e) (above e f)
    (above f g) (above g h) (above h i) (above i j) (above j base_left)

    (top left a)
    (top middle base_middle)
    (top right base_right)

    (clear a) (clear base_middle) (clear base_right)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    (smaller a base_left) (smaller a base_middle) (smaller a base_right)
    (smaller b base_left) (smaller b base_middle) (smaller b base_right)
    (smaller c base_left) (smaller c base_middle) (smaller c base_right)
    (smaller d base_left) (smaller d base_middle) (smaller d base_right)
    (smaller e base_left) (smaller e base_middle) (smaller e base_right)
    (smaller f base_left) (smaller f base_middle) (smaller f base_right)
    (smaller g base_left) (smaller g base_middle) (smaller g base_right)
    (smaller h base_left) (smaller h base_middle) (smaller h base_right)
    (smaller i base_left) (smaller i base_middle) (smaller i base_right)
    (smaller j base_left) (smaller j base_middle) (smaller j base_right)
  )

  (:goal (and
    (at b left) (at e left) (at f left) (at g left) (at h left) (at i left) (at j left)
    (at c middle)
    (at a right) (at d right)

    (above b e) (above e f) (above f g) (above g h) (above h i) (above i j) (above j base_left)

    (above c base_middle)

    (above a d) (above d base_right)

    (top left b)
    (top middle c)
    (top right a)
  ))