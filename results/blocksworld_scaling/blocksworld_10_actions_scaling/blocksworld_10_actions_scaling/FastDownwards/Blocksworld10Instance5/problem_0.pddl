(define (problem bw-multiagent-instance)
  (:domain blocksworld-multiagent)

  (:objects
    robot1 robot2 - agent
    A B C D E F G H - block
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
    ; D, E, F, G, H are not clear initially (because something is on them)

    ; agents start with empty hands
    (handempty robot1)
    (handempty robot2)

    ; manipulation capabilities as specified
    ; robot1 can move A, C, G, H
    (can-manipulate robot1 A)
    (can-manipulate robot1 C)
    (can-manipulate robot1 G)
    (can-manipulate robot1 H)

    ; robot2 can move B, D, E, F
    (can-manipulate robot2 B)
    (can-manipulate robot2 D)
    (can-manipulate robot2 E)
    (can-manipulate robot2 F)
  )

  (:goal (and
    ; final configuration after the action sequence (goal state)
    (on A G)
    (on B D)
    (on C B)
    (ontable D)
    (ontable E)
    (on F E)
    (on G F)
    (ontable H)
  ))
)