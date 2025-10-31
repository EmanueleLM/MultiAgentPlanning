(define (problem hanoi3_two_agents-instance)
  (:domain hanoi_two_agents)
  (:objects
    a b c d e f g h i j - disk
    left middle right - peg
  )

  (:init
    ; initial stack: left peg top-to-bottom A, B, C, D, E, F, G, H, I, J
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

    ; clear predicates: top disk a is clear; other disks on top are not listed as clear
    (clear-disk a)
    ; pegs: left has disks (not listed as clear), middle and right are empty and therefore clear
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

    ; size ordering: smaller X Y for all pairs where X is smaller than Y (A < B < C ... < J)
    ; A smaller than B..J
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    ; B smaller than C..J
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    ; C smaller than D..J
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    ; D smaller than E..J
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    ; E smaller than F..J
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    ; F smaller than G..J
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    ; G smaller than H..J
    (smaller g h) (smaller g i) (smaller g j)
    ; H smaller than I,J
    (smaller h i) (smaller h j)
    ; I smaller than J
    (smaller i j)
  )

  (:goal (and
    ; goal left peg top-to-bottom B, C, D, E, F, G, H, I, J
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-disk g h)
    (on-disk h i)
    (on-disk i j)
    (on-peg j left)

    ; goal right peg top-to-bottom A
    (on-peg a right)

    ; middle peg should be empty implicitly (not required as goal atoms; satisfied when all disks are on left or right)
  ))
)