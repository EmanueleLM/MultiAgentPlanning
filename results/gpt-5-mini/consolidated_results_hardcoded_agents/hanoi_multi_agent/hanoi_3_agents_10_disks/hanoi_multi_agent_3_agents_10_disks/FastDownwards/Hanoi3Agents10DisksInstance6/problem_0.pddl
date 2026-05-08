(define (problem hanoi_10_disks_three_agents)
  (:domain hanoi_three_agents)
  (:objects
    a b c d e f g h i j - disk
    left mid right - peg
  )

  ;; Initial state: left peg has stack top->bottom A,B,C,D,E,F,G,H,I,J
  ;; Immediate-support representation: top-most disk is on the disk below, bottom-most disk on the peg.
  (:init
    ;; positions (immediate support)
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

    ;; clear predicates: top disk a is clear, mid and right pegs are empty (clear)
    (clear a)
    (clear mid)
    (clear right)

    ;; size ordering: explicit smaller facts for all pairs where first is smaller than second
    ;; a smaller than b..j
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    ;; b smaller than c..j
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller b h) (smaller b i) (smaller b j)
    ;; c smaller than d..j
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h)
    (smaller c i) (smaller c j)
    ;; d smaller than e..j
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i)
    (smaller d j)
    ;; e smaller than f..j
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    ;; f smaller than g..j
    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    ;; g smaller than h..j
    (smaller g h) (smaller g i) (smaller g j)
    ;; h smaller than i,j
    (smaller h i) (smaller h j)
    ;; i smaller than j
    (smaller i j)

    ;; Agent-specific allowed-move permissions (derived from provided agent input)
    ;; Agent 1 was specified to move disks A, B, C.
    (allowed-agent1 a)
    (allowed-agent1 b)
    (allowed-agent1 c)

    ;; Agent 2 and Agent 3: no allowed-agent2/3 facts provided -> they cannot move any disks
    ;; (This encodes the constraint "Do not invent availability beyond provided data")
  )

  ;; Goal: left peg stack top->bottom B, D, E, F, G, H, I, J ; middle: A ; right: C
  ;; Represented as immediate-support on-relations:
  (:goal (and
    ;; A on middle peg (top of middle)
    (on a mid)
    ;; C on right peg (top of right)
    (on c right)

    ;; Left stack: top B on D, D on E, ..., I on J, J on left
    (on b d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j left)
  ))
)