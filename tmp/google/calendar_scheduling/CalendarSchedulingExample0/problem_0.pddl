(define (problem combined-scheduling-problem)
  (:domain combined-meeting-scheduling)
  
  (:objects
    agent1 agent2 agent3 - person
    t9 t10 t11 t12 t13 t14 t15 t16 - time-slot
  )

  (:init
    (free agent1 t9) (free agent1 t10)
    (free agent1 t13) (free agent1 t14)
    (free agent1 t15) (free agent1 t16)
    (blocked agent1 t11) (blocked agent1 t12)

    (free agent2 t10)
    (free agent2 t12) (free agent2 t14)
    (free agent2 t16) (blocked agent2 t9)
    (blocked agent2 t11) (blocked agent2 t13)
    (blocked agent2 t15)

    (free agent3 t9)
    (free agent3 t11) (free agent3 t12)
    (free agent3 t14)(blocked agent3 t10)
    (blocked agent3 t13) (blocked agent3 t15)
    (blocked agent3 t16)

    (next-slot t9 t10)
    (next-slot t10 t11)
    (next-slot t11 t12)
    (next-slot t12 t13)
    (next-slot t13 t14)
    (next-slot t14 t15)
    (next-slot t15 t16)
  )

  (:goal
    (meeting-scheduled)
  )
)