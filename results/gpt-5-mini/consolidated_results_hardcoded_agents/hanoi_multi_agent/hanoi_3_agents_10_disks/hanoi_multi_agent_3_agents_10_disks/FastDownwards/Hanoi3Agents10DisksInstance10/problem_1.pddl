(define (problem Hanoi3Agents10DisksInstance10)
  (:domain hanoi-multiagent-10)

  (:objects
    A B C D E F G H I J none - disk
    left middle right - peg
  )

  (:init
    ; all disks start on left peg
    (on A left) (on B left) (on C left) (on D left) (on E left)
    (on F left) (on G left) (on H left) (on I left) (on J left)

    ; top and emptiness
    (top A left)
    (empty middle)
    (empty right)

    ; below adjacency (directly below)
    (below A B)
    (below B C)
    (below C D)
    (below D E)
    (below E F)
    (below F G)
    (below G H)
    (below H I)
    (below I J)
    (below J none)

    ; size relations (A smallest, J largest)
    (smaller A B) (smaller A C) (smaller A D) (smaller A E) (smaller A F) (smaller A G) (smaller A H) (smaller A I) (smaller A J)
    (smaller B C) (smaller B D) (smaller B E) (smaller B F) (smaller B G) (smaller B H) (smaller B I) (smaller B J)
    (smaller C D) (smaller C E) (smaller C F) (smaller C G) (smaller C H) (smaller C I) (smaller C J)
    (smaller D E) (smaller D F) (smaller D G) (smaller D H) (smaller D I) (smaller D J)
    (smaller E F) (smaller E G) (smaller E H) (smaller E I) (smaller E J)
    (smaller F G) (smaller F H) (smaller F I) (smaller F J)
    (smaller G H) (smaller G I) (smaller G J)
    (smaller H I) (smaller H J)
    (smaller I J)

    ; agent movement permissions
    (canmove1 A) (canmove1 B) (canmove1 C) (canmove1 D)
    (canmove2 E) (canmove2 F) (canmove2 G)
    (canmove3 H) (canmove3 I) (canmove3 J)
  )

  (:goal (and
    ; left peg must be (top->bottom): C, E, F, G, H, I, J
    (on C left) (on E left) (on F left) (on G left) (on H left) (on I left) (on J left)
    (top C left)
    (below C E) (below E F) (below F G) (below G H) (below H I) (below I J) (below J none)

    ; middle peg empty
    (empty middle)

    ; right peg must be (top->bottom): A, B, D
    (on A right) (on B right) (on D right)
    (top A right)
    (below A B) (below B D) (below D none)
  ))