(define (problem hanoi-5-problem)
  (:domain hanoi-5)
  (:objects
    a b c d e - disk
    left middle right - peg
    ;; 32 stages: stage0 .. stage31 to permit exactly 31 moves
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7
    stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15
    stage16 stage17 stage18 stage19 stage20 stage21 stage22 stage23
    stage24 stage25 stage26 stage27 stage28 stage29 stage30 stage31 - stage
  )

  (:init
    ;; initial stack on left: top-to-bottom a, b, c, d, e
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e left)

    ;; only the topmost disk and empty pegs are clear initially
    (clear-disk a)
    (clear-peg middle)
    (clear-peg right)

    ;; disk size ordering (a smallest, e largest)
    (smaller a b) (smaller a c) (smaller a d) (smaller a e)
    (smaller b c) (smaller b d) (smaller b e)
    (smaller c d) (smaller c e)
    (smaller d e)

    ;; explicit ordered stages to enforce contiguous single-step progression
    (succ stage0 stage1)   (succ stage1 stage2)   (succ stage2 stage3)
    (succ stage3 stage4)   (succ stage4 stage5)   (succ stage5 stage6)
    (succ stage6 stage7)   (succ stage7 stage8)   (succ stage8 stage9)
    (succ stage9 stage10)  (succ stage10 stage11) (succ stage11 stage12)
    (succ stage12 stage13) (succ stage13 stage14) (succ stage14 stage15)
    (succ stage15 stage16) (succ stage16 stage17) (succ stage17 stage18)
    (succ stage18 stage19) (succ stage19 stage20) (succ stage20 stage21)
    (succ stage21 stage22) (succ stage22 stage23) (succ stage23 stage24)
    (succ stage24 stage25) (succ stage25 stage26) (succ stage26 stage27)
    (succ stage27 stage28) (succ stage28 stage29) (succ stage29 stage30)
    (succ stage30 stage31)

    (current stage0)
  )

  (:goal (and
    ;; goal: full tower (a..e top-to-bottom) on right peg, left and middle empty,
    ;; and plan progressed to final stage (exactly 31 moves)
    (on-disk a b)
    (on-disk b c)
    (on-disk c d)
    (on-disk d e)
    (on-peg e right)
    (clear-peg left)
    (clear-peg middle)
    (current stage31)
  ))