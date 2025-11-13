(define (problem hanoi-20-instance)
  (:domain tower-of-hanoi-20)
  (:objects
    left middle right - peg
    a b c d e f g h i j k l m n o p q r s t - disk
  )
  (:init
    ; initial stack: a (top) ... t (bottom) on peg left
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

    ; size ordering among disks
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f) (smaller a g) (smaller a h) (smaller a i) (smaller a j)
    (smaller a k) (smaller a l) (smaller a m) (smaller a n) (smaller a o) (smaller a p) (smaller a q) (smaller a r) (smaller a s) (smaller a t)

    (smaller b c) (smaller b d) (smaller b e) (smaller b f) (smaller b g) (smaller b h) (smaller b i) (smaller b j)
    (smaller b k) (smaller b l) (smaller b m) (smaller b n) (smaller b o) (smaller b p) (smaller b q) (smaller b r) (smaller b s) (smaller b t)

    (smaller c d) (smaller c e) (smaller c f) (smaller c g) (smaller c h) (smaller c i) (smaller c j)
    (smaller c k) (smaller c l) (smaller c m) (smaller c n) (smaller c o) (smaller c p) (smaller c q) (smaller c r) (smaller c s) (smaller c t)

    (smaller d e) (smaller d f) (smaller d g) (smaller d h) (smaller d i) (smaller d j)
    (smaller d k) (smaller d l) (smaller d m) (smaller d n) (smaller d o) (smaller d p) (smaller d q) (smaller d r) (smaller d s) (smaller d t)

    (smaller e f) (smaller e g) (smaller e h) (smaller e i) (smaller e j)
    (smaller e k) (smaller e l) (smaller e m) (smaller e n) (smaller e o) (smaller e p) (smaller e q) (smaller e r) (smaller e s) (smaller e t)

    (smaller f g) (smaller f h) (smaller f i) (smaller f j)
    (smaller f k) (smaller f l) (smaller f m) (smaller f n) (smaller f o) (smaller f p) (smaller f q) (smaller f r) (smaller f s) (smaller f t)

    (smaller g h) (smaller g i) (smaller g j)
    (smaller g k) (smaller g l) (smaller g m) (smaller g n) (smaller g o) (smaller g p) (smaller g q) (smaller g r) (smaller g s) (smaller g t)

    (smaller h i) (smaller h j)
    (smaller h k) (smaller h l) (smaller h m) (smaller h n) (smaller h o) (smaller h p) (smaller h q) (smaller h r) (smaller h s) (smaller h t)

    (smaller i j)
    (smaller i k) (smaller i l) (smaller i m) (smaller i n) (smaller i o) (smaller i p) (smaller i q) (smaller i r) (smaller i s) (smaller i t)

    (smaller j k) (smaller j l) (smaller j m) (smaller j n) (smaller j o) (smaller j p) (smaller j q) (smaller j r) (smaller j s) (smaller j t)

    (smaller k l) (smaller k m) (smaller k n) (smaller k o) (smaller k p) (smaller k q) (smaller k r) (smaller k s) (smaller k t)

    (smaller l m) (smaller l n) (smaller l o) (smaller l p) (smaller l q) (smaller l r) (smaller l s) (smaller l t)

    (smaller m n) (smaller m o) (smaller m p) (smaller m q) (smaller m r) (smaller m s) (smaller m t)

    (smaller n o) (smaller n p) (smaller n q) (smaller n r) (smaller n s) (smaller n t)

    (smaller o p) (smaller o q) (smaller o r) (smaller o s) (smaller o t)

    (smaller p q) (smaller p r) (smaller p s) (smaller p t)

    (smaller q r) (smaller q s) (smaller q t)

    (smaller r s) (smaller r t)

    (smaller s t)

    ; allow placing any disk on any empty peg (treat pegs as "largest")
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
    (smaller p left) (smaller p middle) (smaller p right)
    (smaller q left) (smaller q middle) (smaller q right)
    (smaller r left) (smaller r middle) (smaller r right)
    (smaller s left) (smaller s middle) (smaller s right)
    (smaller t left) (smaller t middle) (smaller t right)
  )

  (:goal
    (and
      ; C on middle
      (on c middle)

      ; left peg has: a on b on d on e on ... on t, and t on left
      (on a b)
      (on b d)
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

      ; right empty
      (clear right)
    )
  )
)