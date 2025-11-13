(define (problem hanoi3agents15disksinstance17)
  (:domain hanoi-3agents-15disks)
  (:objects
    agent_1 agent_2 agent_3 auditor orchestrator - agent
    left middle right - peg
    a b c d e f g h i j k l m n o - disk
  )
  (:init
    ; size ordering (smaller x y means x is smaller than y)
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

    ; immediate successors
    (succ a b)
    (succ b c)
    (succ c d)
    (succ d e)
    (succ e f)
    (succ f g)
    (succ g h)
    (succ h i)
    (succ i j)
    (succ j k)
    (succ k l)
    (succ l m)
    (succ m n)
    (succ n o)

    ; agent permissions
    (can-move agent_1 a)
    (can-move agent_1 b)
    (can-move agent_1 c)
    (can-move agent_1 d)
    (can-move agent_1 e)

    (can-move agent_2 f)
    (can-move agent_2 g)
    (can-move agent_2 h)
    (can-move agent_2 i)
    (can-move agent_2 j)

    (can-move agent_3 k)
    (can-move agent_3 l)
    (can-move agent_3 m)
    (can-move agent_3 n)
    (can-move agent_3 o)

    ; initial stacking: left has A (top) down to O (bottom)
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

    ; clear statuses
    (clear a)
    (clear middle)
    (clear right)

    ; top-of-peg markers
    (top a left)

    ; peg membership
    (on-peg left left)
    (on-peg middle middle)
    (on-peg right right)

    (on-peg a left)
    (on-peg b left)
    (on-peg c left)
    (on-peg d left)
    (on-peg e left)
    (on-peg f left)
    (on-peg g left)
    (on-peg h left)
    (on-peg i left)
    (on-peg j left)
    (on-peg k left)
    (on-peg l left)
    (on-peg m left)
    (on-peg n left)
    (on-peg o left)
  )

  (:goal
    (and
      ; right has only A
      (on a right)
      (clear a)

      ; middle has only C
      (on c middle)
      (clear c)

      ; left has B on D, D on E, ..., O on left
      (on b d)
      (clear b)
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
    )
  )
)