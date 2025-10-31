(define (problem hanoi-2agent-10-instance26)
  (:domain hanoi-two-agent-10)

  (:objects
    a b c d e f g h i j
    base-left base-middle base-right
    left middle right
    agent_1 agent_2 orchestrator
  )

  (:init
    (at a left) (at b left) (at c left) (at d left) (at e left)
    (at f left) (at g left) (at h left) (at i left) (at j left)

    (at base-left left) (at base-middle middle) (at base-right right)

    (above a b) (above b c) (above c d) (above d e) (above e f)
    (above f g) (above g h) (above h i) (above i j) (above j base-left)

    (top left a)
    (top middle base-middle)
    (top right base-right)

    (clear a) (clear base-middle) (clear base-right)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    (smaller a base-left) (smaller a base-middle) (smaller a base-right)
    (smaller b base-left) (smaller b base-middle) (smaller b base-right)
    (smaller c base-left) (smaller c base-middle) (smaller c base-right)
    (smaller d base-left) (smaller d base-middle) (smaller d base-right)
    (smaller e base-left) (smaller e base-middle) (smaller e base-right)
    (smaller f base-left) (smaller f base-middle) (smaller f base-right)
    (smaller g base-left) (smaller g base-middle) (smaller g base-right)
    (smaller h base-left) (smaller h base-middle) (smaller h base-right)
    (smaller i base-left) (smaller i base-middle) (smaller i base-right)
    (smaller j base-left) (smaller j base-middle) (smaller j base-right)
  )

  (:goal (and
    (at b left) (at e left) (at f left) (at g left) (at h left) (at i left) (at j left)
    (at c middle)
    (at a right) (at d right)

    (above b e) (above e f) (above f g) (above g h) (above h i) (above i j) (above j base-left)

    (above c base-middle)

    (above a d) (above d base-right)

    (top left b)
    (top middle c)
    (top right a)
  ))
)