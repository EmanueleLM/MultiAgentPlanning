(define (problem Hanoi3Agents20DisksInstance1)
  (:domain multi-agent-hanoi-20)
  (:objects
    a b c d e f g h i j k l m n o p q r s t - disk
    left middle right - peg
  )

  (:init
    ;; initial stacking on left peg: top->bottom a b c d e f g h i j k l m n o p q r s t
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
    (on-disk o p)
    (on-disk p q)
    (on-disk q r)
    (on-disk r s)
    (on-disk s t)
    (on-peg t left)

    ;; only the top-most disk is clear initially
    (clear-disk a)

    ;; other disks are not declared clear (implicitly false)

    ;; middle and right pegs empty initially
    (clear-peg middle)
    (clear-peg right)
    ;; left peg is not clear (omitted)

    ;; size relations: smaller x y if x is above y in ordering (a smallest, t largest)
    ;; a smaller than b..t
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j) (smaller a k) (smaller a l) (smaller a m) (smaller a n) (smaller a o) (smaller a p) (smaller a q) (smaller a r) (smaller a s) (smaller a t)
    ;; b smaller than c..t
    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j) (smaller b k) (smaller b l) (smaller b m) (smaller b n) (smaller b o) (smaller b p) (smaller b q) (smaller b r) (smaller b s) (smaller b t)
    ;; c smaller than d..t
    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j) (smaller c k) (smaller c l) (smaller c m) (smaller c n) (smaller c o) (smaller c p) (smaller c q) (smaller c r) (smaller c s) (smaller c t)
    ;; d smaller than e..t
    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j) (smaller d k) (smaller d l) (smaller d m) (smaller d n) (smaller d o) (smaller d p) (smaller d q) (smaller d r) (smaller d s) (smaller d t)
    ;; e smaller than f..t
    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j) (smaller e k) (smaller e l) (smaller e m) (smaller e n) (smaller e o) (smaller e p) (smaller e q) (smaller e r) (smaller e s) (smaller e t)
    ;; f smaller than g..t
    (smaller f g) (smaller f h) (smaller f i) (smaller f j) (smaller f k) (smaller f l) (smaller f m) (smaller f n) (smaller f o) (smaller f p) (smaller f q) (smaller f r) (smaller f s) (smaller f t)
    ;; g smaller than h..t
    (smaller g h) (smaller g i) (smaller g j) (smaller g k) (smaller g l) (smaller g m) (smaller g n) (smaller g o) (smaller g p) (smaller g q) (smaller g r) (smaller g s) (smaller g t)
    ;; h smaller than i..t
    (smaller h i) (smaller h j) (smaller h k) (smaller h l) (smaller h m) (smaller h n) (smaller h o) (smaller h p) (smaller h q) (smaller h r) (smaller h s) (smaller h t)
    ;; i smaller than j..t
    (smaller i j) (smaller i k) (smaller i l) (smaller i m) (smaller i n) (smaller i o) (smaller i p) (smaller i q) (smaller i r) (smaller i s) (smaller i t)
    ;; j smaller than k..t
    (smaller j k) (smaller j l) (smaller j m) (smaller j n) (smaller j o) (smaller j p) (smaller j q) (smaller j r) (smaller j s) (smaller j t)
    ;; k smaller than l..t
    (smaller k l) (smaller k m) (smaller k n) (smaller k o) (smaller k p) (smaller k q) (smaller k r) (smaller k s) (smaller k t)
    ;; l smaller than m..t
    (smaller l m) (smaller l n) (smaller l o) (smaller l p) (smaller l q) (smaller l r) (smaller l s) (smaller l t)
    ;; m smaller than n..t
    (smaller m n) (smaller m o) (smaller m p) (smaller m q) (smaller m r) (smaller m s) (smaller m t)
    ;; n smaller than o..t
    (smaller n o) (smaller n p) (smaller n q) (smaller n r) (smaller n s) (smaller n t)
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

    ;; agent assignments
    (assigned1 a) (assigned1 b) (assigned1 c) (assigned1 d) (assigned1 e) (assigned1 f) (assigned1 g)
    (assigned2 h) (assigned2 i) (assigned2 j) (assigned2 k) (assigned2 l) (assigned2 m) (assigned2 n)
    (assigned3 o) (assigned3 p) (assigned3 q) (assigned3 r) (assigned3 s) (assigned3 t)
  )

  (:goal
    (and
      ;; Left peg should have top->bottom: c d e f g h i j k l m n o p q r s t
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
      (on-disk o p)
      (on-disk p q)
      (on-disk q r)
      (on-disk r s)
      (on-disk s t)
      (on-peg t left)

      ;; Middle peg top->bottom: a (top) on b (directly on peg)
      (on-disk a b)
      (on-peg b middle)

      ;; Right peg empty (no disk directly on it)
      (clear-peg right)
    )
  )
)