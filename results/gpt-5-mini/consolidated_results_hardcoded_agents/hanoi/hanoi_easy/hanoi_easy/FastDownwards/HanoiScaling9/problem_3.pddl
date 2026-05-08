(define (problem hanoi4)
  (:domain hanoi)
  (:objects
    A B C D - disk
    left middle right - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
  )

  (:init
    (stage stage0) (stage stage1) (stage stage2) (stage stage3)
    (stage stage4) (stage stage5) (stage stage6) (stage stage7)
    (stage stage8) (stage stage9) (stage stage10) (stage stage11)
    (stage stage12) (stage stage13) (stage stage14) (stage stage15)

    (next stage0 stage1) (next stage1 stage2) (next stage2 stage3) (next stage3 stage4)
    (next stage4 stage5) (next stage5 stage6) (next stage6 stage7) (next stage7 stage8)
    (next stage8 stage9) (next stage9 stage10) (next stage10 stage11) (next stage11 stage12)
    (next stage12 stage13) (next stage13 stage14) (next stage14 stage15)

    (at-stage stage0)

    (on A B)
    (on B C)
    (on C D)
    (on D middle)
    (top A middle)

    (empty left)
    (empty right)

    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)
  )

  (:goal (and
    (on A B)
    (on B C)
    (on C D)
    (on D right)
    (top A right)

    (empty left)
    (empty middle)

    (at-stage stage15)
  ))
)