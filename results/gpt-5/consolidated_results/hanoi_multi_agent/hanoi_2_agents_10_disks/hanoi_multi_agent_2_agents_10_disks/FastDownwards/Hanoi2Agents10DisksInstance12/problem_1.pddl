(define (problem hanoi-2agent-10-instance12)
  (:domain hanoi-2agent-10)
  (:objects
    left middle right - peg
    A B C D E F G H I J - disk
    agent_1 agent_2 - agent
  )

  (:init
    ; agent authorizations
    (can-move agent_1 A)
    (can-move agent_1 B)
    (can-move agent_1 C)
    (can-move agent_1 D)
    (can-move agent_1 E)
    (can-move agent_2 F)
    (can-move agent_2 G)
    (can-move agent_2 H)
    (can-move agent_2 I)
    (can-move agent_2 J)

    ; strict size ordering A (smallest) ... J (largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; admissible placements: any disk onto any peg
    (can-stack A left)   (can-stack A middle)   (can-stack A right)
    (can-stack B left)   (can-stack B middle)   (can-stack B right)
    (can-stack C left)   (can-stack C middle)   (can-stack C right)
    (can-stack D left)   (can-stack D middle)   (can-stack D right)
    (can-stack E left)   (can-stack E middle)   (can-stack E right)
    (can-stack F left)   (can-stack F middle)   (can-stack F right)
    (can-stack G left)   (can-stack G middle)   (can-stack G right)
    (can-stack H left)   (can-stack H middle)   (can-stack H right)
    (can-stack I left)   (can-stack I middle)   (can-stack I right)
    (can-stack J left)   (can-stack J middle)   (can-stack J right)

    ; admissible placements: only onto strictly larger disks
    (can-stack A B) (can-stack A C) (can-stack A D) (can-stack A E) (can-stack A F) (can-stack A G) (can-stack A H) (can-stack A I) (can-stack A J)
    (can-stack B C) (can-stack B D) (can-stack B E) (can-stack B F) (can-stack B G) (can-stack B H) (can-stack B I) (can-stack B J)
    (can-stack C D) (can-stack C E) (can-stack C F) (can-stack C G) (can-stack C H) (can-stack C I) (can-stack C J)
    (can-stack D E) (can-stack D F) (can-stack D G) (can-stack D H) (can-stack D I) (can-stack D J)
    (can-stack E F) (can-stack E G) (can-stack E H) (can-stack E I) (can-stack E J)
    (can-stack F G) (can-stack F H) (can-stack F I) (can-stack F J)
    (can-stack G H) (can-stack G I) (can-stack G J)
    (can-stack H I) (can-stack H J)
    (can-stack I J)

    ; initial configuration: left has A (top) .. J (bottom), middle/right empty
    ; using on(directly-on support): top A is on B, bottom J is on left
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

    ; initially clear supports: top disk A, and empty pegs middle/right
    (clear A)
    (clear middle)
    (clear right)
  )

  (:goal
    (and
      ; left peg has (top→bottom) E, F, G, H, I, J
      (on E F)
      (on F G)
      (on G H)
      (on H I)
      (on I J)
      (on J left)

      ; middle peg has A alone
      (on A middle)

      ; right peg has (top→bottom) B, C, D
      (on B C)
      (on C D)
      (on D right)

      ; tops are clear to fix the exact tops of each stack
      (clear E)
      (clear A)
      (clear B)
    )
  )
)