(define (problem Hanoi2Agents15DisksInstance21)
  (:domain hanoi-multiagent-15)
  (:objects
    a b c d e f g h i j k l m n o - disk
    left middle right - peg
  )

  (:init
    ;; initial stack on left top->bottom: a,b,c,d,e,f,g,h,i,j,k,l,m,n,o
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-disk f g)
    (on-disk g h)
    (on-disk h i)
    (on-disk i j)
    (on-disk j k)
    (on-disk k l)
    (on-disk l m)
    (on-disk m n)
    (on-disk n o)
    (on-peg o left)

    ;; topmost disk a is clear
    (clear a)

    ;; pegs occupancy
    (peg-empty middle)
    (peg-empty right)

    ;; agent permissions
    (agent1-disk a) (agent1-disk b) (agent1-disk c) (agent1-disk d)
    (agent1-disk e) (agent1-disk f) (agent1-disk g) (agent1-disk h)

    (agent2-disk i) (agent2-disk j) (agent2-disk k) (agent2-disk l)
    (agent2-disk m) (agent2-disk n) (agent2-disk o)

    ;; size ordering: smaller relationships (a < b < c ... < o)
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
    ;; Left peg final stack (top->bottom): b,e,f,g,h,i,j,k,l,m,n,o
    (on-disk b e)
    (on-disk e f)
    (on-disk f g)
    (on-disk g h)
    (on-disk h i)
    (on-disk i j)
    (on-disk j k)
    (on-disk k l)
    (on-disk l m)
    (on-disk m n)
    (on-disk n o)
    (on-peg o left)

    ;; Right peg final stack (top->bottom): a,c,d
    (on-disk a c)
    (on-disk c d)
    (on-peg d right)

    ;; middle peg empty
    (peg-empty middle)

    ;; top disks clear as required
    (clear b)
    (clear a)
  ))
)