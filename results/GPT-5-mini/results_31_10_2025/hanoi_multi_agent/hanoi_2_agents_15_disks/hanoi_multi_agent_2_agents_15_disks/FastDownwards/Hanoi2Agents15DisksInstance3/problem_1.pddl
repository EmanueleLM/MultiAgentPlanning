(define (problem Hanoi2Agents15DisksInstance3)
  (:domain tower-of-hanoi-2agents)
  (:objects
    a b c d e f g h i j k l m n o - disk
    pegleft pegmiddle pegright - peg
  )

  (:init
    ;; initial stack on pegleft from top (a) to bottom (o): a on b on c ... on o on pegleft
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
    (on o pegleft)

    ;; clear: only the top disk and the empty pegs are clear
    (clear a)
    (clear pegmiddle)
    (clear pegright)

    ;; agent permissions
    (allowed1 a) (allowed1 b) (allowed1 c) (allowed1 d) (allowed1 e)
    (allowed1 f) (allowed1 g) (allowed1 h)
    (allowed2 i) (allowed2 j) (allowed2 k) (allowed2 l) (allowed2 m)
    (allowed2 n) (allowed2 o)

    ;; static size ordering: a < b < c < ... < o
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
    ;; left peg final stack top->bottom: f g h i j k l m n o
    (on f pegleft)
    (on g f)
    (on h g)
    (on i h)
    (on j i)
    (on k j)
    (on l k)
    (on m l)
    (on n m)
    (on o n)

    ;; middle peg final stack top->bottom: c d
    (on c d)
    (on d pegmiddle)

    ;; right peg final stack top->bottom: a b e
    (on a b)
    (on b e)
    (on e pegright)
  ))
)