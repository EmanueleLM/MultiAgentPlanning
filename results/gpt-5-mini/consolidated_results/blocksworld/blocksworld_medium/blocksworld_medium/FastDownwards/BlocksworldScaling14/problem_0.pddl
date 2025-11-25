(define (problem blocks-problem1)
  (:domain blocks-multiagent)

  (:objects
    orchestrator - agent
    table - table
    a b c - block
  )

  ;; Initial state observed (explicit facts)
  (:init
    (on a table)      ; block a on the table
    (on b a)          ; block b on block a
    (on c table)      ; block c on the table
    (clear b)         ; nothing on top of b
    (clear c)         ; nothing on top of c
    (handfree orchestrator) ; orchestrator's single hand is free
  )

  ;; Goal: form a tower a (bottom) <- b <- c (top), with agent's hand free and top clear
  (:goal (and
    (on a table)
    (on b a)
    (on c b)
    (handfree orchestrator)
    (clear c)
  ))
)