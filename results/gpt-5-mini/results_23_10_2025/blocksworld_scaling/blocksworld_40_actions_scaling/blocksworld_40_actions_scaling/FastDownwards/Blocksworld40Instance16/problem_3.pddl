(define (problem blocks-multiagent-ordered-sequence-problem)
  (:domain blocks-multiagent-ordered-sequence)
  (:objects
    A B C D E F G H I J K - block
    worker - agent
  )

  (:init
    (on A I)
    (on B J)
    (ontable C)
    (on D K)
    (ontable E)
    (on F B)
    (on G E)
    (on H A)
    (ontable I)
    (on J C)
    (on K H)

    (clear D)
    (clear F)
    (clear G)

    (handempty worker)

    (step0_done)
  )

  (:goal (and
    (step1_done) (step2_done) (step3_done) (step4_done) (step5_done)
    (step6_done) (step7_done) (step8_done) (step9_done) (step10_done)
    (step11_done) (step12_done) (step13_done) (step14_done) (step15_done)
    (step16_done) (step17_done) (step18_done) (step19_done) (step20_done)
    (step21_done) (step22_done) (step23_done) (step24_done) (step25_done)
    (step26_done) (step27_done) (step28_done) (step29_done) (step30_done)
    (step31_done) (step32_done) (step33_done) (step34_done) (step35_done)
    (step36_done) (step37_done) (step38_done) (step39_done) (step40_done)
  ))
)