(define (domain blocksworld-sequence)
  (:requirements :strips :typing :negative-preconditions)
  (:types block time)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (at-step ?s - time)
  )

  (:action a1-unstack-G-J
    :parameters ()
    :precondition (and (at-step step0) (on G J) (clear G) (handempty))
    :effect (and
      (not (on G J))
      (clear J)
      (holding G)
      (not (clear G))
      (not (handempty))
      (not (at-step step0))
      (at-step step1)
    )
  )

  (:action a2-putdown-G
    :parameters ()
    :precondition (and (at-step step1) (holding G))
    :effect (and
      (ontable G)
      (clear G)
      (not (holding G))
      (handempty)
      (not (at-step step1))
      (at-step step2)
    )
  )

  (:action a3-pickup-E
    :parameters ()
    :precondition (and (at-step step2) (ontable E) (clear E) (handempty))
    :effect (and
      (not (ontable E))
      (not (clear E))
      (holding E)
      (not (handempty))
      (not (at-step step2))
      (at-step step3)
    )
  )

  (:action a4-stack-E-A
    :parameters ()
    :precondition (and (at-step step3) (holding E) (clear A))
    :effect (and
      (on E A)
      (clear E)
      (not (clear A))
      (not (holding E))
      (handempty)
      (not (at-step step3))
      (at-step step4)
    )
  )

  (:action a5-unstack-J-C
    :parameters ()
    :precondition (and (at-step step4) (on J C) (clear J) (handempty))
    :effect (and
      (not (on J C))
      (clear C)
      (holding J)
      (not (clear J))
      (not (handempty))
      (not (at-step step4))
      (at-step step5)
    )
  )

  (:action a6-stack-J-D
    :parameters ()
    :precondition (and (at-step step5) (holding J) (clear D))
    :effect (and
      (on J D)
      (clear J)
      (not (clear D))
      (not (holding J))
      (handempty)
      (not (at-step step5))
      (at-step step6)
    )
  )

  (:action a7-pickup-B
    :parameters ()
    :precondition (and (at-step step6) (ontable B) (clear B) (handempty))
    :effect (and
      (not (ontable B))
      (not (clear B))
      (holding B)
      (not (handempty))
      (not (at-step step6))
      (at-step step7)
    )
  )

  (:action a8-stack-B-E
    :parameters ()
    :precondition (and (at-step step7) (holding B) (clear E))
    :effect (and
      (on B E)
      (clear B)
      (not (clear E))
      (not (holding B))
      (handempty)
      (not (at-step step7))
      (at-step step8)
    )
  )

  (:action a9-unstack-C-F
    :parameters ()
    :precondition (and (at-step step8) (on C F) (clear C) (handempty))
    :effect (and
      (not (on C F))
      (clear F)
      (holding C)
      (not (clear C))
      (not (handempty))
      (not (at-step step8))
      (at-step step9)
    )
  )

  (:action a10-stack-C-F
    :parameters ()
    :precondition (and (at-step step9) (holding C) (clear F))
    :effect (and
      (on C F)
      (clear C)
      (not (clear F))
      (not (holding C))
      (handempty)
      (not (at-step step9))
      (at-step step10)
    )
  )

  (:action a11-unstack-J-D
    :parameters ()
    :precondition (and (at-step step10) (on J D) (clear J) (handempty))
    :effect (and
      (not (on J D))
      (clear D)
      (holding J)
      (not (clear J))
      (not (handempty))
      (not (at-step step10))
      (at-step step11)
    )
  )

  (:action a12-stack-J-B
    :parameters ()
    :precondition (and (at-step step11) (holding J) (clear B))
    :effect (and
      (on J B)
      (clear J)
      (not (clear B))
      (not (holding J))
      (handempty)
      (not (at-step step11))
      (at-step step12)
    )
  )

  (:action a13-pickup-D
    :parameters ()
    :precondition (and (at-step step12) (ontable D) (clear D) (handempty))
    :effect (and
      (not (ontable D))
      (not (clear D))
      (holding D)
      (not (handempty))
      (not (at-step step12))
      (at-step step13)
    )
  )

  (:action a14-putdown-D
    :parameters ()
    :precondition (and (at-step step13) (holding D))
    :effect (and
      (ontable D)
      (clear D)
      (not (holding D))
      (handempty)
      (not (at-step step13))
      (at-step step14)
    )
  )

  (:action a15-unstack-C-F
    :parameters ()
    :precondition (and (at-step step14) (on C F) (clear C) (handempty))
    :effect (and
      (not (on C F))
      (clear F)
      (holding C)
      (not (clear C))
      (not (handempty))
      (not (at-step step14))
      (at-step step15)
    )
  )

  (:action a16-stack-C-F
    :parameters ()
    :precondition (and (at-step step15) (holding C) (clear F))
    :effect (and
      (on C F)
      (clear C)
      (not (clear F))
      (not (holding C))
      (handempty)
      (not (at-step step15))
      (at-step step16)
    )
  )

  (:action a17-unstack-J-B
    :parameters ()
    :precondition (and (at-step step16) (on J B) (clear J) (handempty))
    :effect (and
      (not (on J B))
      (clear B)
      (holding J)
      (not (clear J))
      (not (handempty))
      (not (at-step step16))
      (at-step step17)
    )
  )

  (:action a18-stack-J-C
    :parameters ()
    :precondition (and (at-step step17) (holding J) (clear C))
    :effect (and
      (on J C)
      (clear J)
      (not (clear C))
      (not (holding J))
      (handempty)
      (not (at-step step17))
      (at-step step18)
    )
  )

  (:action a19-pickup-G
    :parameters ()
    :precondition (and (at-step step18) (ontable G) (clear G) (handempty))
    :effect (and
      (not (ontable G))
      (not (clear G))
      (holding G)
      (not (handempty))
      (not (at-step step18))
      (at-step step19)
    )
  )

  (:action a20-stack-G-D
    :parameters ()
    :precondition (and (at-step step19) (holding G) (clear D))
    :effect (and
      (on G D)
      (clear G)
      (not (clear D))
      (not (holding G))
      (handempty)
      (not (at-step step19))
      (at-step step20)
    )
  )

)