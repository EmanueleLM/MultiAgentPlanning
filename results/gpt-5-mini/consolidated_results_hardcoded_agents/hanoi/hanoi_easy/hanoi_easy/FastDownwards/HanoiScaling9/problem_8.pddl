(define (problem hanoi4)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
  )

  (:init
    (is-stage stage0) (is-stage stage1) (is-stage stage2) (is-stage stage3)
    (is-stage stage4) (is-stage stage5) (is-stage stage6) (is-stage stage7)
    (is-stage stage8) (is-stage stage9) (is-stage stage10) (is-stage stage11)
    (is-stage stage12) (is-stage stage13) (is-stage stage14) (is-stage stage15)

    (succ stage0 stage1) (succ stage1 stage2) (succ stage2 stage3) (succ stage3 stage4)
    (succ stage4 stage5) (succ stage5 stage6) (succ stage6 stage7) (succ stage7 stage8)
    (succ stage8 stage9) (succ stage9 stage10) (succ stage10 stage11) (succ stage11 stage12)
    (succ stage12 stage13) (succ stage13 stage14) (succ stage14 stage15)

    (at-stage stage0)

    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D middle)
    (top A middle)

    (empty left)
    (empty right)

    (smaller A B) (smaller A C) (smaller A D)
    (smaller B C) (smaller B D)
    (smaller C D)

    (different left middle) (different left right)
    (different middle left) (different middle right)
    (different right left) (different right middle)
  )

  (:goal (and
    (on-disk A B)
    (on-disk B C)
    (on-disk C D)
    (on-peg D right)
    (top A right)

    (empty left)
    (empty middle)

    (at-stage stage15)
  ))