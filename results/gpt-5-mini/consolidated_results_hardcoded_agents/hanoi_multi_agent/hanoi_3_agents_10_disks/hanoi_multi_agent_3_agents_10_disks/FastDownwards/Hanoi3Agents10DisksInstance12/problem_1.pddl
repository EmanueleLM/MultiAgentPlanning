(define (problem Hanoi3Agents10DisksInstance12-problem)
  (:domain hanoi-3agents-10disks)
  (:objects
    left middle right - peg
    A B C D E F G H I J - disk
  )
  (:init
    ;; initial stack on left (top->bottom): A B C D E F G H I J
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

    ;; clear predicates: top disk A is clear; other disks not clear; left peg not clear; middle and right clear
    (clear A)
    ;; B..J are not clear, so no clear facts for them
    ;; left peg has disks (not clear), middle and right are clear
    (clear middle)
    (clear right)

    ;; can-place facts:
    ;; any disk can be placed on any peg
    (can-place A left) (can-place A middle) (can-place A right)
    (can-place B left) (can-place B middle) (can-place B right)
    (can-place C left) (can-place C middle) (can-place C right)
    (can-place D left) (can-place D middle) (can-place D right)
    (can-place E left) (can-place E middle) (can-place E right)
    (can-place F left) (can-place F middle) (can-place F right)
    (can-place G left) (can-place G middle) (can-place G right)
    (can-place H left) (can-place H middle) (can-place H right)
    (can-place I left) (can-place I middle) (can-place I right)
    (can-place J left) (can-place J middle) (can-place J right)

    ;; can-place on larger disks (smaller -> larger)
    ;; A (smallest) can be placed on any larger disk B..J
    (can-place A B) (can-place A C) (can-place A D) (can-place A E) (can-place A F) (can-place A G) (can-place A H) (can-place A I) (can-place A J)
    ;; B can be placed on C..J
    (can-place B C) (can-place B D) (can-place B E) (can-place B F) (can-place B G) (can-place B H) (can-place B I) (can-place B J)
    ;; C on D..J
    (can-place C D) (can-place C E) (can-place C F) (can-place C G) (can-place C H) (can-place C I) (can-place C J)
    ;; D on E..J
    (can-place D E) (can-place D F) (can-place D G) (can-place D H) (can-place D I) (can-place D J)
    ;; E on F..J
    (can-place E F) (can-place E G) (can-place E H) (can-place E I) (can-place E J)
    ;; F on G..J
    (can-place F G) (can-place F H) (can-place F I) (can-place F J)
    ;; G on H..J
    (can-place G H) (can-place G I) (can-place G J)
    ;; H on I..J
    (can-place H I) (can-place H J)
    ;; I on J
    (can-place I J)

    ;; agent move permissions
    (agent1_allowed A) (agent1_allowed B) (agent1_allowed C) (agent1_allowed D)
    (agent2_allowed E) (agent2_allowed F) (agent2_allowed G)
    (agent3_allowed H) (agent3_allowed I) (agent3_allowed J)
  )

  (:goal (and
    ;; left peg final stack top->bottom: E F G H I J
    (on E left)
    (on F E)
    (on G F)
    (on H G)
    (on I H)
    (on J I)
    ;; middle peg has D
    (on D middle)
    ;; right peg final stack top->bottom: A B C
    (on A right)
    (on B A)
    (on C B)
  ))
)