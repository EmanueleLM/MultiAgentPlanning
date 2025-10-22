(define (problem Blocksworld10Instance9)
  (:domain blocksworld-sequence)
  (:objects
    A B C D E F G H             - block
    agent_a agent_b             - agent
    stage0 stage1 stage2 stage3 stage4 stage5 stage6 stage7 stage8 stage9 stage10 - stage
  )

  (:init
    (on A B)
    (on D A)
    (on C D)
    (on F C)
    (on E F)
    (on G H)

    (ontable B)
    (ontable H)

    (clear E)
    (clear G)

    (handempty agent_a)
    (handempty agent_b)

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

    (allowed-move stage0 G H)
    (allowed-move stage1 G table0)
    (allowed-move stage2 H table0)
    (allowed-move stage3 H G)
    (allowed-move stage4 H G)
    (allowed-move stage5 H table0)
    (allowed-move stage6 G table0)
    (allowed-move stage7 G E)
    (allowed-move stage8 H table0)
    (allowed-move stage9 H G)
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