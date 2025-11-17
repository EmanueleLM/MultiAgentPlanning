(define (problem hanoi-2agents-15-Hanoi2Agents15DisksInstance12)
  (:domain two-agent-hanoi)
  (:objects
    a b c d e f g h i j k l m n o - disk
    left middle right - peg
  )
  (:init
    ; initial stack A..O on left (A smallest on top)
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

    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    ; agent permissions
    (a1disk a) (a1disk b) (a1disk c) (a1disk d)
    (a1disk e) (a1disk f) (a1disk g) (a1disk h)
    (a2disk i) (a2disk j) (a2disk k) (a2disk l)
    (a2disk m) (a2disk n) (a2disk o)

    ; size ordering: smaller(x,y) iff x is smaller than y
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
  (:goal
    (and
      ; goal stacks
      (on-disk a c)
      (on-disk c e)
      (on-peg e middle)

      (on-disk b d)
      (on-peg d right)

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

      ; optional: top disks are clear
      (clear-disk a)
      (clear-disk b)
      (clear-disk f)
    )
  )
)