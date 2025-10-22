(define (problem Blocksworld10Instance5_sequence_check)
  (:domain blocksworld-sequence)

  (:objects
    robot1 robot2 orchestrator - agent
    A B C D E F G H - block
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10 - step
  )

  (:init
    ; initial "on" relations as given
    (on A G)
    (on B D)
    (on C H)
    (ontable D)
    (ontable E)
    (on F E)
    (on G F)
    (ontable H)

    ; initial clear blocks (top blocks)
    (clear A)
    (clear B)
    (clear C)

    ; agents start with empty hands
    (handempty robot1)
    (handempty robot2)

    ; manipulation capabilities as specified
    (can-manipulate robot1 A)
    (can-manipulate robot1 C)
    (can-manipulate robot1 G)
    (can-manipulate robot1 H)

    (can-manipulate robot2 B)
    (can-manipulate robot2 D)
    (can-manipulate robot2 E)
    (can-manipulate robot2 F)

    ; sequence initial step marker
    (at-step step0)
  )

  ; The goal is to reach the end of the prescribed sequence (step10).
  ; The final block arrangement is not directly stated in the goal: it is the
  ; implicit effect of successfully applying the entire sequence of actions.
  (:goal (and
    (at-step step10)
  ))
)