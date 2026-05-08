(define (problem hanoi-multiagent-problem)
  (:domain hanoi-multiagent)

  (:objects
    a b c d e f g h i j k l m n o p q r s t - disk
    base-left base-middle base-right - disk
    left middle right - peg
  )

  (:init
    (above a b)
    (above b c)
    (above c d)
    (above d e)
    (above e f)
    (above f g)
    (above g h)
    (above h i)
    (above i j)
    (above j k)
    (above k l)
    (above l m)
    (above m n)
    (above n o)
    (above o p)
    (above p q)
    (above q r)
    (above r s)
    (above s t)
    (above t base-left)

    (top a left)
    (top base-middle middle)
    (top base-right right)

    (is-small a) (is-small b) (is-small c) (is-small d) (is-small e)
    (is-small f) (is-small g) (is-small h) (is-small i) (is-small j)

    (is-large k) (is-large l) (is-large m) (is-large n) (is-large o)
    (is-large p) (is-large q) (is-large r) (is-large s) (is-large t)

    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j) (smaller a k) (smaller a l) (smaller a m) (smaller a n) (smaller a o) (smaller a p) (smaller a q) (smaller a r) (smaller a s) (smaller a t)
    (smaller a base-left) (smaller a base-middle) (smaller a base-right)

    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j) (smaller b k) (smaller b l) (smaller b m) (smaller b n) (smaller b o) (smaller b p) (smaller b q) (smaller b r) (smaller b s) (smaller b t)
    (smaller b base-left) (smaller b base-middle) (smaller b base-right)

    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j) (smaller c k) (smaller c l) (smaller c m) (smaller c n) (smaller c o) (smaller c p) (smaller c q) (smaller c r) (smaller c s) (smaller c t)
    (smaller c base-left) (smaller c base-middle) (smaller c base-right)

    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j) (smaller d k) (smaller d l) (smaller d m) (smaller d n) (smaller d o) (smaller d p) (smaller d q) (smaller d r) (smaller d s) (smaller d t)
    (smaller d base-left) (smaller d base-middle) (smaller d base-right)

    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j) (smaller e k) (smaller e l) (smaller e m) (smaller e n) (smaller e o) (smaller e p) (smaller e q) (smaller e r) (smaller e s) (smaller e t)
    (smaller e base-left) (smaller e base-middle) (smaller e base-right)

    (smaller f g) (smaller f h) (smaller f i) (smaller f j) (smaller f k) (smaller f l) (smaller f m) (smaller f n) (smaller f o) (smaller f p) (smaller f q) (smaller f r) (smaller f s) (smaller f t)
    (smaller f base-left) (smaller f base-middle) (smaller f base-right)

    (smaller g h) (smaller g i) (smaller g j) (smaller g k) (smaller g l) (smaller g m) (smaller g n) (smaller g o) (smaller g p) (smaller g q) (smaller g r) (smaller g s) (smaller g t)
    (smaller g base-left) (smaller g base-middle) (smaller g base-right)

    (smaller h i) (smaller h j) (smaller h k) (smaller h l) (smaller h m) (smaller h n) (smaller h o) (smaller h p) (smaller h q) (smaller h r) (smaller h s) (smaller h t)
    (smaller h base-left) (smaller h base-middle) (smaller h base-right)

    (smaller i j) (smaller i k) (smaller i l) (smaller i m) (smaller i n) (smaller i o) (smaller i p) (smaller i q) (smaller i r) (smaller i s) (smaller i t)
    (smaller i base-left) (smaller i base-middle) (smaller i base-right)

    (smaller j k) (smaller j l) (smaller j m) (smaller j n) (smaller j o) (smaller j p) (smaller j q) (smaller j r) (smaller j s) (smaller j t)
    (smaller j base-left) (smaller j base-middle) (smaller j base-right)

    (smaller k l) (smaller k m) (smaller k n) (smaller k o) (smaller k p) (smaller k q) (smaller k r) (smaller k s) (smaller k t)
    (smaller k base-left) (smaller k base-middle) (smaller k base-right)

    (smaller l m) (smaller l n) (smaller l o) (smaller l p) (smaller l q) (smaller l r) (smaller l s) (smaller l t)
    (smaller l base-left) (smaller l base-middle) (smaller l base-right)

    (smaller m n) (smaller m o) (smaller m p) (smaller m q) (smaller m r) (smaller m s) (smaller m t)
    (smaller m base-left) (smaller m base-middle) (smaller m base-right)

    (smaller n o) (smaller n p) (smaller n q) (smaller n r) (smaller n s) (smaller n t)
    (smaller n base-left) (smaller n base-middle) (smaller n base-right)

    (smaller o p) (smaller o q) (smaller o r) (smaller o s) (smaller o t)
    (smaller o base-left) (smaller o base-middle) (smaller o base-right)

    (smaller p q) (smaller p r) (smaller p s) (smaller p t)
    (smaller p base-left) (smaller p base-middle) (smaller p base-right)

    (smaller q r) (smaller q s) (smaller q t)
    (smaller q base-left) (smaller q base-middle) (smaller q base-right)

    (smaller r s) (smaller r t)
    (smaller r base-left) (smaller r base-middle) (smaller r base-right)

    (smaller s t)
    (smaller s base-left) (smaller s base-middle) (smaller s base-right)

    (smaller t base-left) (smaller t base-middle) (smaller t base-right)
  )

  (:goal
    (and
      (top a left)
      (above a e)
      (above e f)
      (above f g)
      (above g h)
      (above h i)
      (above i j)
      (above j k)
      (above k l)
      (above l m)
      (above m n)
      (above n o)
      (above o p)
      (above p q)
      (above q r)
      (above r s)
      (above s t)
      (above t base-left)

      (top d middle)
      (above d base-middle)

      (top b right)
      (above b c)
      (above c base-right)
    )
  )
)