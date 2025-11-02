(define (problem build-A-to-M)
  (:domain multiagent-blocks)

  (:objects
    A B C D E F G H I J K L M
    pileA pileB pileC pileD pileE pileF pileG pileH pileI pileJ pileK pileL pileM table
  )

  (:init
    ;; classification: which objects are stacks vs blocks
    ;; stacks (places that can accept blocks)
    (stack pileA) (stack pileB) (stack pileC) (stack pileD)
    (stack pileE) (stack pileF) (stack pileG) (stack pileH)
    (stack pileI) (stack pileJ) (stack pileK) (stack pileL)
    (stack pileM) (stack table)

    ;; blocks
    (block A) (block B) (block C) (block D) (block E) (block F) (block G)
    (block H) (block I) (block J) (block K) (block L) (block M)

    ;; consonant / vowel classification
    (vowel A) (vowel E) (vowel I)
    (consonant B) (consonant C) (consonant D) (consonant F)
    (consonant G) (consonant H) (consonant J) (consonant K)
    (consonant L) (consonant M)

    ;; Movable consonants (consonant_agent's permission list)
    (movable B) (movable C) (movable D) (movable F)
    (movable G) (movable H) (movable J) (movable K)
    (movable L) (movable M)

    ;; Initial public environment state: each block sits alone on its own pile (top indicated)
    ;; Pile naming corresponds to the block on top (top on left)
    ;; This satisfies the agents' assumption that A is top of Pile1 (pileA), E top of Pile2 (pileE), I top of Pile3 (pileI)
    (on A pileA) (clear A)
    (on B pileB) (clear B)
    (on C pileC) (clear C)
    (on D pileD) (clear D)
    (on E pileE) (clear E)
    (on F pileF) (clear F)
    (on G pileG) (clear G)
    (on H pileH) (clear H)
    (on I pileI) (clear I)
    (on J pileJ) (clear J)
    (on K pileK) (clear K)
    (on L pileL) (clear L)
    (on M pileM) (clear M)

    ;; table (target stack / GoalStack) starts empty (no (on ? table) facts)
  )

  (:goal (and
    ;; target final stack (top to bottom): A on B on C on D on E on F on G on H on I on J on K on L on M, and M on table
    (on A B)
    (on B C)
    (on C D)
    (on D E)
    (on E F)
    (on F G)
    (on G H)
    (on H I)
    (on I J)
    (on J K)
    (on K L)
    (on L M)
    (on M table)
  ))