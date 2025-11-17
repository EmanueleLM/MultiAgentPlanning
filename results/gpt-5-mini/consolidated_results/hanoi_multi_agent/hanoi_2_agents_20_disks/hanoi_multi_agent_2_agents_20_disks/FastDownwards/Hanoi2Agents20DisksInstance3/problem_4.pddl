(define (problem hanoi-2agents-20-problem)
  (:domain hanoi-2agents-20)

  (:objects
    a b c d e f g h i j k l m n o p q r s t - disk
    left middle right - peg
  )

  (:init
    (on a left) (on b left) (on c left) (on d left) (on e left) (on f left)
    (on g left) (on h left) (on i left) (on j left) (on k left) (on l left)
    (on m left) (on n left) (on o left) (on p left) (on q left) (on r left)
    (on s left) (on t left)
    (step0)
    (can-agent1 a) (can-agent1 b) (can-agent1 c) (can-agent1 d) (can-agent1 e)
    (can-agent1 f) (can-agent1 g) (can-agent1 h) (can-agent1 i) (can-agent1 j)
    (can-agent2 k) (can-agent2 l) (can-agent2 m) (can-agent2 n) (can-agent2 o)
    (can-agent2 p) (can-agent2 q) (can-agent2 r) (can-agent2 s) (can-agent2 t)
  )

  (:goal (and
    (on b left) (on e left) (on f left) (on g left) (on h left) (on i left)
    (on j left) (on k left) (on l left) (on m left) (on n left) (on o left)
    (on p left) (on q left) (on r left) (on s left) (on t left)
    (on c middle)
    (on a right) (on d right)
  ))