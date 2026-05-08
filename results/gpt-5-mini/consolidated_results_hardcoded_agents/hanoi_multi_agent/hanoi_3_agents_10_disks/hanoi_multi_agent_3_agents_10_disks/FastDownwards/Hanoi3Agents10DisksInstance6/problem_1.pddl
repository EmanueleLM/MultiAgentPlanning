(define (problem hanoi_10_disks_three_agents_instance6)
  (:domain hanoi_three_agents)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
  )

  (:init
    ;; initial immediate-support positions: top->bottom on left: a b c d e f g h i j
    (on a b)
    (on b c)
    (on c d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    ;; clear facts: top disk a is clear; other disks that have something on top are not clear.
    (clear a)
    ;; pegs middle and right are empty
    (clear middle)
    (clear right)

    ;; size ordering (smaller facts)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller a g) (smaller a h) (smaller a i) (smaller a j)

    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller b h) (smaller b i) (smaller b j)

    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h)
    (smaller c i) (smaller c j)

    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i)
    (smaller d j)

    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)

    (smaller f g) (smaller f h) (smaller f i) (smaller f j)

    (smaller g h) (smaller g i) (smaller g j)

    (smaller h i) (smaller h j)

    (smaller i j)

    ;; agent-specific permissions (given by the human/JSON specification)
    ;; agent_1 may move A, B, C, D
    (allowed-agent1 a)
    (allowed-agent1 b)
    (allowed-agent1 c)
    (allowed-agent1 d)

    ;; agent_2 may move E, F, G
    (allowed-agent2 e)
    (allowed-agent2 f)
    (allowed-agent2 g)

    ;; agent_3 may move H, I, J
    (allowed-agent3 h)
    (allowed-agent3 i)
    (allowed-agent3 j)
  )

  ;; Goal: left peg top->bottom B, D, E, F, G, H, I, J ; middle: A ; right: C
  (:goal (and
    (on a middle)
    (on c right)

    (on b d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)
  ))
)