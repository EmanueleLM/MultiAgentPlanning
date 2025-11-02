(define (domain blocksworld_sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)
  (:predicates
    (on ?b - block ?x - block)     ; b is on another block x
    (ontable ?b - block)           ; b is on the table
    (clear ?b - block)             ; nothing on b
    (holding ?b - block)           ; some (the system) holds b
    (freehand)                     ; no block currently held (resource)
    (at-step ?s - step)            ; current step marker
  )

  ;; Unstack actions (specific to each sequence step where an unstack occurs).
  (:action s1_unstack_K_M
    :precondition (and (at-step s0) (on K M) (clear K) (freehand))
    :effect (and
      (not (on K M))
      (not (ontable K))
      (holding K)
      (clear M)
      (not (clear K))
      (not (freehand))
      (not (at-step s0))
      (at-step s1)
    )
  )

  (:action s3_unstack_B_H
    :precondition (and (at-step s2) (on B H) (clear B) (freehand))
    :effect (and
      (not (on B H))
      (not (ontable B))
      (holding B)
      (clear H)
      (not (clear B))
      (not (freehand))
      (not (at-step s2))
      (at-step s3)
    )
  )

  (:action s5_unstack_K_C
    :precondition (and (at-step s4) (on K C) (clear K) (freehand))
    :effect (and
      (not (on K C))
      (not (ontable K))
      (holding K)
      (clear C)
      (not (clear K))
      (not (freehand))
      (not (at-step s4))
      (at-step s5)
    )
  )

  (:action s7_unstack_K_A
    :precondition (and (at-step s6) (on K A) (clear K) (freehand))
    :effect (and
      (not (on K A))
      (not (ontable K))
      (holding K)
      (clear A)
      (not (clear K))
      (not (freehand))
      (not (at-step s6))
      (at-step s7)
    )
  )

  (:action s9_unstack_K_B
    :precondition (and (at-step s8) (on K B) (clear K) (freehand))
    :effect (and
      (not (on K B))
      (not (ontable K))
      (holding K)
      (clear B)
      (not (clear K))
      (not (freehand))
      (not (at-step s8))
      (at-step s9)
    )
  )

  (:action s11_pickup_B
    :precondition (and (at-step s10) (ontable B) (clear B) (freehand))
    :effect (and
      (not (ontable B))
      (holding B)
      (not (clear B))
      (not (freehand))
      (not (at-step s10))
      (at-step s11)
    )
  )

  (:action s13_unstack_K_A
    :precondition (and (at-step s12) (on K A) (clear K) (freehand))
    :effect (and
      (not (on K A))
      (not (ontable K))
      (holding K)
      (clear A)
      (not (clear K))
      (not (freehand))
      (not (at-step s12))
      (at-step s13)
    )
  )

  (:action s15_unstack_M_G
    :precondition (and (at-step s14) (on M G) (clear M) (freehand))
    :effect (and
      (not (on M G))
      (not (ontable M))
      (holding M)
      (clear G)
      (not (clear M))
      (not (freehand))
      (not (at-step s14))
      (at-step s15)
    )
  )

  (:action s17_unstack_H_I
    :precondition (and (at-step s16) (on H I) (clear H) (freehand))
    :effect (and
      (not (on H I))
      (not (ontable H))
      (holding H)
      (clear I)
      (not (clear H))
      (not (freehand))
      (not (at-step s16))
      (at-step s17)
    )
  )

  (:action s19_unstack_B_C
    :precondition (and (at-step s18) (on B C) (clear B) (freehand))
    :effect (and
      (not (on B C))
      (not (ontable B))
      (holding B)
      (clear C)
      (not (clear B))
      (not (freehand))
      (not (at-step s18))
      (at-step s19)
    )
  )

  (:action s21_unstack_M_K
    :precondition (and (at-step s20) (on M K) (clear M) (freehand))
    :effect (and
      (not (on M K))
      (not (ontable M))
      (holding M)
      (clear K)
      (not (clear M))
      (not (freehand))
      (not (at-step s20))
      (at-step s21)
    )
  )

  (:action s23_unstack_B_G
    :precondition (and (at-step s22) (on B G) (clear B) (freehand))
    :effect (and
      (not (on B G))
      (not (ontable B))
      (holding B)
      (clear G)
      (not (clear B))
      (not (freehand))
      (not (at-step s22))
      (at-step s23)
    )
  )

  (:action s25_unstack_B_H
    :precondition (and (at-step s24) (on B H) (clear B) (freehand))
    :effect (and
      (not (on B H))
      (not (ontable B))
      (holding B)
      (clear H)
      (not (clear B))
      (not (freehand))
      (not (at-step s24))
      (at-step s25)
    )
  )

  (:action s27_unstack_K_A
    :precondition (and (at-step s26) (on K A) (clear K) (freehand))
    :effect (and
      (not (on K A))
      (not (ontable K))
      (holding K)
      (clear A)
      (not (clear K))
      (not (freehand))
      (not (at-step s26))
      (at-step s27)
    )
  )

  (:action s29_unstack_H_I
    :precondition (and (at-step s28) (on H I) (clear H) (freehand))
    :effect (and
      (not (on H I))
      (not (ontable H))
      (holding H)
      (clear I)
      (not (clear H))
      (not (freehand))
      (not (at-step s28))
      (at-step s29)
    )
  )

  (:action s31_unstack_H_K
    :precondition (and (at-step s30) (on H K) (clear H) (freehand))
    :effect (and
      (not (on H K))
      (not (ontable H))
      (holding H)
      (clear K)
      (not (clear H))
      (not (freehand))
      (not (at-step s30))
      (at-step s31)
    )
  )

  (:action s33_unstack_K_B
    :precondition (and (at-step s32) (on K B) (clear K) (freehand))
    :effect (and
      (not (on K B))
      (not (ontable K))
      (holding K)
      (clear B)
      (not (clear K))
      (not (freehand))
      (not (at-step s32))
      (at-step s33)
    )
  )

  (:action s35_unstack_H_I
    :precondition (and (at-step s34) (on H I) (clear H) (freehand))
    :effect (and
      (not (on H I))
      (not (ontable H))
      (holding H)
      (clear I)
      (not (clear H))
      (not (freehand))
      (not (at-step s34))
      (at-step s35)
    )
  )

  (:action s37_unstack_A_F
    :precondition (and (at-step s36) (on A F) (clear A) (freehand))
    :effect (and
      (not (on A F))
      (not (ontable A))
      (holding A)
      (clear F)
      (not (clear A))
      (not (freehand))
      (not (at-step s36))
      (at-step s37)
    )
  )

  (:action s39_unstack_A_F
    :precondition (and (at-step s38) (on A F) (clear A) (freehand))
    :effect (and
      (not (on A F))
      (not (ontable A))
      (holding A)
      (clear F)
      (not (clear A))
      (not (freehand))
      (not (at-step s38))
      (at-step s39)
    )
  )

  (:action s41_pickup_I
    :precondition (and (at-step s40) (ontable I) (clear I) (freehand))
    :effect (and
      (not (ontable I))
      (holding I)
      (not (clear I))
      (not (freehand))
      (not (at-step s40))
      (at-step s41)
    )
  )

  (:action s43_pickup_I
    :precondition (and (at-step s42) (ontable I) (clear I) (freehand))
    :effect (and
      (not (ontable I))
      (holding I)
      (not (clear I))
      (not (freehand))
      (not (at-step s42))
      (at-step s43)
    )
  )

  (:action s45_unstack_K_M
    :precondition (and (at-step s44) (on K M) (clear K) (freehand))
    :effect (and
      (not (on K M))
      (not (ontable K))
      (holding K)
      (clear M)
      (not (clear K))
      (not (freehand))
      (not (at-step s44))
      (at-step s45)
    )
  )

  (:action s47_unstack_K_M
    :precondition (and (at-step s46) (on K M) (clear K) (freehand))
    :effect (and
      (not (on K M))
      (not (ontable K))
      (holding K)
      (clear M)
      (not (clear K))
      (not (freehand))
      (not (at-step s46))
      (at-step s47)
    )
  )

  (:action s49_unstack_M_C
    :precondition (and (at-step s48) (on M C) (clear M) (freehand))
    :effect (and
      (not (on M C))
      (not (ontable M))
      (holding M)
      (clear C)
      (not (clear M))
      (not (freehand))
      (not (at-step s48))
      (at-step s49)
    )
  )

  ;; Stack actions (corresponding to each sequence stack)
  (:action s2_stack_K_C
    :precondition (and (at-step s1) (holding K) (clear C))
    :effect (and
      (not (holding K))
      (on K C)
      (not (clear C))
      (clear K)
      (freehand)
      (not (at-step s1))
      (at-step s2)
    )
  )

  (:action s4_putdown_B
    :precondition (and (at-step s3) (holding B))
    :effect (and
      (not (holding B))
      (ontable B)
      (clear B)
      (freehand)
      (not (at-step s3))
      (at-step s4)
    )
  )

  (:action s6_stack_K_A
    :precondition (and (at-step s5) (holding K) (clear A))
    :effect (and
      (not (holding K))
      (on K A)
      (not (clear A))
      (clear K)
      (freehand)
      (not (at-step s5))
      (at-step s6)
    )
  )

  (:action s8_stack_K_B
    :precondition (and (at-step s7) (holding K) (clear B))
    :effect (and
      (not (holding K))
      (on K B)
      (not (clear B))
      (clear K)
      (freehand)
      (not (at-step s7))
      (at-step s8)
    )
  )

  (:action s10_stack_K_A
    :precondition (and (at-step s9) (holding K) (clear A))
    :effect (and
      (not (holding K))
      (on K A)
      (not (clear A))
      (clear K)
      (freehand)
      (not (at-step s9))
      (at-step s10)
    )
  )

  (:action s12_stack_B_C
    :precondition (and (at-step s11) (holding B) (clear C))
    :effect (and
      (not (holding B))
      (on B C)
      (not (clear C))
      (clear B)
      (freehand)
      (not (at-step s11))
      (at-step s12)
    )
  )

  (:action s14_stack_K_A
    :precondition (and (at-step s13) (holding K) (clear A))
    :effect (and
      (not (holding K))
      (on K A)
      (not (clear A))
      (clear K)
      (freehand)
      (not (at-step s13))
      (at-step s14)
    )
  )

  (:action s16_stack_M_K
    :precondition (and (at-step s15) (holding M) (clear K))
    :effect (and
      (not (holding M))
      (on M K)
      (not (clear K))
      (clear M)
      (freehand)
      (not (at-step s15))
      (at-step s16)
    )
  )

  (:action s18_stack_H_I
    :precondition (and (at-step s17) (holding H) (clear I))
    :effect (and
      (not (holding H))
      (on H I)
      (not (clear I))
      (clear H)
      (freehand)
      (not (at-step s17))
      (at-step s18)
    )
  )

  (:action s20_stack_B_G
    :precondition (and (at-step s19) (holding B) (clear G))
    :effect (and
      (not (holding B))
      (on B G)
      (not (clear G))
      (clear B)
      (freehand)
      (not (at-step s19))
      (at-step s20)
    )
  )

  (:action s22_stack_M_C
    :precondition (and (at-step s21) (holding M) (clear C))
    :effect (and
      (not (holding M))
      (on M C)
      (not (clear C))
      (clear M)
      (freehand)
      (not (at-step s21))
      (at-step s22)
    )
  )

  (:action s24_stack_B_H
    :precondition (and (at-step s23) (holding B) (clear H))
    :effect (and
      (not (holding B))
      (on B H)
      (not (clear H))
      (clear B)
      (freehand)
      (not (at-step s23))
      (at-step s24)
    )
  )

  (:action s26_stack_B_G
    :precondition (and (at-step s25) (holding B) (clear G))
    :effect (and
      (not (holding B))
      (on B G)
      (not (clear G))
      (clear B)
      (freehand)
      (not (at-step s25))
      (at-step s26)
    )
  )

  (:action s28_stack_K_B
    :precondition (and (at-step s27) (holding K) (clear B))
    :effect (and
      (not (holding K))
      (on K B)
      (not (clear B))
      (clear K)
      (freehand)
      (not (at-step s27))
      (at-step s28)
    )
  )

  (:action s30_stack_H_K
    :precondition (and (at-step s29) (holding H) (clear K))
    :effect (and
      (not (holding H))
      (on H K)
      (not (clear K))
      (clear H)
      (freehand)
      (not (at-step s29))
      (at-step s30)
    )
  )

  (:action s32_stack_H_I
    :precondition (and (at-step s31) (holding H) (clear I))
    :effect (and
      (not (holding H))
      (on H I)
      (not (clear I))
      (clear H)
      (freehand)
      (not (at-step s31))
      (at-step s32)
    )
  )

  (:action s34_stack_K_M
    :precondition (and (at-step s33) (holding K) (clear M))
    :effect (and
      (not (holding K))
      (on K M)
      (not (clear M))
      (clear K)
      (freehand)
      (not (at-step s33))
      (at-step s34)
    )
  )

  (:action s36_stack_H_B
    :precondition (and (at-step s35) (holding H) (clear B))
    :effect (and
      (not (holding H))
      (on H B)
      (not (clear B))
      (clear H)
      (freehand)
      (not (at-step s35))
      (at-step s36)
    )
  )

  (:action s38_stack_A_F
    :precondition (and (at-step s37) (holding A) (clear F))
    :effect (and
      (not (holding A))
      (on A F)
      (not (clear F))
      (clear A)
      (freehand)
      (not (at-step s37))
      (at-step s38)
    )
  )

  (:action s40_putdown_A
    :precondition (and (at-step s39) (holding A))
    :effect (and
      (not (holding A))
      (ontable A)
      (clear A)
      (freehand)
      (not (at-step s39))
      (at-step s40)
    )
  )

  (:action s42_putdown_I
    :precondition (and (at-step s41) (holding I))
    :effect (and
      (not (holding I))
      (ontable I)
      (clear I)
      (freehand)
      (not (at-step s41))
      (at-step s42)
    )
  )

  (:action s44_stack_I_F
    :precondition (and (at-step s43) (holding I) (clear F))
    :effect (and
      (not (holding I))
      (on I F)
      (not (clear F))
      (clear I)
      (freehand)
      (not (at-step s43))
      (at-step s44)
    )
  )

  (:action s46_stack_K_M
    :precondition (and (at-step s45) (holding K) (clear M))
    :effect (and
      (not (holding K))
      (on K M)
      (not (clear M))
      (clear K)
      (freehand)
      (not (at-step s45))
      (at-step s46)
    )
  )

  (:action s48_stack_K_H
    :precondition (and (at-step s47) (holding K) (clear H))
    :effect (and
      (not (holding K))
      (on K H)
      (not (clear H))
      (clear K)
      (freehand)
      (not (at-step s47))
      (at-step s48)
    )
  )

  (:action s50_putdown_M
    :precondition (and (at-step s49) (holding M))
    :effect (and
      (not (holding M))
      (ontable M)
      (clear M)
      (freehand)
      (not (at-step s49))
      (at-step s50)
    )
  )
)