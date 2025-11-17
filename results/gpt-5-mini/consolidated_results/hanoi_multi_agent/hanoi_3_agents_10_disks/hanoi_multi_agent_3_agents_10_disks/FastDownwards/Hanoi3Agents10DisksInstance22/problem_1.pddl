(define (problem hanoi3agents10-instance22)
  (:domain hanoi-3agents-10)
  (:objects
    left middle right - peg
    a b c d e f g h i j - disk
    agent_1 agent_2 agent_3 - agent
  )

  (:init
    ;; initial stack on left from top to bottom: A B C D E F G H I J
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

    ;; pegs middle and right are empty (clear)
    (clear middle)
    (clear right)

    ;; top disk A is clear
    (clear a)

    ;; agent permissions
    (allowed1 a) (allowed1 b) (allowed1 c) (allowed1 d)
    (allowed2 e) (allowed2 f) (allowed2 g)
    (allowed3 h) (allowed3 i) (allowed3 j)

    ;; size ordering: A < B < C < D < E < F < G < H < I < J
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
      ;; left peg top-to-bottom: E F G H I J  => e on f, f on g, g on h, h on i, i on j, j on left
      (on e f) (on f g) (on g h) (on h i) (on i j) (on j left)

      ;; middle peg top-to-bottom: B D => b on d, d on middle
      (on b d) (on d middle)

      ;; right peg top-to-bottom: A C => a on c, c on right
      (on a c) (on c right)
    )
  )
)