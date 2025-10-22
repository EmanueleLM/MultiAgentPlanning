(define (problem blocks-final-arrangement)
  (:domain multi-agent-blocks)
  (:objects
    A B C D E F G H I - block
    agent1 agent2 - agent
  )

  (:init
    ;; Initial placement (given public information)
    (ontable A)
    (on B C)
    (on C I)
    (on D F)
    (on E A)
    (on F H)
    (on G E)
    (ontable H)
    (on I D)

    ;; Initial clear (only blocks with nothing on them)
    (clear G)
    (clear B)

    ;; Both manipulators free initially
    (handempty agent1)
    (handempty agent2)
  )

  ;; Goal: final arrangement obtained by integrating the provided action trace
  (:goal (and
    ;; Blocks on the table
    (ontable A)
    (ontable C)
    (ontable E)
    (ontable G)
    (ontable H)

    ;; Stacked relations
    (on B A)
    (on I D)
    (on D F)
    (on F H)
  ))
)