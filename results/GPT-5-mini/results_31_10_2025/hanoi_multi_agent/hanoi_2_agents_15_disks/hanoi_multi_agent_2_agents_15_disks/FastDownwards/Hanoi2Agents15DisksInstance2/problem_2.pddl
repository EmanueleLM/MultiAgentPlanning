(define (problem Hanoi2Agents15DisksInstance2)
  :domain two-agent-hanoi-15-twoagents
  :objects
    a b c d e f g h i j k l m n o - disk

  :init
    ;; initial stack on left: top -> bottom a b c d e f g h i j k l m n o
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
    (top left a)
    (empty middle)
    (empty right)

    ;; size relations (smaller)
    ;; a smaller than b..o
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j) (smaller a k) (smaller a l) (smaller a m) (smaller a n) (smaller a o)
    ;; b smaller than c..o
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j) (smaller b k) (smaller b l) (smaller b m) (smaller b n) (smaller b o)
    ;; c smaller than d..o
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j) (smaller c k) (smaller c l) (smaller c m) (smaller c n) (smaller c o)
    ;; d smaller than e..o
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j) (smaller d k) (smaller d l) (smaller d m) (smaller d n) (smaller d o)
    ;; e smaller than f..o
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j) (smaller e k) (smaller e l) (smaller e m) (smaller e n) (smaller e o)
    ;; f smaller than g..o
    (smaller f g) (smaller f h) (smaller f i) (smaller f j) (smaller f k) (smaller f l) (smaller f m) (smaller f n) (smaller f o)
    ;; g smaller than h..o
    (smaller g h) (smaller g i) (smaller g j) (smaller g k) (smaller g l) (smaller g m) (smaller g n) (smaller g o)
    ;; h smaller than i..o
    (smaller h i) (smaller h j) (smaller h k) (smaller h l) (smaller h m) (smaller h n) (smaller h o)
    ;; i smaller than j..o
    (smaller i j) (smaller i k) (smaller i l) (smaller i m) (smaller i n) (smaller i o)
    ;; j smaller than k..o
    (smaller j k) (smaller j l) (smaller j m) (smaller j n) (smaller j o)
    ;; k smaller than l..o
    (smaller k l) (smaller k m) (smaller k n) (smaller k o)
    ;; l smaller than m..o
    (smaller l m) (smaller l n) (smaller l o)
    ;; m smaller than n..o
    (smaller m n) (smaller m o)
    ;; n smaller than o
    (smaller n o)

    ;; agent movement permissions
    (can-move-agent1 a) (can-move-agent1 b) (can-move-agent1 c) (can-move-agent1 d)
    (can-move-agent1 e) (can-move-agent1 f) (can-move-agent1 g) (can-move-agent1 h)
    (can-move-agent2 i) (can-move-agent2 j) (can-move-agent2 k) (can-move-agent2 l)
    (can-move-agent2 m) (can-move-agent2 n) (can-move-agent2 o)

  :goal (and
    ;; left peg should have top->bottom c d e f g h i j k l m n o
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
    (top left c)
    ;; middle peg should have top->bottom a b
    (on-disk a b)
    (on-peg b middle)
    (top middle a)
    ;; right peg empty
    (empty right)
  )
)