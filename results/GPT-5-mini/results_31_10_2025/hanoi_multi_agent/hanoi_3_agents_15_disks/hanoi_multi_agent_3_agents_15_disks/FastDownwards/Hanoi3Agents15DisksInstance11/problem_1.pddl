(define (problem Hanoi3Agents15DisksInstance11)
  (:domain hanoi3agents15)

  (:objects
    ;; disks a..o (a smallest, o largest)
    a b c d e f g h i j k l m n o - disk
    left middle right - peg
  )

  (:init
    ;; initial support chain (top -> bottom): a b c d e f g h i j k l m n o
    ;; supported(disk, object_below)
    (supported a b)
    (supported b c)
    (supported c d)
    (supported d e)
    (supported e f)
    (supported f g)
    (supported g h)
    (supported h i)
    (supported i j)
    (supported j k)
    (supported k l)
    (supported l m)
    (supported m n)
    (supported n o)
    (supported o left)  ;; largest disk o directly on left peg

    ;; peg emptiness
    (empty middle)
    (empty right)
    ;; left not empty (we won't assert (not (empty left)) as a predicate, empty only used for middle/right here)

    ;; size facts (smaller x y) for all x smaller than y:
    ;; a < b < c < d < e < f < g < h < i < j < k < l < m < n < o
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

  ;; Goal: left peg top->bottom begins with a above d (a on d), middle has b, right has c.
  ;; We express this by requiring the direct-support relations that correspond
  ;; to the requested final ordering for the three small disks.
  (:goal (and
    (supported a d)
    (supported b middle)
    (supported c right)
  ))
)