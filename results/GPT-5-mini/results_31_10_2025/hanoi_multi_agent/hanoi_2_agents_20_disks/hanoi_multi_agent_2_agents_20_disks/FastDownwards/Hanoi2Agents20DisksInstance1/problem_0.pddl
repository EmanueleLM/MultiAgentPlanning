(define (problem hanoi-instance)
  (:domain hanoi-multiagent)

  ;; objects: disks a..t (A..T), pegs, agents
  (:objects
    a b c d e f g h i j k l m n o p q r s t - disk
    left middle right - peg
    agent1 agent2 - agent
  )

  (:init
    ;; STACK INITIALIZATION (all disks stacked on left, largest at bottom = t)
    ;; on top relationships: a on b, b on c, ..., s on t, t on left
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

    ;; clear facts: only the topmost disk a is clear; middle and right pegs are clear
    (clear a)
    (clear middle)
    (clear right)

    ;; stacking order facts (smaller relation). A is smallest, T largest.
    ;; include every pair (x y) where x is strictly smaller than y
    ;; For brevity and solver compatibility we expand all such pairs explicitly:
    ;; a smaller than b..t
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller a g) (smaller a h) (smaller a i) (smaller a j) (smaller a k)
    (smaller a l) (smaller a m) (smaller a n) (smaller a o) (smaller a p)
    (smaller a q) (smaller a r) (smaller a s) (smaller a t)
    ;; b smaller than c..t
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g)
    (smaller b h) (smaller b i) (smaller b j) (smaller b k) (smaller b l)
    (smaller b m) (smaller b n) (smaller b o) (smaller b p) (smaller b q)
    (smaller b r) (smaller b s) (smaller b t)
    ;; c smaller than d..t
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h)
    (smaller c i) (smaller c j) (smaller c k) (smaller c l) (smaller c m)
    (smaller c n) (smaller c o) (smaller c p) (smaller c q) (smaller c r)
    (smaller c s) (smaller c t)
    ;; d smaller than e..t
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i)
    (smaller d j) (smaller d k) (smaller d l) (smaller d m) (smaller d n)
    (smaller d o) (smaller d p) (smaller d q) (smaller d r) (smaller d s)
    (smaller d t)
    ;; e smaller than f..t
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller e k) (smaller e l) (smaller e m) (smaller e n) (smaller e o)
    (smaller e p) (smaller e q) (smaller e r) (smaller e s) (smaller e t)
    ;; f smaller than g..t
    (smaller f g) (smaller f h) (smaller f i) (smaller f j) (smaller f k)
    (smaller f l) (smaller f m) (smaller f n) (smaller f o) (smaller f p)
    (smaller f q) (smaller f r) (smaller f s) (smaller f t)
    ;; g smaller than h..t
    (smaller g h) (smaller g i) (smaller g j) (smaller g k) (smaller g l)
    (smaller g m) (smaller g n) (smaller g o) (smaller g p) (smaller g q)
    (smaller g r) (smaller g s) (smaller g t)
    ;; h smaller than i..t
    (smaller h i) (smaller h j) (smaller h k) (smaller h l) (smaller h m)
    (smaller h n) (smaller h o) (smaller h p) (smaller h q) (smaller h r)
    (smaller h s) (smaller h t)
    ;; i smaller than j..t
    (smaller i j) (smaller i k) (smaller i l) (smaller i m) (smaller i n)
    (smaller i o) (smaller i p) (smaller i q) (smaller i r) (smaller i s)
    (smaller i t)
    ;; j smaller than k..t
    (smaller j k) (smaller j l) (smaller j m) (smaller j n) (smaller j o)
    (smaller j p) (smaller j q) (smaller j r) (smaller j s) (smaller j t)
    ;; k smaller than l..t
    (smaller k l) (smaller k m) (smaller k n) (smaller k o) (smaller k p)
    (smaller k q) (smaller k r) (smaller k s) (smaller k t)
    ;; l smaller than m..t
    (smaller l m) (smaller l n) (smaller l o) (smaller l p) (smaller l q)
    (smaller l r) (smaller l s) (smaller l t)
    ;; m smaller than n..t
    (smaller m n) (smaller m o) (smaller m p) (smaller m q) (smaller m r)
    (smaller m s) (smaller m t)
    ;; n smaller than o..t
    (smaller n o) (smaller n p) (smaller n q) (smaller n r) (smaller n s)
    (smaller n t)
    ;; o smaller than p..t
    (smaller o p) (smaller o q) (smaller o r) (smaller o s) (smaller o t)
    ;; p smaller than q..t
    (smaller p q) (smaller p r) (smaller p s) (smaller p t)
    ;; q smaller than r..t
    (smaller q r) (smaller q s) (smaller q t)
    ;; r smaller than s..t
    (smaller r s) (smaller r t)
    ;; s smaller than t
    (smaller s t)

    ;; AGENT MOVEMENT PERMISSIONS (public information)
    ;; Provided: agent1 controls disks A-J (a..j) and will perform the move of disk a.
    ;; We therefore assert can-move only for agent1 on disks a..j. Agent2 performs no moves
    ;; in the provided partial plan, so no (can-move agent2 ...) facts are included.
    (can-move agent1 a) (can-move agent1 b) (can-move agent1 c) (can-move agent1 d)
    (can-move agent1 e) (can-move agent1 f) (can-move agent1 g) (can-move agent1 h)
    (can-move agent1 i) (can-move agent1 j)

    ;; Note: agent2 exists but is not given permission to move any disks in this instance,
    ;; encoding the constraint "agent_2 performs no moves".
  )

  ;; GOAL: integrate the agents' partial plans into a complete consistent goal.
  ;; The public partial plan specified agent1 will move disk A from left to middle and
  ;; agent2 will perform no moves. We therefore set the goal that disk a is on the middle peg
  ;; while preserving the relative stack of the other disks (they remain on the left peg
  ;; in the original order).
  (:goal
    (and
      ;; a should be on middle (this is the requested partial move achieved)
      (on a middle)
      ;; remaining stack relationships remain on the left as initially (b on c, ..., s on t, t on left)
      (on b c) (on c d) (on d e) (on e f) (on f g) (on g h) (on h i) (on i j) (on j k)
      (on k l) (on l m) (on m n) (on n o) (on o p) (on p q) (on q r) (on r s) (on s t) (on t left)
    )
  )
)