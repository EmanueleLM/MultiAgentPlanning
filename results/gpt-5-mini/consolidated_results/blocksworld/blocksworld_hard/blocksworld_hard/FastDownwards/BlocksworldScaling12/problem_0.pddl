(define (problem blocks-3)
  (:domain blocks-multi)
  (:objects
    r1 - agent
    a b c - block
  )
  ;; Initial state:
  ;; - a is on the table and has c on top of it
  ;; - b is on the table and is clear
  ;; - c is on a and is clear (top)
  ;; - the single agent r1 has an empty hand
  (:init
    (handempty r1)
    (ontable a)
    (ontable b)
    (on c a)
    (clear b)
    (clear c)
  )

  ;; Goal state:
  ;; - a remains on the table
  ;; - b is directly on a
  ;; - c is directly on b (tower a <- b <- c)
  ;; - c (the top block) is clear
  ;; - the agent's hand is empty at the end
  (:goal
    (and
      (ontable a)
      (on b a)
      (on c b)
      (clear c)
      (handempty r1)
    )
  )
)