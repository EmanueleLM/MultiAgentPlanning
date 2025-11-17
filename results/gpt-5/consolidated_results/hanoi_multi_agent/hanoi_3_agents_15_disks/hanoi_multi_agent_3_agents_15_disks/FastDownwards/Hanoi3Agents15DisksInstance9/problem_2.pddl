(define (problem Hanoi3Agents15DisksInstance9)
  (:domain hanoi3agents15)
  (:objects
    agent_1 agent_2 agent_3 - agent
    left middle right - peg
    a b c d e f g h i j k l m n o - disk
  )
  (:init
    ; initial stack A(top) ... O(bottom) on left
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

    (clear a)
    (clear middle)
    (clear right)

    ; agent controls
    (controls agent_1 a)
    (controls agent_1 b)
    (controls agent_1 c)
    (controls agent_1 d)
    (controls agent_1 e)

    (controls agent_2 f)
    (controls agent_2 g)
    (controls agent_2 h)
    (controls agent_2 i)
    (controls agent_2 j)

    (controls agent_3 k)
    (controls agent_3 l)
    (controls agent_3 m)
    (controls agent_3 n)
    (controls agent_3 o)

    ; strict size ordering (smaller x y) for all x<y
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller a g) (smaller a h) (smaller a i) (smaller a j) (smaller a k)
    (smaller a l) (smaller a m) (smaller a n) (smaller a o)

    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller b h) (smaller b i) (smaller b j) (smaller b k) (smaller b l)
    (smaller b m) (smaller b n) (smaller b o)

    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h)
    (smaller c i) (smaller c j) (smaller c k) (smaller c l) (smaller c m)
    (smaller c n) (smaller c o)

    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i)
    (smaller d j) (smaller d k) (smaller d l) (smaller d m) (smaller d n)
    (smaller d o)

    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller e k) (smaller e l) (smaller e m) (smaller e n) (smaller e o)

    (smaller f g) (smaller f h) (smaller f i) (smaller f j) (smaller f k)
    (smaller f l) (smaller f m) (smaller f n) (smaller f o)

    (smaller g h) (smaller g i) (smaller g j) (smaller g k) (smaller g l)
    (smaller g m) (smaller g n) (smaller g o)

    (smaller h i) (smaller h j) (smaller h k) (smaller h l) (smaller h m)
    (smaller h n) (smaller h o)

    (smaller i j) (smaller i k) (smaller i l) (smaller i m) (smaller i n)
    (smaller i o)

    (smaller j k) (smaller j l) (smaller j m) (smaller j n) (smaller j o)

    (smaller k l) (smaller k m) (smaller k n) (smaller k o)

    (smaller l m) (smaller l n) (smaller l o)

    (smaller m n) (smaller m o)

    (smaller n o)
  )
  (:goal
    (and
      ; middle peg: A on C on D on middle (top->bottom A, C, D)
      (on a c)
      (on c d)
      (on d middle)

      ; left peg: B on E on F ... on O on left (top->bottom B, E, F, ... O)
      (on b e)
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

      ; right peg empty; tops clear
      (clear a)
      (clear b)
      (clear right)
    )
  )
)