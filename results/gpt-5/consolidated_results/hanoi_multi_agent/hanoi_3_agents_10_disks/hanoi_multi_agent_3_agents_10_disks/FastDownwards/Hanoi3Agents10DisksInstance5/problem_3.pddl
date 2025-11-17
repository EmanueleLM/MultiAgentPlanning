(define (problem hanoi3agents10disksinstance5_staged)
  (:domain hanoi3agents_staged)
  (:objects
    agent_1 agent_2 agent_3 - agent
    left middle right - peg
    a b c d e f g h i j - disk
    s0 s1 s2 s3 s4 s5 - stage
  )
  (:init
    (controls agent_1 a) (controls agent_1 b) (controls agent_1 c) (controls agent_1 d)
    (controls agent_2 e) (controls agent_2 f) (controls agent_2 g)
    (controls agent_3 h) (controls agent_3 i) (controls agent_3 j)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

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

    (clear a)
    (clear middle)
    (clear right)

    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)

    (allowed-to-peg s0 a right)
    (allowed-to-peg s1 a middle)
    (allowed-to-peg s2 b right)
    (allowed-onto-disk s3 a b)
    (allowed-to-peg s4 c middle)
  )
  (:goal (and
    (on d e) (on e f) (on f g) (on g h) (on h i) (on i j) (on j left)
    (on c middle)
    (on a b) (on b right)
    (clear d)
    (clear c)
    (clear a)
    (current s5)
  ))
)