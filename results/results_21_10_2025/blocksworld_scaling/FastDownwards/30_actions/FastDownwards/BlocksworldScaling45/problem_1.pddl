(define (problem blocksworld-orchestrated)
  (:domain blocksworld-multiagent)

  ;; Objects: two table places and 15 blocks
  (:objects
    pos1 pos2 - place
    O A K L D C N B J G I E M H F - block
    ;; declare that places are also supports (we use support type in predicates)
    ;; In this PDDL typing, 'place' is a subtype of 'support' implicitly via usage.
  )

  ;; Assumptions and modelling notes:
  ;; - Conservative assumption: O is treated as immobile (encoded with (immobile O)).
  ;;   This anchors the goal stack to a fixed table place (pos1) and prevents the solver
  ;;   from moving O away. The human specification required O to be on the table in the goal;
  ;;   treating it immobile is a conservative resolution that simplifies coordination.
  ;; - Agents' capabilities are modelled by two separate actions (move-vowel and move-consonant).
  ;; - Only top supports may be used as move sources/destinations; top facts are maintained
  ;;   explicitly and updated by actions.
  ;; - There are exactly two table places (pos1 and pos2); the planner cannot create new places.

  (:init
    ;; Initial stacks encoded as on predicates (bottom -> top).

    ;; Stack at pos1 from bottom to top: O, K, B, J, M, F
    (on O pos1)
    (on K O)
    (on B K)
    (on J B)
    (on M J)
    (on F M)

    ;; Stack at pos2 from bottom to top: A, L, D, C, N, G, I, E, H
    (on A pos2)
    (on L A)
    (on D L)
    (on C D)
    (on N C)
    (on G N)
    (on I G)
    (on E I)
    (on H E)

    ;; Top facts: initially the tops are F (pos1 top) and H (pos2 top)
    (top F)
    (top H)

    ;; Label vowels and consonants (explicit according to the specification)
    (vowel A)
    (vowel E)
    (vowel I)
    (vowel O)

    (consonant K)
    (consonant L)
    (consonant D)
    (consonant C)
    (consonant N)
    (consonant G)
    (consonant B)
    (consonant J)
    (consonant M)
    (consonant H)
    (consonant F)

    ;; Conservative anchoring assumption used to make the planning problem tractable:
    ;; O will remain on the table (pos1) and cannot be moved by either agent.
    (immobile O)
  )

  ;; Goal: form a single chain with O on the table and then above it N, M, L, K, J, I, H, G, F, E, D, C, B, A.
  ;; The goal does not mention which table position is used in general, but we have anchored O to pos1.
  (:goal (and
    (on O pos1)
    (on N O)
    (on M N)
    (on L M)
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
  ))
)