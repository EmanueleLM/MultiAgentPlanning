(define (problem Blocksworld_Sequence_Instance)
  (:domain blocksworld_sequence)
  (:objects
    A B C D E F G H I J K L M - block
    s0 s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 s11 s12 s13 s14 s15 s16 s17 s18 s19
    s20 s21 s22 s23 s24 s25 s26 s27 s28 s29 s30 s31 s32 s33 s34 s35 s36 s37
    s38 s39 s40 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 - step
  )

  (:init
    ;; step 0 initial marker
    (at-step s0)

    ;; freehand initially true (no block being held)
    (freehand)

    ;; Initial on relations (authoritative initial state)
    (on A F)
    (on B H)
    (on C D)
    (on D E)
    (ontable E)
    (on F L)
    (ontable G)
    (on H I)
    (ontable I)
    (ontable J)
    (on K M)
    (on L J)
    (on M G)

    ;; Initial clear/top facts (derived from initial stacking)
    (clear A)
    (clear B)
    (clear C)
    (clear K)

    ;; Implicit: other blocks are not clear because they have blocks above them.
    ;; No block is being held initially.
  )

  ;; Goal: require that the 50-step sequence has been executed (at-step s50).
  ;; The final configuration is not stated directly in the goal; it is implied
  ;; by performing the exact ordered sequence of actions above.
  (:goal (and (at-step s50)))
)