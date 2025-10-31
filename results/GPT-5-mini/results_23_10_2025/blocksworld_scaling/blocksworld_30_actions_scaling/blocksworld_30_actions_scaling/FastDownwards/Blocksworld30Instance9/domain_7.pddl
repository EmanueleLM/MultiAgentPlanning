(define (domain blocksworld_observed)
  (:requirements :typing :negative-preconditions)
  (:types block)
  (:constants A B C D E F G H I J K - block)
  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (done1)
    (done2)
    (done3)
    (done4)
    (done5)
    (done6)
    (done7)
    (done8)
    (done9)
    (done10)
    (done11)
    (done12)
    (done13)
    (done14)
    (done15)
    (done16)
    (done17)
    (done18)
    (done19)
    (done20)
    (done21)
    (done22)
    (done23)
    (done24)
    (done25)
    (done26)
    (done27)
    (done28)
    (done29)
    (done30)
  )

  (:action step1
    :parameters ()
    :precondition (and (ontable H) (clear H) (handempty))
    :effect (and
      (not (ontable H))
      (not (clear H))
      (not (handempty))
      (holding H)
      (done1)
    )
  )

  (:action step2
    :parameters ()
    :precondition (and (done1) (holding H) (clear F))
    :effect (and
      (not (holding H))
      (handempty)
      (on H F)
      (not (clear F))
      (clear H)
      (done2)
    )
  )

  (:action step3
    :parameters ()
    :precondition (and (done2) (on H F) (clear H) (handempty))
    :effect (and
      (not (on H F))
      (clear F)
      (not (clear H))
      (not (handempty))
      (holding H)
      (done3)
    )
  )

  (:action step4
    :parameters ()
    :precondition (and (done3) (holding H) (clear I))
    :effect (and
      (not (holding H))
      (handempty)
      (on H I)
      (not (clear I))
      (clear H)
      (done4)
    )
  )

  (:action step5
    :parameters ()
    :precondition (and (done4) (on H I) (clear H) (handempty))
    :effect (and
      (not (on H I))
      (clear I)
      (not (clear H))
      (not (handempty))
      (holding H)
      (done5)
    )
  )

  (:action step6
    :parameters ()
    :precondition (and (done5) (holding H) (clear I))
    :effect (and
      (not (holding H))
      (handempty)
      (on H I)
      (not (clear I))
      (clear H)
      (done6)
    )
  )

  (:action step7
    :parameters ()
    :precondition (and (done6) (on H I) (clear H) (handempty))
    :effect (and
      (not (on H I))
      (clear I)
      (not (clear H))
      (not (handempty))
      (holding H)
      (done7)
    )
  )

  (:action step8
    :parameters ()
    :precondition (and (done7) (holding H) (clear I))
    :effect (and
      (not (holding H))
      (handempty)
      (on H I)
      (not (clear I))
      (clear H)
      (done8)
    )
  )

  (:action step9
    :parameters ()
    :precondition (and (done8) (on H I) (clear H) (handempty))
    :effect (and
      (not (on H I))
      (clear I)
      (not (clear H))
      (not (handempty))
      (holding H)
      (done9)
    )
  )

  (:action step10
    :parameters ()
    :precondition (and (done9) (holding H))
    :effect (and
      (ontable H)
      (not (holding H))
      (handempty)
      (clear H)
      (done10)
    )
  )

  (:action step11
    :parameters ()
    :precondition (and (done10) (on I C) (clear I) (handempty))
    :effect (and
      (not (on I C))
      (clear C)
      (not (clear I))
      (not (handempty))
      (holding I)
      (done11)
    )
  )

  (:action step12
    :parameters ()
    :precondition (and (done11) (holding I))
    :effect (and
      (ontable I)
      (not (holding I))
      (handempty)
      (clear I)
      (done12)
    )
  )

  (:action step13
    :parameters ()
    :precondition (and (done12) (on C J) (clear C) (handempty))
    :effect (and
      (not (on C J))
      (clear J)
      (not (clear C))
      (not (handempty))
      (holding C)
      (done13)
    )
  )

  (:action step14
    :parameters ()
    :precondition (and (done13) (holding C) (clear F))
    :effect (and
      (not (holding C))
      (handempty)
      (on C F)
      (not (clear F))
      (clear C)
      (done14)
    )
  )

  (:action step15
    :parameters ()
    :precondition (and (done14) (on J E) (clear J) (handempty))
    :effect (and
      (not (on J E))
      (clear E)
      (not (clear J))
      (not (handempty))
      (holding J)
      (done15)
    )
  )

  (:action step16
    :parameters ()
    :precondition (and (done15) (holding J) (clear H))
    :effect (and
      (not (holding J))
      (handempty)
      (on J H)
      (not (clear H))
      (clear J)
      (done16)
    )
  )

  (:action step17
    :parameters ()
    :precondition (and (done16) (ontable I) (clear I) (handempty))
    :effect (and
      (not (ontable I))
      (not (clear I))
      (not (handempty))
      (holding I)
      (done17)
    )
  )

  (:action step18
    :parameters ()
    :precondition (and (done17) (holding I) (clear C))
    :effect (and
      (not (holding I))
      (handempty)
      (on I C)
      (not (clear C))
      (clear I)
      (done18)
    )
  )

  (:action step19
    :parameters ()
    :precondition (and (done18) (ontable E) (clear E) (handempty))
    :effect (and
      (not (ontable E))
      (not (clear E))
      (not (handempty))
      (holding E)
      (done19)
    )
  )

  (:action step20
    :parameters ()
    :precondition (and (done19) (holding E) (clear J))
    :effect (and
      (not (holding E))
      (handempty)
      (on E J)
      (not (clear J))
      (clear E)
      (done20)
    )
  )

  (:action step21
    :parameters ()
    :precondition (and (done20) (on E J) (clear E) (handempty))
    :effect (and
      (not (on E J))
      (clear J)
      (not (clear E))
      (not (handempty))
      (holding E)
      (done21)
    )
  )

  (:action step22
    :parameters ()
    :precondition (and (done21) (holding E) (clear I))
    :effect (and
      (not (holding E))
      (handempty)
      (on E I)
      (not (clear I))
      (clear E)
      (done22)
    )
  )

  (:action step23
    :parameters ()
    :precondition (and (done22) (on E I) (clear E) (handempty))
    :effect (and
      (not (on E I))
      (clear I)
      (not (clear E))
      (not (handempty))
      (holding E)
      (done23)
    )
  )

  (:action step24
    :parameters ()
    :precondition (and (done23) (holding E))
    :effect (and
      (ontable E)
      (not (holding E))
      (handempty)
      (clear E)
      (done24)
    )
  )

  (:action step25
    :parameters ()
    :precondition (and (done24) (on I C) (clear I) (handempty))
    :effect (and
      (not (on I C))
      (clear C)
      (not (clear I))
      (not (handempty))
      (holding I)
      (done25)
    )
  )

  (:action step26
    :parameters ()
    :precondition (and (done25) (holding I) (clear E))
    :effect (and
      (not (holding I))
      (handempty)
      (on I E)
      (not (clear E))
      (clear I)
      (done26)
    )
  )

  (:action step27
    :parameters ()
    :precondition (and (done26) (on J H) (clear J) (handempty))
    :effect (and
      (not (on J H))
      (clear H)
      (not (clear J))
      (not (handempty))
      (holding J)
      (done27)
    )
  )

  (:action step28
    :parameters ()
    :precondition (and (done27) (holding J) (clear H))
    :effect (and
      (not (holding J))
      (handempty)
      (on J H)
      (not (clear H))
      (clear J)
      (done28)
    )
  )

  (:action step29
    :parameters ()
    :precondition (and (done28) (on J H) (clear J) (handempty))
    :effect (and
      (not (on J H))
      (clear H)
      (not (clear J))
      (not (handempty))
      (holding J)
      (done29)
    )
  )

  (:action step30
    :parameters ()
    :precondition (and (done29) (holding J) (clear C))
    :effect (and
      (not (holding J))
      (handempty)
      (on J C)
      (not (clear C))
      (clear J)
      (done30)
    )
  )
)