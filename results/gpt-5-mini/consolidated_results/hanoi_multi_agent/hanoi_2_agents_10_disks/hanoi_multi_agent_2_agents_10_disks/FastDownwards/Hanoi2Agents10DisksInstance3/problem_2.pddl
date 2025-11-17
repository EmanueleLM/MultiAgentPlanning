(define (problem hanoi-coop-problem-uniqueplan)
  (:domain hanoi-coop-uniqueplan)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
    agent_1 agent_2 orchestrator - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 - step
  )

  (:init
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-disk g h)
    (on-disk h i)
    (on-disk i j)
    (on-peg j left)

    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    (can-move agent_1 a) (can-move agent_1 b) (can-move agent_1 c)
    (can-move agent_1 d) (can-move agent_1 e)
    (can-move agent_2 f) (can-move agent_2 g) (can-move agent_2 h)
    (can-move agent_2 i) (can-move agent_2 j)

    (at s0)

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
    (on-disk a b)
    (on-disk b e)
    (on-disk e f)
    (on-disk f g)
    (on-disk g h)
    (on-disk h i)
    (on-disk i j)
    (on-peg j left)

    (on-disk c d)
    (on-peg d right)
  ))
)