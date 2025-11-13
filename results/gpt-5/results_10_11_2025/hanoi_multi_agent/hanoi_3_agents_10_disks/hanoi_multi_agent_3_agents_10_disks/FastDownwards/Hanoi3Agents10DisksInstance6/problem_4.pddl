(define (problem Hanoi3Agents10DisksInstance6)
  (:domain hanoi-3agent-10disks)
  (:objects
    left middle right - peg
    a b c d e f g h i j - disk
    agent_1 agent_2 agent_3 - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - stage
  )
  (:init
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

    (can-move agent_1 a) (can-move agent_1 b) (can-move agent_1 c) (can-move agent_1 d)
    (can-move agent_2 e) (can-move agent_2 f) (can-move agent_2 g)
    (can-move agent_3 h) (can-move agent_3 i) (can-move agent_3 j)

    (at s0)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5)
    (next s5 s6) (next s6 s7) (next s7 s8) (next s8 s9) (next s9 s10)
  )
  (:goal
    (and
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
      (at s10)
    )
  )
)