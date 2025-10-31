(define (problem hanoi-coop-problem)
  (:domain hanoi-coop)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
    agent_1 agent_2 orchestrator - agent
  )

  (:init
    ;; initial tower on left: top-to-bottom A, B, C, D, E, F, G, H, I, J
    (on a left)
    (on b a)
    (on c b)
    (on d c)
    (on e d)
    (on f e)
    (on g f)
    (on h g)
    (on i h)
    (on j i)

    ;; pegs middle and right are empty initially
    (clear middle)
    (clear right)

    ;; top disk is a
    (clear a)

    ;; agent move permissions
    (can-move agent_1 a) (can-move agent_1 b) (can-move agent_1 c)
    (can-move agent_1 d) (can-move agent_1 e)
    (can-move agent_2 f) (can-move agent_2 g) (can-move agent_2 h)
    (can-move agent_2 i) (can-move agent_2 j)

    ;; size ordering (precomputed)
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
    ;; Goal left peg top-to-bottom: A, B, E, F, G, H, I, J
    (on a left)
    (on b a)
    (on e b)
    (on f e)
    (on g f)
    (on h g)
    (on i h)
    (on j i)

    ;; middle empty
    (clear middle)

    ;; right peg top-to-bottom: C, D
    (on c right)
    (on d c)
  ))
)