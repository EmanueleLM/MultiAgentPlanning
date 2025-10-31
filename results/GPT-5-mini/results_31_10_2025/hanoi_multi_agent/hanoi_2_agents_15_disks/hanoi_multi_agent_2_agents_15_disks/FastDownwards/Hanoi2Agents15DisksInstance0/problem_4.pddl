(define (problem hanoi15-multiagent)
  (:domain hanoi-multiagent)
  (:objects
    a b c d e f g h i j k l m n o - disk
    left middle right - place
    agent_1 agent_2 orchestrator - agent
  )

  (:init
    ;; Initial stack on left: top->bottom A,B,C,...,O
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
    (on k j)
    (on l k)
    (on m l)
    (on n m)
    (on o n)

    ;; Clear objects: top disk a, and empty pegs middle/right
    (clear a)
    (clear middle)
    (clear right)

    ;; Agent move permissions (structural restriction: only these disks can be moved by each agent)
    (can-move agent_1 a) (can-move agent_1 b) (can-move agent_1 c) (can-move agent_1 d)
    (can-move agent_1 e) (can-move agent_1 f) (can-move agent_1 g) (can-move agent_1 h)

    (can-move agent_2 i) (can-move agent_2 j) (can-move agent_2 k) (can-move agent_2 l)
    (can-move agent_2 m) (can-move agent_2 n) (can-move agent_2 o)

    ;; Size ordering: smaller X Y means X is smaller than Y
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j) (smaller a k) (smaller a l) (smaller a m) (smaller a n) (smaller a o)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j) (smaller b k) (smaller b l) (smaller b m) (smaller b n) (smaller b o)
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j) (smaller c k) (smaller c l) (smaller c m) (smaller c n) (smaller c o)
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j) (smaller d k) (smaller d l) (smaller d m) (smaller d n) (smaller d o)
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j) (smaller e k) (smaller e l) (smaller e m) (smaller e n) (smaller e o)
    (smaller f g) (smaller f h) (smaller f i) (smaller f j) (smaller f k) (smaller f l) (smaller f m) (smaller f n) (smaller f o)
    (smaller g h) (smaller g i) (smaller g j) (smaller g k) (smaller g l) (smaller g m) (smaller g n) (smaller g o)
    (smaller h i) (smaller h j) (smaller h k) (smaller h l) (smaller h m) (smaller h n) (smaller h o)
    (smaller i j) (smaller i k) (smaller i l) (smaller i m) (smaller i n) (smaller i o)
    (smaller j k) (smaller j l) (smaller j m) (smaller j n) (smaller j o)
    (smaller k l) (smaller k m) (smaller k n) (smaller k o)
    (smaller l m) (smaller l n) (smaller l o)
    (smaller m n) (smaller m o)
    (smaller n o)
  )

  (:goal (and
    ;; Left peg final stack top->bottom: A, D, E, F, G, H, I, J, K, L, M, N, O
    (on a d)
    (on d e)
    (on e f)
    (on f g)
    (on g h)
    (on h i)
    (on i j)
    (on j k)
    (on k l)
    (on l m)
    (on m n)
    (on n o)
    (on o left)

    ;; Middle peg final stack top->bottom: B, C
    (on b c)
    (on c middle)

    ;; Right peg empty
    (clear right)

    ;; Top disks are clear
    (clear a)
    (clear b)
  ))
)