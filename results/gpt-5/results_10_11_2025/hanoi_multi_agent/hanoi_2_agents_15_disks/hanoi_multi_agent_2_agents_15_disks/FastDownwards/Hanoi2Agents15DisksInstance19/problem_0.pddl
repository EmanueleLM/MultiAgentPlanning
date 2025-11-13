(define (problem hanoi-2agent-audited-instance)
  (:domain hanoi-2agent-audited)
  (:objects
    left middle right - peg
    a b c d e f g h i j k l m n o - disk
    s0 s1 s2 - step
  )
  (:init
    ; size ordering: a (smallest) ... o (largest)
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

    ; ownership per agent
    (owned-a1 a) (owned-a1 b) (owned-a1 c) (owned-a1 d) (owned-a1 e) (owned-a1 f) (owned-a1 g) (owned-a1 h)
    (owned-a2 i) (owned-a2 j) (owned-a2 k) (owned-a2 l) (owned-a2 m) (owned-a2 n) (owned-a2 o)

    ; initial stacking: left top->bottom a,b,c,d,e,f,g,h,i,j,k,l,m,n,o
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

    ; clear supports at start
    (clear a)
    (clear middle)
    (clear right)

    ; peg membership at start
    (at-peg a left) (at-peg b left) (at-peg c left) (at-peg d left) (at-peg e left) (at-peg f left) (at-peg g left) (at-peg h left)
    (at-peg i left) (at-peg j left) (at-peg k left) (at-peg l left) (at-peg m left) (at-peg n left) (at-peg o left)

    ; audited, ordered, primitive move permissions
    (allowed-at-step a left middle s0)
    (allowed-at-step b left right s1)

    ; temporal succession and initial step
    (next s0 s1)
    (next s1 s2)
    (at-step s0)
  )

  (:goal (and
    ; final configuration: left top->bottom c,d,e,f,g,h,i,j,k,l,m,n,o; middle a; right b
    (on a middle)
    (on b right)
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
    (clear b)

    ; peg memberships must match goal exactly
    (at-peg a middle)
    (at-peg b right)
    (at-peg c left)
    (at-peg d left)
    (at-peg e left)
    (at-peg f left)
    (at-peg g left)
    (at-peg h left)
    (at-peg i left)
    (at-peg j left)
    (at-peg k left)
    (at-peg l left)
    (at-peg m left)
    (at-peg n left)
    (at-peg o left)

    ; enforce that both audited moves occurred in order
    (at-step s2)
  ))
)