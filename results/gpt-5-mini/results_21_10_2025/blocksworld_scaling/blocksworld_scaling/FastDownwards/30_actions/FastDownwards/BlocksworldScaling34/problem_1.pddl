(define (problem multiagent-blocks-problem)
  (:domain multiagent-blocks)

  (:objects
    ;; Vowels
    A E I - vowel
    ;; Consonants
    B C D F G H J K L - consonant
  )

  (:init
    ;; Initial stacks (as given)
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

    ;; Clear facts for top blocks only
    (clear I)
    (clear B)
    (clear J)
    (clear A)

    ;; Different facts for every ordered pair of distinct blocks (to forbid self-placement)
    ;; Blocks: H K F E C G A D L I J B
    ;; For H:
    (different H K) (different H F) (different H E) (different H C) (different H G) (different H A) (different H D) (different H L) (different H I) (different H J) (different H B)
    ;; For K:
    (different K H) (different K F) (different K E) (different K C) (different K G) (different K A) (different K D) (different K L) (different K I) (different K J) (different K B)
    ;; For F:
    (different F H) (different F K) (different F E) (different F C) (different F G) (different F A) (different F D) (different F L) (different F I) (different F J) (different F B)
    ;; For E:
    (different E H) (different E K) (different E F) (different E C) (different E G) (different E A) (different E D) (different E L) (different E I) (different E J) (different E B)
    ;; For C:
    (different C H) (different C K) (different C F) (different C E) (different C G) (different C A) (different C D) (different C L) (different C I) (different C J) (different C B)
    ;; For G:
    (different G H) (different G K) (different G F) (different G E) (different G C) (different G A) (different G D) (different G L) (different G I) (different G J) (different G B)
    ;; For A:
    (different A H) (different A K) (different A F) (different A E) (different A C) (different A G) (different A D) (different A L) (different A I) (different A J) (different A B)
    ;; For D:
    (different D H) (different D K) (different D F) (different D E) (different D C) (different D G) (different D A) (different D L) (different D I) (different D J) (different D B)
    ;; For L:
    (different L H) (different L K) (different L F) (different L E) (different L C) (different L G) (different L A) (different L D) (different L I) (different L J) (different L B)
    ;; For I:
    (different I H) (different I K) (different I F) (different I E) (different I C) (different I G) (different I A) (different I D) (different I L) (different I J) (different I B)
    ;; For J:
    (different J H) (different J K) (different J F) (different J E) (different J C) (different J G) (different J A) (different J D) (different J L) (different J I) (different J B)
    ;; For B:
    (different B H) (different B K) (different B F) (different B E) (different B C) (different B G) (different B A) (different B D) (different B L) (different B I) (different B J)
  )

  (:goal (and
    ;; Target tower from bottom to top: L (on table), K on L, J on K, I on J, H on I, G on H,
    ;; F on G, E on F, D on E, C on D, B on C, A on B
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
    ;; top of final stack must be clear
    (clear A)
  ))
)