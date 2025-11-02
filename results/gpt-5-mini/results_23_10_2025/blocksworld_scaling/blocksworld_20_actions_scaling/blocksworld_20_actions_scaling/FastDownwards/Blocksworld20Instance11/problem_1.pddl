(define (problem Blocksworld20Instance11)
  (:domain blocksworld-sequence)
  (:objects
    A B C D E F G H I J - block
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 step11 step12 step13 step14 step15 step16 step17 step18 step19 step20 - step
  )

  (:init
    ;; initial on/ontable relations
    (on G J)
    (on J C)
    (on C F)
    (on F H)
    (on H I)
    (ontable A)
    (ontable B)
    (ontable D)
    (ontable E)
    (ontable I)

    ;; clear top blocks initially
    (clear A)
    (clear B)
    (clear D)
    (clear E)
    (clear G)

    ;; hand empty and initial step
    (handempty)
    (step step0)
  )

  (:goal
    (and
      (step step20)
      ;; final arrangement to verify
      (ontable A)
      (on B E)
      (on C F)
      (ontable D)
      (on E A)
      (on F H)
      (on G D)
      (on H I)
      (ontable I)
      (on J C)
    )
  )
)