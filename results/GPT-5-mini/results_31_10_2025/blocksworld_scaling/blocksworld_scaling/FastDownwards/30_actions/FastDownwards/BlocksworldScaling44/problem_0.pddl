;; Problem: assemble the goal stack J (table) -> I -> H -> G -> F -> E -> D -> C -> B -> A
;; Objects and initial stacks follow the public environment specification.
(define (problem blocksworld_multiagent_problem)
  (:domain blocksworld_multiagent)

  (:objects
    I B J H A G E D F C - block
    table - table
  )

  (:init
    ;; Vowel / consonant classification (agent constraints)
    (vowel I)
    (vowel A)
    (vowel E)

    (consonant B)
    (consonant J)
    (consonant H)
    (consonant G)
    (consonant D)
    (consonant F)
    (consonant C)

    ;; Initial on relations (stacks given bottom->top):
    ;; stack1: I (table) -> B -> J -> D (top)
    (on I table)
    (on B I)
    (on J B)
    (on D J)

    ;; stack2: H (table) -> A -> E (top)
    (on H table)
    (on A H)
    (on E A)

    ;; stack3: G (table) -> F (top)
    (on G table)
    (on F G)

    ;; stack4: C (table)
    (on C table)

    ;; Clear (top) facts for present top blocks
    (clear D)
    (clear E)
    (clear F)
    (clear C)

    ;; Pairwise inequality facts (different ?x ?y) for all ordered distinct block pairs.
    ;; This enables enforcing X != Y in action preconditions without using :equality.
    (different I B) (different I J) (different I H) (different I A) (different I G) (different I E) (different I D) (different I F) (different I C)
    (different B I) (different B J) (different B H) (different B A) (different B G) (different B E) (different B D) (different B F) (different B C)
    (different J I) (different J B) (different J H) (different J A) (different J G) (different J E) (different J D) (different J F) (different J C)
    (different H I) (different H B) (different H J) (different H A) (different H G) (different H E) (different H D) (different H F) (different H C)
    (different A I) (different A B) (different A J) (different A H) (different A G) (different A E) (different A D) (different A F) (different A C)
    (different G I) (different G B) (different G J) (different G H) (different G A) (different G E) (different G D) (different G F) (different G C)
    (different E I) (different E B) (different E J) (different E H) (different E A) (different E G) (different E D) (different E F) (different E C)
    (different D I) (different D B) (different D J) (different D H) (different D A) (different D G) (different D E) (different D F) (different D C)
    (different F I) (different F B) (different F J) (different F H) (different F A) (different F G) (different F E) (different F D) (different F C)
    (different C I) (different C B) (different C J) (different C H) (different C A) (different C G) (different C E) (different C D) (different C F)
  )

  (:goal
    (and
      ;; Goal single tall stack bottom->top: J (table), I on J, H on I, G on H, F on G, E on F, D on E, C on D, B on C, A on B
      (on J table)
      (on I J)
      (on H I)
      (on G H)
      (on F G)
      (on E F)
      (on D E)
      (on C D)
      (on B C)
      (on A B)
    )
  )
)