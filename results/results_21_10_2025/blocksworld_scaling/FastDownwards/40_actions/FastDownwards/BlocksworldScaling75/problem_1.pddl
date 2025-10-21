(define (problem BlocksworldScaling75-problem)
  (:domain vowel-consonant-blocks)

  ;; Objects: all blocks, one table, and the three agents.
  (:objects
    K G D F I E O N B H M A J L C - object
    table1 - object
    vowel_agent consonant_agent orchestrator - agent
  )

  (:init
    ;; Object typing via predicates
    (table table1)

    (block K) (block G) (block D) (block F) (block I) (block E) (block O)
    (block N) (block B) (block H) (block M) (block A) (block J) (block L) (block C)

    ;; Which blocks are vowels and consonants (private capability encoded publicly for planning)
    ;; Vowels: A, E, I, O
    (vowel A) (vowel E) (vowel I) (vowel O)
    ;; Consonants: K G D F N B H M J L C
    (consonant K) (consonant G) (consonant D) (consonant F) (consonant N)
    (consonant B) (consonant H) (consonant M) (consonant J) (consonant L) (consonant C)

    ;; Agents roles
    (vowel-agent vowel_agent)
    (consonant-agent consonant_agent)
    ;; orchestrator present but does not act
    ;; Note: we do not need a predicate for orchestrator, included as an object for completeness

    ;; Initial on-relations as specified:
    ;; K on table1
    (on K table1)
    ;; N on top of K
    (on N K)
    ;; H on top of N
    (on H N)

    ;; G on table1
    (on G table1)
    ;; E on top of G
    (on E G)
    ;; B on top of E
    (on B E)
    ;; L on top of B
    (on L B)
    ;; C on top of L
    (on C L)

    ;; D on table1
    (on D table1)
    ;; F on top of D
    (on F D)
    ;; O on top of F
    (on O F)

    ;; I on table1
    (on I table1)
    ;; M on top of I
    (on M I)
    ;; A on top of M
    (on A M)
    ;; J on top of A
    (on J A)

    ;; Clear facts for topmost blocks of each stack (nothing on top)
    ;; As derived from the initial stacking:
    (clear H)   ;; top of K-N-H stack
    (clear C)   ;; top of G-E-B-L-C stack
    (clear O)   ;; top of D-F-O stack
    (clear J)   ;; top of I-M-A-J stack

    ;; Note: We do NOT assert (clear ...) for blocks that have blocks on top of them.
    ;; The table is intentionally left without a (clear table1) predicate because multiple blocks
    ;; may be directly on the table at once and table-clearness is not enforced.
  )

  (:goal (and
    ;; Goal stack top-to-bottom: A on B on C on D on E on F on G on H on I on J on K on L on M on N on O
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
    (on M N)
    (on N O)
    (on O table1)
  ))

  ;; Comments / assumptions:
  ;; - The domain encodes the restriction that only vowel_agent may move (parameters require vowel-agent),
  ;;   and only vowel blocks may be moved by those actions; analogously for consonant_agent.
  ;; - Only blocks that are (clear ?) may be picked up, and only blocks (and the table) may be destinations.
  ;; - By splitting actions by source-type (block/table) and target-type (block/table), the model correctly
  ;;   maintains 'clear' for blocks while allowing multiple blocks on the table.