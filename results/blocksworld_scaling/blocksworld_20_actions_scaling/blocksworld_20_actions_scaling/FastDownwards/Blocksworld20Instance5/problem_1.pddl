(define (problem blocksworld20instance5)
  (:domain blocksworld-multi-agent-sequence)
  (:objects
    A B C D E F G H - block
    agent1 agent2 - agent
    step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20 step21 - step
  )

  (:init
    ;; initial stacks: [C, E, A, B] with B on table
    (on A B)
    (on E A)
    (on C E)
    (ontable B)

    ;; other stack: [H, D, G, F] with F on table
    (on D G)
    (on G F)
    (on H D)
    (ontable F)

    ;; clear tops initially
    (clear C)
    (clear H)

    ;; hands empty
    (handempty agent1)
    (handempty agent2)

    ;; starting step
    (current-step step1)
  )

  ;; Goal: complete the full provided ordered sequence (reach step21).
  (:goal (and (current-step step21)))
)