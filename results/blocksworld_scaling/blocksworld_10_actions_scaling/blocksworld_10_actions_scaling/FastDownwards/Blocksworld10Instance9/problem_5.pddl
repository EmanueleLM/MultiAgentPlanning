(define (problem Blocksworld10Instance9)
  (:domain blocksworld-sequence)
  (:objects
    A B C D E F G H             - block
    agent_a agent_b orchestrator - agent
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 - stage
    table0 - place
  )

  (:init
    ;; initial stacking
    (on A B)
    (on D A)
    (on C D)
    (on F C)
    (on E F)
    (on G H)

    ;; table placements
    (ontable B)
    (ontable H)

    ;; clear top blocks
    (clear E)
    (clear G)

    ;; agents initially free
    (handempty agent_a)
    (handempty agent_b)
    (handempty orchestrator)

    ;; stage control (enforce the fixed sequence of 10 actions)
    (at-stage stage0)

    (succ stage0 stage1)
    (succ stage1 stage2)
    (succ stage2 stage3)
    (succ stage3 stage4)
    (succ stage4 stage5)
    (succ stage5 stage6)
    (succ stage6 stage7)
    (succ stage7 stage8)
    (succ stage8 stage9)
    (succ stage9 stage10)

    ;; allowed moves: (stage, agent, block, destination)
    ;; agent_a executes the first four actions
    (allowed-move stage0 agent_a G H)      ;; 1. unstack(G,H)
    (allowed-move stage1 agent_a G table0) ;; 2. putdown(G)
    (allowed-move stage2 agent_a H table0) ;; 3. pickup(H)
    (allowed-move stage3 agent_a H G)      ;; 4. stack(H,G)

    ;; agent_b executes the last six actions
    (allowed-move stage4 agent_b H G)      ;; 5. unstack(H,G)
    (allowed-move stage5 agent_b H table0) ;; 6. putdown(H)
    (allowed-move stage6 agent_b G table0) ;; 7. pickup(G)
    (allowed-move stage7 agent_b G E)      ;; 8. stack(G,E)
    (allowed-move stage8 agent_b H table0) ;; 9. pickup(H)
    (allowed-move stage9 agent_b H G)      ;; 10. stack(H,G)
  )

  (:goal (and
    (on A B)
    (on D A)
    (on C D)
    (on F C)
    (on E F)
    (on G E)
    (on H G)
    (ontable B)
  ))
)