(define (problem Blocksworld10Instance9)
  (:domain blocksworld-sequence)
  (:objects
    A B C D E F G H             - block
    agent_a agent_b             - agent
    table                       - table
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 - stage
  )

  (:init
    ;; Initial block configuration (as given)
    (on A B)
    (on D A)
    (on C D)
    (on F C)
    (on E F)
    (on G H)

    (ontable B)
    (ontable H)

    ;; Clear blocks initially (tops of stacks)
    (clear E)
    (clear G)

    ;; Agents' hands initially empty
    (handempty agent_a)
    (handempty agent_b)

    ;; Stage management: start at stage0
    (stage stage0)

    ;; Successor chain for the 10-step sequence
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

    ;; Allowed moves per stage encode the required fixed sequence:
    ;; 1. unstack(G, H)
    (allowed-move stage0 G H)
    ;; 2. putdown(G) -> (G -> table)
    (allowed-move stage1 G table)
    ;; 3. pickup(H) -> (H -> table)
    (allowed-move stage2 H table)
    ;; 4. stack(H, G)
    (allowed-move stage3 H G)
    ;; 5. unstack(H, G)
    (allowed-move stage4 H G)
    ;; 6. putdown(H)
    (allowed-move stage5 H table)
    ;; 7. pickup(G)
    (allowed-move stage6 G table)
    ;; 8. stack(G, E)
    (allowed-move stage7 G E)
    ;; 9. pickup(H)
    (allowed-move stage8 H table)
    ;; 10. stack(H, G)
    (allowed-move stage9 H G)
  )

  (:goal (and
    ;; Final arrangement after executing the sequence:
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