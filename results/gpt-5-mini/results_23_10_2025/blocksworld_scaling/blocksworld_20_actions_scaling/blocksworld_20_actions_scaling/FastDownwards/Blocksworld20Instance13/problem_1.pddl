(define (problem Blocksworld-Sequence-Instance)
  (:domain blocks-world-multiagent-sequence)

  (:objects
    A B C D E F G H I J - block
    mover_alpha mover_beta orchestrator - agent
    ;; step objects: step0 initial -> step20 final
    step0 step1 step2 step3 step4 step5 step6 step7 step8 step9
    step10 step11 step12 step13 step14 step15 step16 step17 step18 step19 step20 - step
  )

  (:init
    ;; Initial block configuration (from the specification)
    (on A F)
    (on J A)
    (on H J)
    (on D B)
    (on I D)
    (on C G)
    (on E C)

    (ontable F)
    (ontable B)
    (ontable G)

    ;; top-clear blocks at start
    (clear H)
    (clear I)
    (clear E)

    ;; agent hands free at start
    (freehand mover_alpha)
    (freehand mover_beta)
    (freehand orchestrator)

    ;; sequence control: beginning at step0
    (cur-step step0)

    ;; which agent is allowed to execute which step (can-do)
    ;; Map each required step to the agent responsible (derived from responsibilities)
    ;; Steps numbering: action1 consumes step0 -> produces step1, etc.
    (can-do mover_beta step0)   ;; 1. unstack(H, J)
    (can-do mover_beta step1)   ;; 2. stack(H, I)
    (can-do mover_beta step2)   ;; 3. unstack(J, A)
    (can-do mover_beta step3)   ;; 4. stack(J, E)
    (can-do mover_alpha step4)  ;; 5. unstack(A, F)
    (can-do mover_alpha step5)  ;; 6. putdown(A)
    (can-do mover_alpha step6)  ;; 7. pickup(A)
    (can-do mover_alpha step7)  ;; 8. stack(A, H)
    (can-do mover_beta step8)   ;; 9. unstack(J, E)
    (can-do mover_beta step9)   ;;10. putdown(J)
    (can-do mover_beta step10)  ;;11. pickup(F)
    (can-do mover_beta step11)  ;;12. stack(F, A)
    (can-do mover_beta step12)  ;;13. unstack(F, A)
    (can-do mover_beta step13)  ;;14. stack(F, A)
    (can-do mover_beta step14)  ;;15. pickup(J)
    (can-do mover_beta step15)  ;;16. putdown(J)
    (can-do mover_beta step16)  ;;17. pickup(J)
    (can-do mover_beta step17)  ;;18. putdown(J)
    (can-do mover_alpha step18) ;;19. unstack(E, C)
    (can-do mover_alpha step19) ;;20. stack(E, J)

    ;; Expectations lock each step to the exact intended operation and operands.
    ;; Each expect predicate has the form (expect-<op> stepCurrent operands stepNext)
    (expect-unstack step0 H J step1)
    (expect-stack   step1 H I step2)
    (expect-unstack step2 J A step3)
    (expect-stack   step3 J E step4)
    (expect-unstack step4 A F step5)
    (expect-putdown step5 A step6)
    (expect-pickup  step6 A step7)
    (expect-stack   step7 A H step8)
    (expect-unstack step8 J E step9)
    (expect-putdown step9 J step10)
    (expect-pickup  step10 F step11)
    (expect-stack   step11 F A step12)
    (expect-unstack step12 F A step13)
    (expect-stack   step13 F A step14)
    (expect-pickup  step14 J step15)
    (expect-putdown step15 J step16)
    (expect-pickup  step16 J step17)
    (expect-putdown step17 J step18)
    (expect-unstack step18 E C step19)
    (expect-stack   step19 E J step20)
  )

  ;; Goal: successful completion of the entire scripted sequence (reach step20)
  ;; Note: the final block arrangement is not stated as the goal; the goal is to confirm
  ;; that the exact action sequence can be executed to produce its resulting state.
  (:goal (and (cur-step step20)))
)