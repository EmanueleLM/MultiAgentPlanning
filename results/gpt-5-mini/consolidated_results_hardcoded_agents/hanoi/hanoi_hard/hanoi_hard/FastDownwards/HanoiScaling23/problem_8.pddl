(define (problem hanoi6)
  (:domain hanoi)
  (:objects
    a b c d e f - disk
    left middle right - peg
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19 s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37 s38 s39 s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 s53 s54 s55 s56 s57 s58 s59 s60 s61 s62 s63 - stage
  )

  (:init
    ;; Initial tower on left: f bottom ... a top (direct-on relations)
    (on f left)
    (on e f)
    (on d e)
    (on c d)
    (on b c)
    (on a b)

    ;; Only the top disk a is clear; pegs middle and right are empty (clear)
    (clear a)
    (clear middle)
    (clear right)

    ;; Start at stage s0
    (current s0)

    ;; Successor chain providing explicit discrete time progression for exactly 63 moves (s0 -> s63)
    (next s0 s1) (next s1 s2) (next s2 s3) (next s3 s4) (next s4 s5) (next s5 s6) (next s6 s7) (next s7 s8)
    (next s8 s9) (next s9 s10) (next s10 s11) (next s11 s12) (next s12 s13) (next s13 s14) (next s14 s15) (next s15 s16)
    (next s16 s17) (next s17 s18) (next s18 s19) (next s19 s20) (next s20 s21) (next s21 s22) (next s22 s23) (next s23 s24)
    (next s24 s25) (next s25 s26) (next s26 s27) (next s27 s28) (next s28 s29) (next s29 s30) (next s30 s31) (next s31 s32)
    (next s32 s33) (next s33 s34) (next s34 s35) (next s35 s36) (next s36 s37) (next s37 s38) (next s38 s39) (next s39 s40)
    (next s40 s41) (next s41 s42) (next s42 s43) (next s43 s44) (next s44 s45) (next s45 s46) (next s46 s47) (next s47 s48)
    (next s48 s49) (next s49 s50) (next s50 s51) (next s51 s52) (next s52 s53) (next s53 s54) (next s54 s55) (next s55 s56)
    (next s56 s57) (next s57 s58) (next s58 s59) (next s59 s60) (next s60 s61) (next s61 s62) (next s62 s63)

    ;; Distinctness facts for supports (disks and pegs) - explicit different pairs
    (different a b) (different a c) (different a d) (different a e) (different a f) (different a left) (different a middle) (different a right)
    (different b a) (different b c) (different b d) (different b e) (different b f) (different b left) (different b middle) (different b right)
    (different c a) (different c b) (different c d) (different c e) (different c f) (different c left) (different c middle) (different c right)
    (different d a) (different d b) (different d c) (different d e) (different d f) (different d left) (different d middle) (different d right)
    (different e a) (different e b) (different e c) (different e d) (different e f) (different e left) (different e middle) (different e right)
    (different f a) (different f b) (different f c) (different f d) (different f e) (different f left) (different f middle) (different f right)
    (different left a) (different left b) (different left c) (different left d) (different left e) (different left f) (different left middle) (different left right)
    (different middle a) (different middle b) (different middle c) (different middle d) (different middle e) (different middle f) (different middle left) (different middle right)
    (different right a) (different right b) (different right c) (different right d) (different right e) (different right f) (different right left) (different right middle)

    ;; Size relations: strictly smaller relations (a smallest, f largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)
  )

  (:goal (and
    ;; Entire tower reassembled on right with same ordering: f bottom ... a top
    (on f right)
    (on e f)
    (on d e)
    (on c d)
    (on b c)
    (on a b)

    ;; Left and middle pegs empty (middle must be empty per specification)
    (clear left)
    (clear middle)

    ;; Terminal condition: exactly 63 moves consumed, reaching final stage s63
    (current s63)
  ))
)