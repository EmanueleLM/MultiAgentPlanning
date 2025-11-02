(define (problem hanoi_multiagent_problem)
  (:domain hanoi_multiagent)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
  )

  (:init
    ;; initial stack on left: top a on b on c on d on e on f on g on h on i on j on left
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

    ;; clear supports: top-of-stack disk a is clear; middle and right pegs empty
    (clear a)
    (clear middle)
    (clear right)

    ;; agent availability: only agent_1 is enabled to perform moves in this instance
    (can-act agent_1)
    ;; agent_2 and agent_3 have no (can-act ...) fact, so their actions are disabled

    ;; agent-disk movement permissions
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

    ;; static size ordering (a < b < c < d < e < f < g < h < i < j)
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

  ;; Goal: disk c must be on middle; left stack must have a on b on d on e ... on j on left
  (:goal (and
    (on a b)
    (on b d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)
    (on c middle)
  ))
)