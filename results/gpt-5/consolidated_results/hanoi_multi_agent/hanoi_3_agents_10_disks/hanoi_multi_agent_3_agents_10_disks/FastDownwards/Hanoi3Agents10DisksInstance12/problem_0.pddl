(define (problem hanoi-10-3agents)
  (:domain hanoi-three-agents-10)

  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
  )

  (:init
    ; initial stack: a on b, b on c, ..., i on j, j on left
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

    ; clear tops: top disk on left, and both empty pegs
    (clear a)
    (clear middle)
    (clear right)

    ; size ordering (smaller relations)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller g h) (smaller g i) (smaller g j)
    (smaller h i) (smaller h j)
    (smaller i j)

    ; agent capabilities: all agents can move all disks
    (can-move agent_1 a) (can-move agent_1 b) (can-move agent_1 c) (can-move agent_1 d) (can-move agent_1 e)
    (can-move agent_1 f) (can-move agent_1 g) (can-move agent_1 h) (can-move agent_1 i) (can-move agent_1 j)
    (can-move agent_2 a) (can-move agent_2 b) (can-move agent_2 c) (can-move agent_2 d) (can-move agent_2 e)
    (can-move agent_2 f) (can-move agent_2 g) (can-move agent_2 h) (can-move agent_2 i) (can-move agent_2 j)
    (can-move agent_3 a) (can-move agent_3 b) (can-move agent_3 c) (can-move agent_3 d) (can-move agent_3 e)
    (can-move agent_3 f) (can-move agent_3 g) (can-move agent_3 h) (can-move agent_3 i) (can-move agent_3 j)
  )

  (:goal
    (and
      ; Left peg: e..j stacked in order (e on f on g on h on i on j on left)
      (on e f)
      (on f g)
      (on g h)
      (on h i)
      (on i j)
      (on j left)
      (clear e)

      ; Middle peg: d alone on middle
      (on d middle)
      (clear d)

      ; Right peg: a..c stacked in order (a on b on c on right)
      (on a b)
      (on b c)
      (on c right)
      (clear a)
    )
  )
)