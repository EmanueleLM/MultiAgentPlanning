(define (problem hanoi-4-right-to-middle)
  (:domain hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - step
  )
  (:init
    ;; initial stack on right from top to bottom: a,b,c,d
    (on a b)
    (on b c)
    (on c d)
    (on d right)

    ;; clear means "no disk is on this place"
    (clear a)
    (clear left)
    (clear middle)
    ;; b,c,d,right are not clear initially (implicitly)

    ;; size ordering (a smallest, d largest)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    ;; stage ordering for single-move-at-a-time, 16 stages for 15 moves
    (next stage0 stage1) (next stage1 stage2) (next stage2 stage3) (next stage3 stage4)
    (next stage4 stage5) (next stage5 stage6) (next stage6 stage7) (next stage7 stage8)
    (next stage8 stage9) (next stage9 stage10) (next stage10 stage11) (next stage11 stage12)
    (next stage12 stage13) (next stage13 stage14) (next stage14 stage15)

    (current stage0)
  )
  (:goal (and
    ;; desired stack on middle from top to bottom: a,b,c,d
    (on a b)
    (on b c)
    (on c d)
    (on d middle)

    ;; left and right must be empty (no disk on them)
    (not (on a left)) (not (on b left)) (not (on c left)) (not (on d left))
    (not (on a right)) (not (on b right)) (not (on c right)) (not (on d right))

    ;; finish at final stage
    (current stage15)
  ))
)