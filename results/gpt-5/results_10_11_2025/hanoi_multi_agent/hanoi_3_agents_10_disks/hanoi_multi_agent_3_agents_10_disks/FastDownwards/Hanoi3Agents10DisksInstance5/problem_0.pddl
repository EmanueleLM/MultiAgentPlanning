(define (problem hanoi-3peg-10)
  (:domain hanoi-3peg)
  (:objects
    agent_1 agent_2 agent_3 - agent
    left middle right - peg
    A B C D E F G H I J - disk
  )
  (:init
    ; agent permissions
    (controls agent_1 A) (controls agent_1 B) (controls agent_1 C) (controls agent_1 D)
    (controls agent_2 E) (controls agent_2 F) (controls agent_2 G)
    (controls agent_3 H) (controls agent_3 I) (controls agent_3 J)

    ; size ordering (A smallest ... J largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; initial configuration: all disks A(top) ... J(bottom) on left; middle and right empty
    (on A left) (on B left) (on C left) (on D left) (on E left)
    (on F left) (on G left) (on H left) (on I left) (on J left)
    (clear middle) (clear right)
    (top A left)
  )
  (:goal (and
    ; goal configuration:
    ; left has D,E,F,G,H,I,J (top D)
    (on D left) (on E left) (on F left) (on G left) (on H left) (on I left) (on J left)
    ; middle has C (top C)
    (on C middle)
    ; right has A,B with A on top
    (on A right) (on B right)

    ; fix the top disks for each peg to enforce the exact arrangement
    (top D left)
    (top C middle)
    (top A right)
  ))
)