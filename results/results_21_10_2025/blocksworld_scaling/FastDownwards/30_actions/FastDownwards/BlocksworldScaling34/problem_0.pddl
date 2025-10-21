(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    ;; Vowels
    A E I - vowel
    ;; Consonants
    B C D F G H J K L - consonant
  )

  (:init
    ;; Initial stacks
    ;; Stack1: H (bottom), I (top)
    (ontable H)
    (on I H)

    ;; Stack2: K (bottom), E, D, B (top)
    (ontable K)
    (on E K)
    (on D E)
    (on B D)

    ;; Stack3: F (bottom), L, J (top)
    (ontable F)
    (on L F)
    (on J L)

    ;; Stack4: C (bottom), G, A (top)
    (ontable C)
    (on G C)
    (on A G)

    ;; Clear (top blocks only)
    (clear I)
    (clear B)
    (clear J)
    (clear A)

    ;; All other blocks that have something on them are not listed as clear.
    ;; (The STRIPS delete effects will manage clear facts as actions are executed.)

    ;; different facts for every ordered pair of distinct blocks
    ;; (This enforces inequality constraints without relying on :equality)
    (different H A) (different H E) (different H I) (different H B) (different H C) (different H D) (different H F) (different H G) (different H J) (different H K) (different H L)
    (different A H) (different A E) (different A I) (different A B) (different A C) (different A D) (different A F) (different A G) (different A J) (different A K) (different A L)
    (different E H) (different E A) (different E I) (different E B) (different E C) (different E D) (different E F) (different E G) (different E J) (different E K) (different E L)
    (different I H) (different I A) (different I E) (different I B) (different I C) (different I D) (different I F) (different I G) (different I J) (different I K) (different I L)
    (different B H) (different B A) (different B E) (different B I) (different B C) (different B D) (different B F) (different B G) (different B J) (different B K) (different B L)
    (different C H) (different C A) (different C E) (different C I) (different C B) (different C D) (different C F) (different C G) (different C J) (different C K) (different C L)
    (different D H) (different D A) (different D E) (different D I) (different D B) (different D C) (different D F) (different D G) (different D J) (different D K) (different D L)
    (different F H) (different F A) (different F E) (different F I) (different F B) (different F C) (different F D) (different F G) (different F J) (different F K) (different F L)
    (different G H) (different G A) (different G E) (different G I) (different G B) (different G C) (different G D) (different G F) (different G J) (different G K) (different G L)
    (different J H) (different J A) (different J E) (different J I) (different J B) (different J C) (different J D) (different J F) (different J G) (different J K) (different J L)
    (different K H) (different K A) (different K E) (different K I) (different K B) (different K C) (different K D) (different K F) (different K G) (different K J) (different K L)
    (different L H) (different L A) (different L E) (different L I) (different L B) (different L C) (different L D) (different L F) (different L G) (different L J) (different L K)

    ;; Note: pairs where both elements are the same are intentionally omitted.
  )

  (:goal (and
    ;; Target tower from bottom to top: L (on table), K on L, J on K, I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
    (ontable L)
    (on K L)
    (on J K)
    (on I J)
    (on H I)
    (on G H)
    (on F G)
    (on E F)
    (on D E)
    (on C D)
    (on B C)
    (on A B)
    ;; Ensure top of final stack is clear
    (clear A)
  ))
)