(define (problem Hanoi2Agents10DisksInstance17)
  (:domain hanoi2agents)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    agent_1 agent_2 - agent
  )
  (:init
    ; typing facts (informative)
    (disk A) (disk B) (disk C) (disk D) (disk E) (disk F) (disk G) (disk H) (disk I) (disk J)
    (peg left) (peg middle) (peg right)
    (agent agent_1) (agent agent_2)

    ; ownership
    (owns agent_1 A) (owns agent_1 B) (owns agent_1 C) (owns agent_1 D) (owns agent_1 E)
    (owns agent_2 F) (owns agent_2 G) (owns agent_2 H) (owns agent_2 I) (owns agent_2 J)

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

    ; initial stacking: left has A(top) ... J(bottom); middle/right empty
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on-peg J left)

    ; clearance
    (clear A)
    (clear middle)
    (clear right)
  )
  (:goal
    (and
      ; left: B(top), D, E, F, G, H, I, J(bottom)
      (on B D)
      (on D E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on-peg J left)
      (clear B)

      ; right: A(top), C(bottom)
      (on A C)
      (on-peg C right)
      (clear A)

      ; middle empty
      (clear middle)
    )
  )
)