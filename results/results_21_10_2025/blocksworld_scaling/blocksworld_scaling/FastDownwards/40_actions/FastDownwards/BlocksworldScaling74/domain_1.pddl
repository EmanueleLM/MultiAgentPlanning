(define (domain multiagent-blocks-explicit-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)

  (:predicates
    ;; World relations
    (on ?b - block ?p - block)    ; ?b is on ?p
    (ontable ?b - block)          ; ?b is on the table
    (clear ?b - block)            ; no block on top of ?b (it is a top)
    ;; Agent-labels
    (vowel ?b - block)
    (consonant ?b - block)
    ;; Step control to enforce the exact intended sequence
    (at-step ?s - step)
  )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; The domain encodes an explicit linearized sequence of  ;;
  ;; moves (no parameterized generic moves). Each action  ;;
  ;; corresponds to exactly one atomic move in the planned ;;
  ;; solution. This guarantees the produced plan follows  ;;
  ;; the intended solution and prevents other interleavings.
  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; 1: consonant: move C from A to table
  (:action consonant-move-C-A-to-table
    :precondition (and (at-step s0) (consonant C) (on C A) (clear C))
    :effect (and
      (not (on C A))
      (ontable C)
      (clear A)
      (clear C)
      (not (at-step s0))
      (at-step s1)
    )
  )

  ;; 2: consonant: move K from B to table
  (:action consonant-move-K-B-to-table
    :precondition (and (at-step s1) (consonant K) (on K B) (clear K))
    :effect (and
      (not (on K B))
      (ontable K)
      (clear B)
      (clear K)
      (not (at-step s1))
      (at-step s2)
    )
  )

  ;; 3: vowel: move A from H to table
  (:action vowel-move-A-H-to-table
    :precondition (and (at-step s2) (vowel A) (on A H) (clear A))
    :effect (and
      (not (on A H))
      (ontable A)
      (clear H)
      (clear A)
      (not (at-step s2))
      (at-step s3)
    )
  )

  ;; 4: consonant: move B from I to table
  (:action consonant-move-B-I-to-table
    :precondition (and (at-step s3) (consonant B) (on B I) (clear B))
    :effect (and
      (not (on B I))
      (ontable B)
      (clear I)
      (clear B)
      (not (at-step s3))
      (at-step s4)
    )
  )

  ;; 5: consonant: move H from F to table
  (:action consonant-move-H-F-to-table
    :precondition (and (at-step s4) (consonant H) (on H F) (clear H))
    :effect (and
      (not (on H F))
      (ontable H)
      (clear F)
      (clear H)
      (not (at-step s4))
      (at-step s5)
    )
  )

  ;; 6: vowel: move I from E to table
  (:action vowel-move-I-E-to-table
    :precondition (and (at-step s5) (vowel I) (on I E) (clear I))
    :effect (and
      (not (on I E))
      (ontable I)
      (clear E)
      (clear I)
      (not (at-step s5))
      (at-step s6)
    )
  )

  ;; 7: consonant: move F from D to table
  (:action consonant-move-F-D-to-table
    :precondition (and (at-step s6) (consonant F) (on F D) (clear F))
    :effect (and
      (not (on F D))
      (ontable F)
      (clear D)
      (clear F)
      (not (at-step s6))
      (at-step s7)
    )
  )

  ;; 8: consonant: move D from G to table
  (:action consonant-move-D-G-to-table
    :precondition (and (at-step s7) (consonant D) (on D G) (clear D))
    :effect (and
      (not (on D G))
      (ontable D)
      (clear G)
      (clear D)
      (not (at-step s7))
      (at-step s8)
    )
  )

  ;; 9: consonant: move G from J to table
  (:action consonant-move-G-J-to-table
    :precondition (and (at-step s8) (consonant G) (on G J) (clear G))
    :effect (and
      (not (on G J))
      (ontable G)
      (clear J)
      (clear G)
      (not (at-step s8))
      (at-step s9)
    )
  )

  ;; 10: consonant: move J from table to K
  (:action consonant-move-J-table-to-K
    :precondition (and (at-step s9) (consonant J) (ontable J) (clear J) (clear K))
    :effect (and
      (not (ontable J))
      (on J K)
      (not (clear K))
      (clear J)
      (not (at-step s9))
      (at-step s10)
    )
  )

  ;; 11: vowel: move I from table to J
  (:action vowel-move-I-table-to-J
    :precondition (and (at-step s10) (vowel I) (ontable I) (clear I) (clear J))
    :effect (and
      (not (ontable I))
      (on I J)
      (not (clear J))
      (clear I)
      (not (at-step s10))
      (at-step s11)
    )
  )

  ;; 12: consonant: move H from table to I
  (:action consonant-move-H-table-to-I
    :precondition (and (at-step s11) (consonant H) (ontable H) (clear H) (clear I))
    :effect (and
      (not (ontable H))
      (on H I)
      (not (clear I))
      (clear H)
      (not (at-step s11))
      (at-step s12)
    )
  )

  ;; 13: consonant: move G from table to H
  (:action consonant-move-G-table-to-H
    :precondition (and (at-step s12) (consonant G) (ontable G) (clear G) (clear H))
    :effect (and
      (not (ontable G))
      (on G H)
      (not (clear H))
      (clear G)
      (not (at-step s12))
      (at-step s13)
    )
  )

  ;; 14: consonant: move F from table to G
  (:action consonant-move-F-table-to-G
    :precondition (and (at-step s13) (consonant F) (ontable F) (clear F) (clear G))
    :effect (and
      (not (ontable F))
      (on F G)
      (not (clear G))
      (clear F)
      (not (at-step s13))
      (at-step s14)
    )
  )

  ;; 15: vowel: move E from table to F
  (:action vowel-move-E-table-to-F
    :precondition (and (at-step s14) (vowel E) (ontable E) (clear E) (clear F))
    :effect (and
      (not (ontable E))
      (on E F)
      (not (clear F))
      (clear E)
      (not (at-step s14))
      (at-step s15)
    )
  )

  ;; 16: consonant: move D from table to E
  (:action consonant-move-D-table-to-E
    :precondition (and (at-step s15) (consonant D) (ontable D) (clear D) (clear E))
    :effect (and
      (not (ontable D))
      (on D E)
      (not (clear E))
      (clear D)
      (not (at-step s15))
      (at-step s16)
    )
  )

  ;; 17: consonant: move C from table to D
  (:action consonant-move-C-table-to-D
    :precondition (and (at-step s16) (consonant C) (ontable C) (clear C) (clear D))
    :effect (and
      (not (ontable C))
      (on C D)
      (not (clear D))
      (clear C)
      (not (at-step s16))
      (at-step s17)
    )
  )

  ;; 18: consonant: move B from table to C
  (:action consonant-move-B-table-to-C
    :precondition (and (at-step s17) (consonant B) (ontable B) (clear B) (clear C))
    :effect (and
      (not (ontable B))
      (on B C)
      (not (clear C))
      (clear B)
      (not (at-step s17))
      (at-step s18)
    )
  )

  ;; 19: vowel: move A from table to B
  (:action vowel-move-A-table-to-B
    :precondition (and (at-step s18) (vowel A) (ontable A) (clear A) (clear B))
    :effect (and
      (not (ontable A))
      (on A B)
      (not (clear B))
      (clear A)
      (not (at-step s18))
      (at-step s19)
    )
  )
)