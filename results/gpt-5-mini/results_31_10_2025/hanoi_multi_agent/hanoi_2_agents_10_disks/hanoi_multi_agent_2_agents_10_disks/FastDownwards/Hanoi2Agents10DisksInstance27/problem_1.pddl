(define (problem Hanoi2Agents10DisksInstance27-problem)
  (:domain hanoi_two_agents_10)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
  )

  (:init
    ; initial stack on left, top-to-bottom a,b,c,d,e,f,g,h,i,j
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

    ; top disk a is clear
    (clear-disk a)
    ; pegs middle and right are empty
    (clear-peg middle)
    (clear-peg right)

    ; agent move permissions
    (agent1-can-move a)
    (agent1-can-move b)
    (agent1-can-move c)
    (agent1-can-move d)
    (agent1-can-move e)

    (agent2-can-move f)
    (agent2-can-move g)
    (agent2-can-move h)
    (agent2-can-move i)
    (agent2-can-move j)

    ; size ordering: A < B < ... < J
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
    ; left peg should have top-to-bottom b,c,d,e,f,g,h,i,j
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-disk g h)
    (on-disk h i)
    (on-disk i j)
    (on-peg j left)

    ; right peg should have a
    (on-peg a right)
  ))
)