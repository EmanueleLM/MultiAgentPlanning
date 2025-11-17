(define (problem hanoi3agents10disks_instance16)
  (:domain hanoi3agents_domain_v2)
  (:objects
    left middle right - peg
    agent_1 agent_2 agent_3 - agent
    A B C D E F G H I J - disk
  )
  (:init
    ; agent permissions
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)
    (can-move agent_2 E)
    (can-move agent_2 F)
    (can-move agent_2 G)
    (can-move agent_3 H)
    (can-move agent_3 I)
    (can-move agent_3 J)

    ; size ordering A (smallest) ... J (largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; initial stacking on left: A on B on C on ... on J, with J on left peg
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

    ; initial availability
    (clear A)
    (clear-peg middle)
    (clear-peg right)

    ; membership: all disks initially in left
    (in-peg A left)
    (in-peg B left)
    (in-peg C left)
    (in-peg D left)
    (in-peg E left)
    (in-peg F left)
    (in-peg G left)
    (in-peg H left)
    (in-peg I left)
    (in-peg J left)
  )
  (:goal
    (and
      ; left peg: A on E on F on G on H on I on J, with J on left
      (on A E)
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on-peg J left)

      ; middle peg: B on C, with C on middle
      (on B C)
      (on-peg C middle)

      ; right peg: D alone on right
      (on-peg D right)

      ; tops are clear
      (clear A)
      (clear B)
      (clear D)

      ; membership assertions
      (in-peg A left)
      (in-peg E left)
      (in-peg F left)
      (in-peg G left)
      (in-peg H left)
      (in-peg I left)
      (in-peg J left)

      (in-peg B middle)
      (in-peg C middle)

      (in-peg D right)
    )
  )
)