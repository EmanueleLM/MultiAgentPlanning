(define (problem hanoi-4-middle-to-left)
  (:domain hanoi)
  (:objects
    diskA diskB diskC diskD - disk
    peg-left peg-middle peg-right - peg
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 stage11 stage12 stage13 stage14 stage15 - stage
    ;; declare places explicitly (pegs and disks will be used as places in predicates)
    diskA_place diskB_place diskC_place diskD_place peg-left_place peg-middle_place peg-right_place - place
  )

  (:init
    ;; Map typed place objects to the place predicates by introducing equivalence facts.
    ;; We will use the actual disk and peg symbols in the on/clear predicates below,
    ;; therefore include no extra typing axioms here. (The problem uses disk and peg objects directly.)

    ;; initial stack on middle peg (bottom to top): diskD, diskC, diskB, diskA
    (on diskD peg-middle)
    (on diskC diskD)
    (on diskB diskC)
    (on diskA diskB)

    ;; only the topmost disk and the two empty pegs are clear initially
    (clear diskA)
    (clear peg-left)
    (clear peg-right)

    ;; stage progression: start at stage0
    (current stage0)
    (succ stage0 stage1) (succ stage1 stage2) (succ stage2 stage3) (succ stage3 stage4)
    (succ stage4 stage5) (succ stage5 stage6) (succ stage6 stage7) (succ stage7 stage8)
    (succ stage8 stage9) (succ stage9 stage10) (succ stage10 stage11) (succ stage11 stage12)
    (succ stage12 stage13) (succ stage13 stage14) (succ stage14 stage15)

    ;; disk size ordering (static)
    (smaller diskA diskB) (smaller diskA diskC) (smaller diskA diskD)
    (smaller diskB diskC) (smaller diskB diskD)
    (smaller diskC diskD)
  )

  (:goal (and
    ;; require reaching stage15 (minimal solution for 4 disks is 15 moves)
    (current stage15)

    ;; all disks stacked on the left peg (bottom to top: diskD,diskC,diskB,diskA)
    (on diskD peg-left)
    (on diskC diskD)
    (on diskB diskC)
    (on diskA diskB)

    ;; middle and right pegs empty
    (clear peg-middle)
    (clear peg-right)
  ))
)