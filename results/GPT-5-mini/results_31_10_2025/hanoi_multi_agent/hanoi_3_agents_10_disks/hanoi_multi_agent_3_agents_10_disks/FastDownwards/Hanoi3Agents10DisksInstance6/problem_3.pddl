(define (problem Hanoi3Agents10DisksInstance6)
  (:domain hanoi-3agents)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
  )

  (:init
    ; initial stacking: top->bottom on left: a b c d e f g h i j
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

    ; clear facts: only topmost disk 'a' is clear; middle and right pegs empty
    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    ; agent move permissions (private info encoded as static facts)
    (can-move-agent1 a)
    (can-move-agent1 b)
    (can-move-agent1 c)
    (can-move-agent1 d)

    (can-move-agent2 e)
    (can-move-agent2 f)
    (can-move-agent2 g)

    (can-move-agent3 h)
    (can-move-agent3 i)
    (can-move-agent3 j)

    ; size ordering (smaller facts) -- a is smallest, j largest
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
    ; desired final configuration:
    ; left peg (top->bottom) b d e f g h i j
    (on-disk b d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-disk g h)
    (on-disk h i)
    (on-disk i j)
    (on-peg j left)

    ; middle peg has a (top)
    (on-peg a middle)

    ; right peg has c (top)
    (on-peg c right)
  ))
)