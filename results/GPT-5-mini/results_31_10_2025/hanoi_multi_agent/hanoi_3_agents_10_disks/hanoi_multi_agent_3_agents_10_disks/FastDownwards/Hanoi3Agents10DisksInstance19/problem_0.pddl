(define (problem multiagent-hanoi-10)
  (:domain multiagent-hanoi)
  (:objects
    A B C D E F G H I J - disk
    left middle right - peg
    ; treat disk and peg both as places via typing declaration in the domain header
    left place-left middle place-middle right place-right - place ; dummy reuse to satisfy typing in some planners
  )

  ; Note: Some planners expect objects to conform to declared types: disk and peg are declared above.
  ; We use the peg objects left middle right of type peg and disks A-J of type disk.
  ; The extra place-* objects are not used; if the planner enforces place usage strictly, the on/canplace predicates refer to disks and pegs.
  (:init
    ; initial stacking top->bottom on left: A, B, C, D, E, F, G, H, I, J
    (on A left)
    (on B A)
    (on C B)
    (on D C)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)

    ; clear facts: only top disk A is clear; middle and right pegs are empty/clear
    (clear A)
    (clear middle)
    (clear right)
    ; left peg is not clear initially, so no (clear left)

    ; agent permissions
    (allowed1 A) (allowed1 B) (allowed1 C) (allowed1 D)
    (allowed2 E) (allowed2 F) (allowed2 G)
    (allowed3 H) (allowed3 I) (allowed3 J)

    ; canplace facts: disk -> peg placements are always allowed; disk -> disk allowed when the first is smaller than the second
    ; disk -> peg
    (canplace A left) (canplace A middle) (canplace A right)
    (canplace B left) (canplace B middle) (canplace B right)
    (canplace C left) (canplace C middle) (canplace C right)
    (canplace D left) (canplace D middle) (canplace D right)
    (canplace E left) (canplace E middle) (canplace E right)
    (canplace F left) (canplace F middle) (canplace F right)
    (canplace G left) (canplace G middle) (canplace G right)
    (canplace H left) (canplace H middle) (canplace H right)
    (canplace I left) (canplace I middle) (canplace I right)
    (canplace J left) (canplace J middle) (canplace J right)

    ; disk -> disk where smaller disk may be placed on larger disk
    ; A is smaller than everyone else
    (canplace A B) (canplace A C) (canplace A D) (canplace A E) (canplace A F) (canplace A G) (canplace A H) (canplace A I) (canplace A J)
    ; B smaller than C..J
    (canplace B C) (canplace B D) (canplace B E) (canplace B F) (canplace B G) (canplace B H) (canplace B I) (canplace B J)
    ; C smaller than D..J
    (canplace C D) (canplace C E) (canplace C F) (canplace C G) (canplace C H) (canplace C I) (canplace C J)
    ; D smaller than E..J
    (canplace D E) (canplace D F) (canplace D G) (canplace D H) (canplace D I) (canplace D J)
    ; E smaller than F..J
    (canplace E F) (canplace E G) (canplace E H) (canplace E I) (canplace E J)
    ; F smaller than G..J
    (canplace F G) (canplace F H) (canplace F I) (canplace F J)
    ; G smaller than H..J
    (canplace G H) (canplace G I) (canplace G J)
    ; H smaller than I,J
    (canplace H I) (canplace H J)
    ; I smaller than J
    (canplace I J)

    ; Note: no canplace facts that would allow placing a larger disk onto a smaller one.
  )

  (:goal (and
    ; final left peg stacking top->bottom: A, D, E, F, G, H, I, J
    (on A left)
    (on D A)
    (on E D)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)
    ; final middle peg top->bottom: B
    (on B middle)
    ; final right peg top->bottom: C
    (on C right)
  ))