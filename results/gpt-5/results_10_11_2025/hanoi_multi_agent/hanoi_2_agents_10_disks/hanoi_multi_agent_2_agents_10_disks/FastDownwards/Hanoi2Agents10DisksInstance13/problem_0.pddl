(define (problem hanoi-2agent-10-instance)
  (:domain hanoi-2agent-10)
  (:objects
    agent_1 agent_2 - agent
    left middle right - peg
    a b c d e f g h i j - disk
  )
  (:init
    ; size ordering: a (smallest) ... j (largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    ; agent move permissions
    (may-move agent_1 a)
    (may-move agent_1 b)
    (may-move agent_1 c)
    (may-move agent_1 d)
    (may-move agent_1 e)

    (may-move agent_2 f)
    (may-move agent_2 g)
    (may-move agent_2 h)
    (may-move agent_2 i)
    (may-move agent_2 j)

    ; initial tower: left has (top->bottom) a b c d e f g h i j
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

    ; initial clear statuses
    (clear a)
    (clear middle)
    (clear right)
  )
  (:goal (and
    ; goal stacks:
    ; left has (top->bottom) a b d e f g h i j
    (on a b)
    (on b d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    ; middle has (top->bottom) c
    (on c middle)

    ; right is empty
    (clear right)

    ; tops are explicitly fixed
    (clear a)
    (clear c)
  ))
)