(define (problem hanoi3agents10disksinstance5_staged)
  (:domain hanoi3agents_staged)
  (:objects
    agent_1 agent_2 agent_3 - agent
    left middle right - peg
    A B C D E F G H I J - disk
    s0 s1 s2 s3 s4 s5 - stage
  )
  (:init
    (controls agent_1 A) (controls agent_1 B) (controls agent_1 C) (controls agent_1 D)
    (controls agent_2 E) (controls agent_2 F) (controls agent_2 G)
    (controls agent_3 H) (controls agent_3 I) (controls agent_3 J)

    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)

    (clear A)
    (clear middle)
    (clear right)

    (current s0)
    (next s0 s1)
    (next s1 s2)
    (next s2 s3)
    (next s3 s4)
    (next s4 s5)

    (allowed A B right s0)
    (allowed A right middle s1)
    (allowed B C right s2)
    (allowed A middle B s3)
    (allowed C D middle s4)
  )
  (:goal (and
    (on D E) (on E F) (on F G) (on G H) (on H I) (on I J) (on J left)
    (on C middle)
    (on A B) (on B right)
    (current s5)
  ))
)