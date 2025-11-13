(define (problem hanoi2agents15_instance18)
  (:domain hanoi_agents_2a_15d)

  (:objects
    left middle right - peg
    a b c d e f g h i j k l m n o - disk
  )

  (:init
    ; Agent move permissions
    (can-move-agent1 a) (can-move-agent1 b) (can-move-agent1 c) (can-move-agent1 d)
    (can-move-agent1 e) (can-move-agent1 f) (can-move-agent1 g) (can-move-agent1 h)
    (can-move-agent2 i) (can-move-agent2 j) (can-move-agent2 k) (can-move-agent2 l)
    (can-move-agent2 m) (can-move-agent2 n) (can-move-agent2 o)

    ; Initial stacking: left peg has A (top) down to O (bottom)
    (on a b)
    (on b c)
    (on c d)
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

    ; Clear places at start
    (clear a)
    (clear middle)
    (clear right)

    ; Size ordering among disks (smaller x y means x is smaller than y)
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

    ; Any disk can be placed on any empty peg
    (smaller a left) (smaller a middle) (smaller a right)
    (smaller b left) (smaller b middle) (smaller b right)
    (smaller c left) (smaller c middle) (smaller c right)
    (smaller d left) (smaller d middle) (smaller d right)
    (smaller e left) (smaller e middle) (smaller e right)
    (smaller f left) (smaller f middle) (smaller f right)
    (smaller g left) (smaller g middle) (smaller g right)
    (smaller h left) (smaller h middle) (smaller h right)
    (smaller i left) (smaller i middle) (smaller i right)
    (smaller j left) (smaller j middle) (smaller j right)
    (smaller k left) (smaller k middle) (smaller k right)
    (smaller l left) (smaller l middle) (smaller l right)
    (smaller m left) (smaller m middle) (smaller m right)
    (smaller n left) (smaller n middle) (smaller n right)
    (smaller o left) (smaller o middle) (smaller o right)

    ; Optional documentation (non-operative): audited 3-disk subplan for A,B,C
    ; agent_1: move disk A from left to right
    ; agent_1: move disk B from left to middle
    ; agent_1: move disk A from right to middle
    ; agent_1: move disk C from left to right
    ; agent_1: move disk A from middle to left
    ; agent_1: move disk B from middle to right
    ; agent_1: move disk A from left to right
  )

  (:goal
    (and
      ; Right peg has A (top), then B, with C on right
      (on a b)
      (on b c)
      (on c right)
      (clear a)

      ; Left peg has D (top) down to O (bottom on left)
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
      (clear d)

      ; Middle peg is empty
      (clear middle)
    )
  )
)