(define (problem Hanoi3Agents10DisksInstance0)
  (:domain hanoi-three-agents)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
    agent_1 agent_2 agent_3 orchestrator - agent
  )

  (:init
    ;; Initial stack: top->bottom A,B,C,D,E,F,G,H,I,J on left
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

    ;; Clear facts: only top disk A is clear; middle and right pegs are empty
    (clear a)
    (clear middle)
    (clear right)

    ;; Agent permissions
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

    ;; Size ordering (smaller x y when x is smaller than y)
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
    ;; Right peg should have (top->bottom) A, C  => on a c, on c right
    (on a c)
    (on c right)
    ;; Left peg should have (top->bottom) B, D, E, F, G, H, I, J
    (on b d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)
    ;; Middle peg empty
    (clear middle)
    ;; top disks explicitly clear
    (clear a)
    (clear b)
  ))
)