(define (problem hanoi_two_agents_problem)
  (:domain hanoi_agents)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent1 agent2 - agent
  )
  (:init
    ; initial configuration: left peg top-to-bottom A B C D E F G H I J
    (on A left)
    (on B left)
    (on C left)
    (on D left)
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)

    ; agent movement permissions
    (can-move agent1 A) (can-move agent1 B) (can-move agent1 C) (can-move agent1 D) (can-move agent1 E)
    (can-move agent2 F) (can-move agent2 G) (can-move agent2 H) (can-move agent2 I) (can-move agent2 J)

    ; disk size order (smaller X Y means X is strictly smaller than Y)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)
  )
  (:goal (and
    ; left peg top-to-bottom (final set): B E F G H I J present on left
    (on B left)
    (on E left)
    (on F left)
    (on G left)
    (on H left)
    (on I left)
    (on J left)
    ; right peg top-to-bottom: A C D present on right
    (on A right)
    (on C right)
    (on D right)
  ))
)