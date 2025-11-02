(define (problem Hanoi2Agents10DisksInstance5)
  (:domain hanoi_multi_agent)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
  )
  (:init
    ;; initial stack on left: top-to-bottom a b c d e f g h i j  (a is top, j bottom on peg)
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

    ;; clear things with nothing on top initially
    (clear a)
    (clear middle)
    (clear right)

    ;; agent movement capabilities
    (can-move-agent1 a)
    (can-move-agent1 b)
    (can-move-agent1 c)
    (can-move-agent1 d)
    (can-move-agent1 e)

    (can-move-agent2 f)
    (can-move-agent2 g)
    (can-move-agent2 h)
    (can-move-agent2 i)
    (can-move-agent2 j)

    ;; size ordering: smaller X Y means X is smaller than Y
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
    ;; left peg goal stack top-to-bottom: b e f g h i j
    (on b e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)

    ;; middle peg goal stack top-to-bottom: a c
    (on a c)
    (on c middle)

    ;; right peg goal: d on right
    (on d right)
  ))
)