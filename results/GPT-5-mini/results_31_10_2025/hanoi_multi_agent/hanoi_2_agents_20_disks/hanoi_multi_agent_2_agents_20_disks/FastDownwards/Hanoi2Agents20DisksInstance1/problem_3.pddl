(define (problem Hanoi2Agents20DisksInstance1)
  (:domain hanoi-multiagent)

  (:objects
    a b c d e f g h i j k l m n o p q r s t - disk
    left middle right - peg
  )

  (:init
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
    (on o p)
    (on p q)
    (on q r)
    (on r s)
    (on s t)
    (on t left)

    (clear a)
    (clear middle)
    (clear right)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller a g) (smaller a h) (smaller a i) (smaller a j) (smaller a k)
    (smaller a l) (smaller a m) (smaller a n) (smaller a o) (smaller a p)
    (smaller a q) (smaller a r) (smaller a s) (smaller a t)

    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller b h) (smaller b i) (smaller b j) (smaller b k) (smaller b l)
    (smaller b m) (smaller b n) (smaller b o) (smaller b p) (smaller b q)
    (smaller b r) (smaller b s) (smaller b t)

    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h)
    (smaller c i) (smaller c j) (smaller c k) (smaller c l) (smaller c m)
    (smaller c n) (smaller c o) (smaller c p) (smaller c q) (smaller c r)
    (smaller c s) (smaller c t)

    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i)
    (smaller d j) (smaller d k) (smaller d l) (smaller d m) (smaller d n)
    (smaller d o) (smaller d p) (smaller d q) (smaller d r) (smaller d s)
    (smaller d t)

    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller e k) (smaller e l) (smaller e m) (smaller e n) (smaller e o)
    (smaller e p) (smaller e q) (smaller e r) (smaller e s) (smaller e t)

    (smaller f g) (smaller f h) (smaller f i) (smaller f j) (smaller f k)
    (smaller f l) (smaller f m) (smaller f n) (smaller f o) (smaller f p)
    (smaller f q) (smaller f r) (smaller f s) (smaller f t)

    (smaller g h) (smaller g i) (smaller g j) (smaller g k) (smaller g l)
    (smaller g m) (smaller g n) (smaller g o) (smaller g p) (smaller g q)
    (smaller g r) (smaller g s) (smaller g t)

    (smaller h i) (smaller h j) (smaller h k) (smaller h l) (smaller h m)
    (smaller h n) (smaller h o) (smaller h p) (smaller h q) (smaller h r)
    (smaller h s) (smaller h t)

    (smaller i j) (smaller i k) (smaller i l) (smaller i m) (smaller i n)
    (smaller i o) (smaller i p) (smaller i q) (smaller i r) (smaller i s)
    (smaller i t)

    (smaller j k) (smaller j l) (smaller j m) (smaller j n) (smaller j o)
    (smaller j p) (smaller j q) (smaller j r) (smaller j s) (smaller j t)

    (smaller k l) (smaller k m) (smaller k n) (smaller k o) (smaller k p)
    (smaller k q) (smaller k r) (smaller k s) (smaller k t)

    (smaller l m) (smaller l n) (smaller l o) (smaller l p) (smaller l q)
    (smaller l r) (smaller l s) (smaller l t)

    (smaller m n) (smaller m o) (smaller m p) (smaller m q) (smaller m r)
    (smaller m s) (smaller m t)

    (smaller n o) (smaller n p) (smaller n q) (smaller n r) (smaller n s)
    (smaller n t)

    (smaller o p) (smaller o q) (smaller o r) (smaller o s) (smaller o t)

    (smaller p q) (smaller p r) (smaller p s) (smaller p t)

    (smaller q r) (smaller q s) (smaller q t)

    (smaller r s) (smaller r t)

    (smaller s t)

    (can-move agent_1 a) (can-move agent_1 b) (can-move agent_1 c) (can-move agent_1 d)
    (can-move agent_1 e) (can-move agent_1 f) (can-move agent_1 g) (can-move agent_1 h)
    (can-move agent_1 i) (can-move agent_1 j)

    (can-move agent_2 k) (can-move agent_2 l) (can-move agent_2 m) (can-move agent_2 n)
    (can-move agent_2 o) (can-move agent_2 p) (can-move agent_2 q) (can-move agent_2 r)
    (can-move agent_2 s) (can-move agent_2 t)
  )

  (:goal
    (and
      (on a middle)
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
      (on o p)
      (on p q)
      (on q r)
      (on r s)
      (on s t)
      (on t left)
    )
  )
)