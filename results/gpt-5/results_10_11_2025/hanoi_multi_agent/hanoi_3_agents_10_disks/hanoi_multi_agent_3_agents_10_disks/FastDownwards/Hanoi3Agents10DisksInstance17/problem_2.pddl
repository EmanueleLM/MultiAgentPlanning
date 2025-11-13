(define (problem Hanoi3Agents10DisksInstance17)
  (:domain hanoi-3agents-staged)
  (:objects
    left middle right - peg
    A B C D E F G H I J - disk
    agent_1 agent_2 agent_3 - agent
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 - stage
  )
  (:init
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

    ; agent permissions
    (canmove agent_1 A) (canmove agent_1 B) (canmove agent_1 C) (canmove agent_1 D)
    (canmove agent_2 E) (canmove agent_2 F) (canmove agent_2 G)
    (canmove agent_3 H) (canmove agent_3 I) (canmove agent_3 J)

    ; initial stack: left has A (top) ... J (bottom), others empty
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

    ; stage progression
    (atstage s0)
    (succ s0 s1) (succ s1 s2) (succ s2 s3) (succ s3 s4) (succ s4 s5) (succ s5 s6)
    (succ s6 s7) (succ s7 s8) (succ s8 s9) (succ s9 s10) (succ s10 s11) (succ s11 s12)
    (succ s12 s13) (succ s13 s14) (succ s14 s15) (succ s15 s16) (succ s16 s17)
  )

  (:goal (and
    ; right: A
    (on A right)
    (clear A)

    ; middle: C on D
    (on C D)
    (on D middle)
    (clear C)

    ; left: B on E on F on G on H on I on J on left
    (on B E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J left)
    (clear B)

    ; exact stage completion
    (atstage s17)
  ))
)