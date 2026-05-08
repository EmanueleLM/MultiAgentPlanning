(define (problem hanoi3agents10disks-instance20)
  (:domain hanoi-multiagent-10disks)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
  )

  (:init
    ;; Initial stack on the left peg (top-down): a b c d e f g h i j
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

    ;; Clear facts: top disk a is clear; the two other pegs are empty
    (clear a)
    (clear middle)
    (clear right)

    ;; Agent permissions (enforce which agent may move which disk)
    (allowed agent_1 a)
    (allowed agent_1 b)
    (allowed agent_1 c)
    (allowed agent_1 d)

    (allowed agent_2 e)
    (allowed agent_2 f)
    (allowed agent_2 g)

    (allowed agent_3 h)
    (allowed agent_3 i)
    (allowed agent_3 j)

    ;; Size ordering: a < b < c < d < e < f < g < h < i < j
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)
  )

  (:goal (and
    ;; Left peg should contain (top->bottom) e f g h i j
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    ;; Middle peg should contain (top->bottom) b d
    (on b d)
    (on d middle)

    ;; Right peg should contain (top->bottom) a c
    (on a c)
    (on c right)
  ))
)