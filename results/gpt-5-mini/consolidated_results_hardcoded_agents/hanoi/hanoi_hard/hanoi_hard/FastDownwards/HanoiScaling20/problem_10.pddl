(define (problem hanoi-6)
  (:domain hanoi)
  (:objects
    a b c d e f - disk
    left middle right - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7
    stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15
    stage16 stage17 stage18 stage19 stage20 stage21 stage22 stage23
    stage24 stage25 stage26 stage27 stage28 stage29 stage30 stage31
    stage32 stage33 stage34 stage35 stage36 stage37 stage38 stage39
    stage40 stage41 stage42 stage43 stage44 stage45 stage46 stage47
    stage48 stage49 stage50 stage51 stage52 stage53 stage54 stage55
    stage56 stage57 stage58 stage59 stage60 stage61 stage62 stage63 - stage
  )
  (:init
    ;; Initial stack on the right peg: top-to-bottom a,b,c,d,e,f (a is smallest)
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-peg f right)

    ;; top and emptiness facts
    (top right a)
    (empty left)
    (empty middle)

    ;; Static size ordering (smaller x y means x is strictly smaller than y)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e) (smaller a f)
    (smaller b c) (smaller b d) (smaller b e) (smaller b f)
    (smaller c d) (smaller c e) (smaller c f)
    (smaller d e) (smaller d f)
    (smaller e f)

    ;; Stage chain (contiguous discrete time). Start at stage0; goal requires reaching stage63.
    (succ stage0 stage1) (succ stage1 stage2) (succ stage2 stage3) (succ stage3 stage4)
    (succ stage4 stage5) (succ stage5 stage6) (succ stage6 stage7) (succ stage7 stage8)
    (succ stage8 stage9) (succ stage9 stage10) (succ stage10 stage11) (succ stage11 stage12)
    (succ stage12 stage13) (succ stage13 stage14) (succ stage14 stage15) (succ stage15 stage16)
    (succ stage16 stage17) (succ stage17 stage18) (succ stage18 stage19) (succ stage19 stage20)
    (succ stage20 stage21) (succ stage21 stage22) (succ stage22 stage23) (succ stage23 stage24)
    (succ stage24 stage25) (succ stage25 stage26) (succ stage26 stage27) (succ stage27 stage28)
    (succ stage28 stage29) (succ stage29 stage30) (succ stage30 stage31) (succ stage31 stage32)
    (succ stage32 stage33) (succ stage33 stage34) (succ stage34 stage35) (succ stage35 stage36)
    (succ stage36 stage37) (succ stage37 stage38) (succ stage38 stage39) (succ stage39 stage40)
    (succ stage40 stage41) (succ stage41 stage42) (succ stage42 stage43) (succ stage43 stage44)
    (succ stage44 stage45) (succ stage45 stage46) (succ stage46 stage47) (succ stage47 stage48)
    (succ stage48 stage49) (succ stage49 stage50) (succ stage50 stage51) (succ stage51 stage52)
    (succ stage52 stage53) (succ stage53 stage54) (succ stage54 stage55) (succ stage55 stage56)
    (succ stage56 stage57) (succ stage57 stage58) (succ stage58 stage59) (succ stage59 stage60)
    (succ stage60 stage61) (succ stage61 stage62) (succ stage62 stage63)

    (at-stage stage0)

    ;; Explicit distinct peg pairs
    (different left middle) (different left right)
    (different middle left) (different middle right)
    (different right left) (different right middle)
  )

  (:goal (and
    ;; final stack on middle peg: top-to-bottom a,b,c,d,e,f
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-disk e f)
    (on-peg f middle)
    (top middle a)

    ;; left and right must be empty at the end
    (empty left)
    (empty right)

    ;; must reach final stage after 63 moves
    (at-stage stage63)
  ))
)