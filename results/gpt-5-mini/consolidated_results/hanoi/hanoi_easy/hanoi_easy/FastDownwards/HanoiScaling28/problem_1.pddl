(define (problem hanoi-4-right-to-middle)
  (:domain hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - step
  )
  (:init
    (on a b)
    (on b c)
    (on c d)
    (on d right)

    (clear a)
    (clear left)
    (clear middle)

    (can-place a left) (can-place a middle) (can-place a right)
    (can-place b left) (can-place b middle) (can-place b right)
    (can-place c left) (can-place c middle) (can-place c right)
    (can-place d left) (can-place d middle) (can-place d right)

    (can-place a b) (can-place a c) (can-place a d)
    (can-place b c) (can-place b d)
    (can-place c d)

    (next stage0 stage1) (next stage1 stage2) (next stage2 stage3) (next stage3 stage4)
    (next stage4 stage5) (next stage5 stage6) (next stage6 stage7) (next stage7 stage8)
    (next stage8 stage9) (next stage9 stage10) (next stage10 stage11) (next stage11 stage12)
    (next stage12 stage13) (next stage13 stage14) (next stage14 stage15)

    (current stage0)
  )
  (:goal (and
    (on d middle)
    (on c d)
    (on b c)
    (on a b)
    (current stage15)
    (not (on a left)) (not (on b left)) (not (on c left)) (not (on d left))
    (not (on a right)) (not (on b right)) (not (on c right)) (not (on d right))
  ))
)