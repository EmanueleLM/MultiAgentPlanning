(define (problem blocksworld_multiagent_problem)
  (:domain blocksworld_multiagent)
  (:objects
    A B C D E F - block
    robot_alpha robot_beta - agent
  )

  (:init
    ;; Initial on/table relationships (initial stacks):
    (ontable A)
    (on E A)
    (on D E)

    (ontable C)
    (on B C)
    (on F B)

    ;; Initially the top blocks are clear
    (clear D)
    (clear F)

    ;; Both agents start with empty hands
    (handempty robot_alpha)
    (handempty robot_beta)
  )

  (:goal (and
    ;; Final arrangement after the given ordered sequence of actions:
    ;; Stack A -> E (E on A)
    (on E A)
    (ontable A)

    ;; Stack C -> B (B on C)
    (on B C)
    (ontable C)

    ;; Stack F -> D (D on F) with F on table
    (on D F)
    (ontable F)

    ;; Top blocks are clear
    (clear E)
    (clear B)
    (clear D)

    ;; No agent is holding anything
    (handempty robot_alpha)
    (handempty robot_beta)
  ))
)