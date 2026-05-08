(define (problem hanoi_5_disks)
  (:domain hanoi)
  (:objects
    A B C D E left middle right - place
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9
    stage10 stage11 stage12 stage13 stage14 stage15 stage16 stage17 stage18 stage19
    stage20 stage21 stage22 stage23 stage24 stage25 stage26 stage27 stage28 stage29
    stage30 stage31 - stage
  )

  (:init
    ;; classify disks and pegs
    (disk A) (disk B) (disk C) (disk D) (disk E)
    (peg left) (peg middle) (peg right)

    ;; Size ordering (static facts)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E)
    (smaller B C) (smaller B D) (smaller B E)
    (smaller C D) (smaller C E)
    (smaller D E)

    ;; Initial stack on middle from top to bottom: A on B, B on C, C on D, D on E, E on middle
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E middle)

    ;; Clear/top facts true initially
    (clear A)
    (clear left)
    (clear right)

    ;; Stage successor chain for 31 moves (2^5 - 1 = 31)
    (succ stage0 stage1) (succ stage1 stage2) (succ stage2 stage3) (succ stage3 stage4)
    (succ stage4 stage5) (succ stage5 stage6) (succ stage6 stage7) (succ stage7 stage8)
    (succ stage8 stage9) (succ stage9 stage10) (succ stage10 stage11) (succ stage11 stage12)
    (succ stage12 stage13) (succ stage13 stage14) (succ stage14 stage15) (succ stage15 stage16)
    (succ stage16 stage17) (succ stage17 stage18) (succ stage18 stage19) (succ stage19 stage20)
    (succ stage20 stage21) (succ stage21 stage22) (succ stage22 stage23) (succ stage23 stage24)
    (succ stage24 stage25) (succ stage25 stage26) (succ stage26 stage27) (succ stage27 stage28)
    (succ stage28 stage29) (succ stage29 stage30) (succ stage30 stage31)

    ;; Start at initial stage
    (current stage0)
  )

  (:goal (and
    ;; Final stack on right from top to bottom: A on B, B on C, C on D, D on E, E on right
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E right)

    ;; left and middle must be empty at the end (no disk directly on them)
    (clear left)
    (clear middle)

    ;; require that exactly 31 moves were executed by enforcing final stage
    (current stage31)
  ))