(define (problem multiagent-blocks-problem)
  (:domain multi-agent-blocks)
  (:objects
    vowel_agent cons_agent
    A B C D E F G H I J K L M
  )

  (:init
    ;; agents
    (agent vowel_agent)
    (agent cons_agent)

    ;; authorization: vowel_agent can move vowels A E I (per first agent info)
    (can-move vowel_agent A)
    (can-move vowel_agent E)
    (can-move vowel_agent I)

    ;; cons_agent authorization (keeps parity with first agent's view):
    ;; cons_agent is allowed to manipulate consonants (explicit can-move entries are optional
    ;; for cons actions because cons actions require (consonant ?x); included for clarity)
    (can-move cons_agent M)
    (can-move cons_agent H)
    (can-move cons_agent G)
    (can-move cons_agent B)
    (can-move cons_agent L)
    (can-move cons_agent D)
    (can-move cons_agent F)
    (can-move cons_agent C)
    (can-move cons_agent K)
    (can-move cons_agent J)

    ;; consonant classification (per second agent info)
    (consonant M)
    (consonant H)
    (consonant G)
    (consonant B)
    (consonant L)
    (consonant D)
    (consonant F)
    (consonant C)
    (consonant K)
    (consonant J)

    ;; initial configuration (stacks as provided)
    ;; stack 1: M (table) <- I <- K <- A (top)
    (ontable M)
    (on I M)
    (on K I)
    (on A K)

    ;; stack 2: E (table) <- L <- D <- F <- J (top)
    (ontable E)
    (on L E)
    (on D L)
    (on F D)
    (on J F)

    ;; stack 3: G (table) <- B <- C (top)
    (ontable G)
    (on B G)
    (on C B)

    ;; H on table alone
    (ontable H)

    ;; clear (top) blocks initially
    (clear A)
    (clear J)
    (clear C)
    (clear H)

    ;; consonant agent's hand is empty initially
    (handempty cons_agent)
  )

  (:goal (and
    ;; target stack: A on B, B on C, C on D, D on E, E on F, F on G, G on H,
    ;; H on I, I on J, J on K, K on L, L on M, and M on table
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
    (ontable M)
  ))
)