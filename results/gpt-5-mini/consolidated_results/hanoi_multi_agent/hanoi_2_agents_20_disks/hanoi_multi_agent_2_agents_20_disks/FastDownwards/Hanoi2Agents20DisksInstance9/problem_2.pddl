(define (problem hanoi2agents20disksinstance9)
  (:domain hanoi_two_agents)
  (:objects
    a b c d e f g h i j k l m n o p q r s t - disk
    left middle right - peg
  )
  (:init
    (on a b) (on b c) (on c d) (on d e) (on e f) (on f g) (on g h) (on h i) (on i j) (on j k)
    (on k l) (on l m) (on m n) (on n o) (on o p) (on p q) (on q r) (on r s) (on s t) (on t left)
    (top left a)
    (empty middle)
    (empty right)
    (allowed_agent1 a) (allowed_agent1 b) (allowed_agent1 c) (allowed_agent1 d) (allowed_agent1 e)
    (allowed_agent1 f) (allowed_agent1 g) (allowed_agent1 h) (allowed_agent1 i) (allowed_agent1 j)
    (allowed_agent2 k) (allowed_agent2 l) (allowed_agent2 m) (allowed_agent2 n) (allowed_agent2 o)
    (allowed_agent2 p) (allowed_agent2 q) (allowed_agent2 r) (allowed_agent2 s) (allowed_agent2 t)
  )

  (:goal (and
    (top left c)
    (top middle b)
    (top right a)
    (on a right)
    (on b middle)
    (on c d) (on d e) (on e f) (on f g) (on g h) (on h i) (on i j) (on j k)
    (on k l) (on l m) (on m n) (on n o) (on o p) (on p q) (on q r) (on r s) (on s t) (on t left)
  ))
)