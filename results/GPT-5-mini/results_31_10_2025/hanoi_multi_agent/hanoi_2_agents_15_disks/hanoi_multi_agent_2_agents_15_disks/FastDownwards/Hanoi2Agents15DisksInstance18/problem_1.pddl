(define (problem hanoi2-15-instance18) (:domain hanoi-2agents-15)
  (:objects
    a b c d e f g h i j k l m n o - disk
    left middle right - peg
  )

  (:init
    ;; initial stack top-to-bottom: a b c d e f g h i j k l m n o on left
    ;; Representation: top disk is on the disk below; bottom-most (o) is on the left peg.
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

    ;; clear predicates: only topmost disk a is clear; middle and right pegs are empty
    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    ;; agent capabilities
    (agent1-can a) (agent1-can b) (agent1-can c) (agent1-can d)
    (agent1-can e) (agent1-can f) (agent1-can g) (agent1-can h)

    (agent2-can i) (agent2-can j) (agent2-can k) (agent2-can l)
    (agent2-can m) (agent2-can n) (agent2-can o)

    ;; size ordering (smaller x y) true when x is strictly smaller than y
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

  (:goal (and
    ;; Left peg must contain from top->bottom: d e f g h i j k l m n o
    ;; expressed as direct on-disk/on-peg relations:
    (on-disk d e) (on-disk e f) (on-disk f g) (on-disk g h) (on-disk h i) (on-disk i j) (on-disk j k) (on-disk k l) (on-disk l m) (on-disk m n) (on-disk n o) (on-peg o left)

    ;; Middle peg must be empty (no disk on it) => clear
    (clear-peg middle)

    ;; Right peg must contain top->bottom: a b c (so a on b, b on c, c on peg right)
    (on-disk a b) (on-disk b c) (on-peg c right)
  ))
)