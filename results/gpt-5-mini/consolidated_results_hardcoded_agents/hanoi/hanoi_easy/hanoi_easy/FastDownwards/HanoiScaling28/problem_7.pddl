(define (problem hanoi-4-right-to-middle)
  (:domain hanoi)
  (:objects
    a b c d - disk
    left middle right - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - step
  )
  (:init
    ;; initial stack on right from top to bottom: a, b, c, d (direct-on relations)
    (on a b)
    (on b c)
    (on c d)
    (on d right)

    ;; top-ness and empty pegs initially
    (clear a)
    (clear left)
    (clear middle)

    ;; static size ordering (a smallest, d largest)
    (smaller a b) (smaller a c) (smaller a d)
    (smaller b c) (smaller b d)
    (smaller c d)

    ;; stage ordering for single-move-at-a-time: 16 stages for 15 moves
    (next stage0 stage1) (next stage1 stage2) (next stage2 stage3) (next stage3 stage4)
    (next stage4 stage5) (next stage5 stage6) (next stage6 stage7) (next stage7 stage8)
    (next stage8 stage9) (next stage9 stage10) (next stage10 stage11) (next stage11 stage12)
    (next stage12 stage13) (next stage13 stage14) (next stage14 stage15)

    (current stage0)

    ;; explicit inequality facts between all distinct supports (disks and pegs)
    ;; supports: a b c d left middle right
    (different a b) (different a c) (different a d) (different a left) (different a middle) (different a right)
    (different b a) (different b c) (different b d) (different b left) (different b middle) (different b right)
    (different c a) (different c b) (different c d) (different c left) (different c middle) (different c right)
    (different d a) (different d b) (different d c) (different d left) (different d middle) (different d right)
    (different left a) (different left b) (different left c) (different left d) (different left middle) (different left right)
    (different middle a) (different middle b) (different middle c) (different middle d) (different middle left) (different middle right)
    (different right a) (different right b) (different right c) (different right d) (different right left) (different right middle)
  )
  (:goal (and
    ;; desired stack on middle from top to bottom: a, b, c, d (direct-on relations)
    (on a b)
    (on b c)
    (on c d)
    (on d middle)

    ;; left and right must be empty (no disk directly on them)
    (clear left)
    (clear right)

    ;; finish at final stage
    (current stage15)
  ))
)