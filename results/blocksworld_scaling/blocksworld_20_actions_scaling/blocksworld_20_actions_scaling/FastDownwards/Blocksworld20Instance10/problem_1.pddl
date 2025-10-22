(define (problem blocks-sequenced-run)
  (:domain blocks-multiagent-sequenced)

  (:objects
    A B C D E F G H I J - block
    agent1 agent2 - agent

    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9 step10
    step11 step12 step13 step14 step15 step16 step17 step18 step19 step20 - step
  )

  (:init
    ;; Initial block configuration (as given)
    (ontable A)
    (on E A)
    (on G E)
    (on F G)
    (on B F)
    (on J B)

    (ontable H)
    (on D H)
    (on C D)
    (on I C)

    ;; Initially clear tops
    (clear J)
    (clear I)

    ;; Agents are available and have empty hands initially
    (handempty agent1)
    (handempty agent2)

    ;; Step control: start at step0
    (at-step step0)

    ;; step successor relations to force sequential progression
    (next step0 step1)
    (next step1 step2)
    (next step2 step3)
    (next step3 step4)
    (next step4 step5)
    (next step5 step6)
    (next step6 step7)
    (next step7 step8)
    (next step8 step9)
    (next step9 step10)
    (next step10 step11)
    (next step11 step12)
    (next step12 step13)
    (next step13 step14)
    (next step14 step15)
    (next step15 step16)
    (next step16 step17)
    (next step17 step18)
    (next step18 step19)
    (next step19 step20)

    ;; Scheduled (step-by-step) actions: each scheduled-... ties an exact action
    ;; Format: scheduled-<type> <step> <agent> <block-x> <block-y>
    ;; For putdown we use the fourth argument as a dummy (we repeat the block).

    ;; 1. unstack(J, B) by agent1 at step0
    (scheduled-unstack step0 agent1 J B)
    ;; 2. stack(J, I) by agent1 at step1
    (scheduled-stack   step1 agent1 J I)
    ;; 3. unstack(J, I) by agent1 at step2
    (scheduled-unstack step2 agent1 J I)
    ;; 4. stack(J, B) by agent1 at step3
    (scheduled-stack   step3 agent1 J B)
    ;; 5. unstack(J, B) by agent1 at step4
    (scheduled-unstack step4 agent1 J B)
    ;; 6. stack(J, I) by agent1 at step5
    (scheduled-stack   step5 agent1 J I)
    ;; 7. unstack(J, I) by agent1 at step6
    (scheduled-unstack step6 agent1 J I)
    ;; 8. stack(J, I) by agent1 at step7
    (scheduled-stack   step7 agent1 J I)

    ;; 9. unstack(B, F) by agent2 at step8
    (scheduled-unstack step8 agent2 B F)
    ;; 10. stack(B, J) by agent2 at step9
    (scheduled-stack   step9 agent2 B J)
    ;; 11. unstack(B, J) by agent2 at step10
    (scheduled-unstack step10 agent2 B J)
    ;; 12. putdown(B) by agent2 at step11
    (scheduled-putdown step11 agent2 B B)

    ;; 13. unstack(J, I) by agent2 at step12
    (scheduled-unstack step12 agent2 J I)
    ;; 14. putdown(J) by agent2 at step13
    (scheduled-putdown step13 agent2 J J)

    ;; 15. unstack(F, G) by agent2 at step14
    (scheduled-unstack step14 agent2 F G)
    ;; 16. stack(F, J) by agent2 at step15
    (scheduled-stack   step15 agent2 F J)
    ;; 17. unstack(F, J) by agent2 at step16
    (scheduled-unstack step16 agent2 F J)
    ;; 18. stack(F, B) by agent2 at step17
    (scheduled-stack   step17 agent2 F B)

    ;; 19. unstack(I, C) by agent2 at step18
    (scheduled-unstack step18 agent2 I C)
    ;; 20. stack(I, G) by agent2 at step19
    (scheduled-stack   step19 agent2 I G)
  )

  ;; Goal: reach the final step after executing the entire scheduled sequence.
  ;; The sequential constraints and scheduled facts force the planner to carry out
  ;; the listed actions in order to reach step20; the goal does not explicitly
  ;; restate the final block arrangement, but achieving step20 is only possible
  ;; by performing the exact scheduled steps in sequence.
  (:goal (and
    (at-step step20)
  ))
)