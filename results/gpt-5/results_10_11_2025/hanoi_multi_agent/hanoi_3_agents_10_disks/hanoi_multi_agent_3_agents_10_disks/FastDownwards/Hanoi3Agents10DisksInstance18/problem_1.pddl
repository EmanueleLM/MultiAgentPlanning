(define (problem Hanoi3Agents10DisksInstance18)
  (:domain hanoi-coop)
  (:objects
    left middle right - peg
    a b c d e f g h i j - disk
    agent_1 agent_2 agent_3 - agent
  )
  (:init
    ; initial stack on left: a (top) ... j (bottom)
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

    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    ; agent capabilities
    (can-move agent_1 a)
    (can-move agent_1 b)
    (can-move agent_1 c)
    (can-move agent_1 d)
    (can-move agent_2 e)
    (can-move agent_2 f)
    (can-move agent_2 g)
    (can-move agent_3 h)
    (can-move agent_3 i)
    (can-move agent_3 j)

    ; size ordering: a < b < c < d < e < f < g < h < i < j
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
  (:goal
    (and
      ; left peg: a on c on e on f on g on h on i on j on left
      (on a c)
      (on c e)
      (on e f)
      (on f g)
      (on g h)
      (on h i)
      (on i j)
      (on j left)

      ; middle peg: b on d on middle
      (on b d)
      (on d middle)

      ; right peg empty
      (clear-peg right)

      ; tops clear
      (clear-disk a)
      (clear-disk b)
    )
  )
)