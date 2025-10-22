(define (domain blocks-world-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block step)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (done ?s - step)
  )

  ;; Step 1: unstack(E, H)
  (:action step1-unstack-E-H
    :precondition (and
      (done s0)
      (not (done s1))
      (on E H)
      (clear E)
      (handempty)
    )
    :effect (and
      (holding E)
      (clear H)
      (not (on E H))
      (not (clear E))
      (not (handempty))
      (done s1)
      (not (done s0))
    )
  )

  ;; Step 2: stack(E, H)
  (:action step2-stack-E-H
    :precondition (and
      (done s1)
      (not (done s2))
      (holding E)
      (clear H)
    )
    :effect (and
      (on E H)
      (clear E)
      (handempty)
      (not (holding E))
      (not (clear H))
      (done s2)
      (not (done s1))
    )
  )

  ;; Step 3: unstack(E, H)
  (:action step3-unstack-E-H
    :precondition (and
      (done s2)
      (not (done s3))
      (on E H)
      (clear E)
      (handempty)
    )
    :effect (and
      (holding E)
      (clear H)
      (not (on E H))
      (not (clear E))
      (not (handempty))
      (done s3)
      (not (done s2))
    )
  )

  ;; Step 4: stack(E, D)
  (:action step4-stack-E-D
    :precondition (and
      (done s3)
      (not (done s4))
      (holding E)
      (clear D)
    )
    :effect (and
      (on E D)
      (clear E)
      (handempty)
      (not (holding E))
      (not (clear D))
      (done s4)
      (not (done s3))
    )
  )

  ;; Step 5: unstack(H, A)
  (:action step5-unstack-H-A
    :precondition (and
      (done s4)
      (not (done s5))
      (on H A)
      (clear H)
      (handempty)
    )
    :effect (and
      (holding H)
      (clear A)
      (not (on H A))
      (not (clear H))
      (not (handempty))
      (done s5)
      (not (done s4))
    )
  )

  ;; Step 6: putdown(H)
  (:action step6-putdown-H
    :precondition (and
      (done s5)
      (not (done s6))
      (holding H)
    )
    :effect (and
      (ontable H)
      (clear H)
      (handempty)
      (not (holding H))
      (done s6)
      (not (done s5))
    )
  )

  ;; Step 7: pickup(H)
  (:action step7-pickup-H
    :precondition (and
      (done s6)
      (not (done s7))
      (ontable H)
      (clear H)
      (handempty)
    )
    :effect (and
      (holding H)
      (not (ontable H))
      (not (clear H))
      (not (handempty))
      (done s7)
      (not (done s6))
    )
  )

  ;; Step 8: stack(H, E)
  (:action step8-stack-H-E
    :precondition (and
      (done s7)
      (not (done s8))
      (holding H)
      (clear E)
    )
    :effect (and
      (on H E)
      (clear H)
      (handempty)
      (not (holding H))
      (not (clear E))
      (done s8)
      (not (done s7))
    )
  )

  ;; Step 9: unstack(H, E)
  (:action step9-unstack-H-E
    :precondition (and
      (done s8)
      (not (done s9))
      (on H E)
      (clear H)
      (handempty)
    )
    :effect (and
      (holding H)
      (clear E)
      (not (on H E))
      (not (clear H))
      (not (handempty))
      (done s9)
      (not (done s8))
    )
  )

  ;; Step 10: stack(H, E)
  (:action step10-stack-H-E
    :precondition (and
      (done s9)
      (not (done s10))
      (holding H)
      (clear E)
    )
    :effect (and
      (on H E)
      (clear H)
      (handempty)
      (not (holding H))
      (not (clear E))
      (done s10)
      (not (done s9))
    )
  )

  ;; Step 11: pickup(A)
  (:action step11-pickup-A
    :precondition (and
      (done s10)
      (not (done s11))
      (ontable A)
      (clear A)
      (handempty)
    )
    :effect (and
      (holding A)
      (not (ontable A))
      (not (clear A))
      (not (handempty))
      (done s11)
      (not (done s10))
    )
  )

  ;; Step 12: putdown(A)
  (:action step12-putdown-A
    :precondition (and
      (done s11)
      (not (done s12))
      (holding A)
    )
    :effect (and
      (ontable A)
      (clear A)
      (handempty)
      (not (holding A))
      (done s12)
      (not (done s11))
    )
  )

  ;; Step 13: pickup(A)
  (:action step13-pickup-A
    :precondition (and
      (done s12)
      (not (done s13))
      (ontable A)
      (clear A)
      (handempty)
    )
    :effect (and
      (holding A)
      (not (ontable A))
      (not (clear A))
      (not (handempty))
      (done s13)
      (not (done s12))
    )
  )

  ;; Step 14: stack(A, H)
  (:action step14-stack-A-H
    :precondition (and
      (done s13)
      (not (done s14))
      (holding A)
      (clear H)
    )
    :effect (and
      (on A H)
      (clear A)
      (handempty)
      (not (holding A))
      (not (clear H))
      (done s14)
      (not (done s13))
    )
  )

  ;; Step 15: unstack(A, H)
  (:action step15-unstack-A-H
    :precondition (and
      (done s14)
      (not (done s15))
      (on A H)
      (clear A)
      (handempty)
    )
    :effect (and
      (holding A)
      (clear H)
      (not (on A H))
      (not (clear A))
      (not (handempty))
      (done s15)
      (not (done s14))
    )
  )

  ;; Step 16: stack(A, H)
  (:action step16-stack-A-H
    :precondition (and
      (done s15)
      (not (done s16))
      (holding A)
      (clear H)
    )
    :effect (and
      (on A H)
      (clear A)
      (handempty)
      (not (holding A))
      (not (clear H))
      (done s16)
      (not (done s15))
    )
  )

  ;; Step 17: unstack(A, H)
  (:action step17-unstack-A-H
    :precondition (and
      (done s16)
      (not (done s17))
      (on A H)
      (clear A)
      (handempty)
    )
    :effect (and
      (holding A)
      (clear H)
      (not (on A H))
      (not (clear A))
      (not (handempty))
      (done s17)
      (not (done s16))
    )
  )

  ;; Step 18: putdown(A)
  (:action step18-putdown-A
    :precondition (and
      (done s17)
      (not (done s18))
      (holding A)
    )
    :effect (and
      (ontable A)
      (clear A)
      (handempty)
      (not (holding A))
      (done s18)
      (not (done s17))
    )
  )

  ;; Step 19: pickup(A)
  (:action step19-pickup-A
    :precondition (and
      (done s18)
      (not (done s19))
      (ontable A)
      (clear A)
      (handempty)
    )
    :effect (and
      (holding A)
      (not (ontable A))
      (not (clear A))
      (not (handempty))
      (done s19)
      (not (done s18))
    )
  )

  ;; Step 20: stack(A, H)
  (:action step20-stack-A-H
    :precondition (and
      (done s19)
      (not (done s20))
      (holding A)
      (clear H)
    )
    :effect (and
      (on A H)
      (clear A)
      (handempty)
      (not (holding A))
      (not (clear H))
      (done s20)
      (not (done s19))
    )
  )
)