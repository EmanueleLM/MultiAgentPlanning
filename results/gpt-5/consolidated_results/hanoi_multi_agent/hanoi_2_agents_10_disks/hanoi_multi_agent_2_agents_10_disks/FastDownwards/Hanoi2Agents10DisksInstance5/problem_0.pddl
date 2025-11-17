(define (problem hanoi-instance-10disks-2agents)
  (:domain hanoi-agents-single-move)
  (:objects
    agent_1 agent_2 - agent
    left middle right - peg
    A B C D E F G H I J - disk
  )
  (:init
    ; allowed capabilities
    (allowed agent_1 A)
    (allowed agent_1 B)
    (allowed agent_1 C)
    (allowed agent_1 D)
    (allowed agent_1 E)
    (allowed agent_2 F)
    (allowed agent_2 G)
    (allowed agent_2 H)
    (allowed agent_2 I)
    (allowed agent_2 J)

    ; initial stack: A on B on C on D on E on F on G on H on I on J on left
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

    ; initial clear statuses
    (clear A)
    (clear middle)
    (clear right)

    ; static smaller relations: disk-to-disk
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; allow moving onto any clear peg by making smaller true for pegs
    (smaller A left) (smaller A middle) (smaller A right)
    (smaller B left) (smaller B middle) (smaller B right)
    (smaller C left) (smaller C middle) (smaller C right)
    (smaller D left) (smaller D middle) (smaller D right)
    (smaller E left) (smaller E middle) (smaller E right)
    (smaller F left) (smaller F middle) (smaller F right)
    (smaller G left) (smaller G middle) (smaller G right)
    (smaller H left) (smaller H middle) (smaller H right)
    (smaller I left) (smaller I middle) (smaller I right)
    (smaller J left) (smaller J middle) (smaller J right)
  )
  (:goal
    (and
      ; exact final configuration
      ; left has (top->bottom) B, E, F, G, H, I, J
      (on B E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J left)
      (clear B)

      ; middle has (top->bottom) A, C
      (on A C)
      (on C middle)
      (clear A)

      ; right has (top->bottom) D
      (on D right)
      (clear D)
    )
  )
)