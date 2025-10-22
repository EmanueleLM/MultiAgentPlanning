(define (domain blocksworld40-instance11)
  (:requirements :strips :typing :negative-preconditions)
  (:types block)
  (:constants a b c d e f g h i j k - block)
  (:predicates
    (on ?x - block ?y - block)
    (on-table ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    (ready1) (ready2) (ready3) (ready4) (ready5)
    (ready6) (ready7) (ready8) (ready9) (ready10)
    (ready11) (ready12) (ready13) (ready14) (ready15)
    (ready16) (ready17) (ready18) (ready19) (ready20)
    (ready21) (ready22) (ready23) (ready24) (ready25)
    (ready26) (ready27) (ready28) (ready29) (ready30)
    (ready31) (ready32) (ready33) (ready34) (ready35)
    (ready36) (ready37) (ready38) (ready39) (ready40)
    (done)
  )

  (:action step1-unstack-e-j
    :parameters ()
    :precondition (and (ready1) (handempty) (on e j) (clear e))
    :effect (and
      (not (on e j))
      (holding e)
      (not (clear e))
      (clear j)
      (not (handempty))
      (not (ready1))
      (ready2)
    )
  )

  (:action step2-putdown-e
    :parameters ()
    :precondition (and (ready2) (holding e))
    :effect (and
      (not (holding e))
      (on-table e)
      (clear e)
      (handempty)
      (not (ready2))
      (ready3)
    )
  )

  (:action step3-unstack-j-d
    :parameters ()
    :precondition (and (ready3) (handempty) (on j d) (clear j))
    :effect (and
      (not (on j d))
      (holding j)
      (not (clear j))
      (clear d)
      (not (handempty))
      (not (ready3))
      (ready4)
    )
  )

  (:action step4-stack-j-h
    :parameters ()
    :precondition (and (ready4) (holding j) (clear h))
    :effect (and
      (not (holding j))
      (on j h)
      (not (clear h))
      (clear j)
      (handempty)
      (not (ready4))
      (ready5)
    )
  )

  (:action step5-unstack-j-h
    :parameters ()
    :precondition (and (ready5) (handempty) (on j h) (clear j))
    :effect (and
      (not (on j h))
      (holding j)
      (not (clear j))
      (clear h)
      (not (handempty))
      (not (ready5))
      (ready6)
    )
  )

  (:action step6-stack-j-f
    :parameters ()
    :precondition (and (ready6) (holding j) (clear f))
    :effect (and
      (not (holding j))
      (on j f)
      (not (clear f))
      (clear j)
      (handempty)
      (not (ready6))
      (ready7)
    )
  )

  (:action step7-unstack-a-g
    :parameters ()
    :precondition (and (ready7) (handempty) (on a g) (clear a))
    :effect (and
      (not (on a g))
      (holding a)
      (not (clear a))
      (clear g)
      (not (handempty))
      (not (ready7))
      (ready8)
    )
  )

  (:action step8-stack-a-h
    :parameters ()
    :precondition (and (ready8) (holding a) (clear h))
    :effect (and
      (not (holding a))
      (on a h)
      (not (clear h))
      (clear a)
      (handempty)
      (not (ready8))
      (ready9)
    )
  )

  (:action step9-pickup-d
    :parameters ()
    :precondition (and (ready9) (handempty) (on-table d) (clear d))
    :effect (and
      (not (on-table d))
      (holding d)
      (not (clear d))
      (not (handempty))
      (not (ready9))
      (ready10)
    )
  )

  (:action step10-stack-d-j
    :parameters ()
    :precondition (and (ready10) (holding d) (clear j))
    :effect (and
      (not (holding d))
      (on d j)
      (not (clear j))
      (clear d)
      (handempty)
      (not (ready10))
      (ready11)
    )
  )

  (:action step11-unstack-a-h
    :parameters ()
    :precondition (and (ready11) (handempty) (on a h) (clear a))
    :effect (and
      (not (on a h))
      (holding a)
      (not (clear a))
      (clear h)
      (not (handempty))
      (not (ready11))
      (ready12)
    )
  )

  (:action step12-stack-a-g
    :parameters ()
    :precondition (and (ready12) (holding a) (clear g))
    :effect (and
      (not (holding a))
      (on a g)
      (not (clear g))
      (clear a)
      (handempty)
      (not (ready12))
      (ready13)
    )
  )

  (:action step13-pickup-e
    :parameters ()
    :precondition (and (ready13) (handempty) (on-table e) (clear e))
    :effect (and
      (not (on-table e))
      (holding e)
      (not (clear e))
      (not (handempty))
      (not (ready13))
      (ready14)
    )
  )

  (:action step14-stack-e-d
    :parameters ()
    :precondition (and (ready14) (holding e) (clear d))
    :effect (and
      (not (holding e))
      (on e d)
      (not (clear d))
      (clear e)
      (handempty)
      (not (ready14))
      (ready15)
    )
  )

  (:action step15-unstack-a-g
    :parameters ()
    :precondition (and (ready15) (handempty) (on a g) (clear a))
    :effect (and
      (not (on a g))
      (holding a)
      (not (clear a))
      (clear g)
      (not (handempty))
      (not (ready15))
      (ready16)
    )
  )

  (:action step16-stack-a-g
    :parameters ()
    :precondition (and (ready16) (holding a) (clear g))
    :effect (and
      (not (holding a))
      (on a g)
      (not (clear g))
      (clear a)
      (handempty)
      (not (ready16))
      (ready17)
    )
  )

  (:action step17-unstack-a-g
    :parameters ()
    :precondition (and (ready17) (handempty) (on a g) (clear a))
    :effect (and
      (not (on a g))
      (holding a)
      (not (clear a))
      (clear g)
      (not (handempty))
      (not (ready17))
      (ready18)
    )
  )

  (:action step18-stack-a-g
    :parameters ()
    :precondition (and (ready18) (holding a) (clear g))
    :effect (and
      (not (holding a))
      (on a g)
      (not (clear g))
      (clear a)
      (handempty)
      (not (ready18))
      (ready19)
    )
  )

  (:action step19-unstack-h-i
    :parameters ()
    :precondition (and (ready19) (handempty) (on h i) (clear h))
    :effect (and
      (not (on h i))
      (holding h)
      (not (clear h))
      (clear i)
      (not (handempty))
      (not (ready19))
      (ready20)
    )
  )

  (:action step20-stack-h-i
    :parameters ()
    :precondition (and (ready20) (holding h) (clear i))
    :effect (and
      (not (holding h))
      (on h i)
      (not (clear i))
      (clear h)
      (handempty)
      (not (ready20))
      (ready21)
    )
  )

  (:action step21-unstack-h-i
    :parameters ()
    :precondition (and (ready21) (handempty) (on h i) (clear h))
    :effect (and
      (not (on h i))
      (holding h)
      (not (clear h))
      (clear i)
      (not (handempty))
      (not (ready21))
      (ready22)
    )
  )

  (:action step22-putdown-h
    :parameters ()
    :precondition (and (ready22) (holding h))
    :effect (and
      (not (holding h))
      (on-table h)
      (clear h)
      (handempty)
      (not (ready22))
      (ready23)
    )
  )

  (:action step23-unstack-e-d
    :parameters ()
    :precondition (and (ready23) (handempty) (on e d) (clear e))
    :effect (and
      (not (on e d))
      (holding e)
      (not (clear e))
      (clear d)
      (not (handempty))
      (not (ready23))
      (ready24)
    )
  )

  (:action step24-putdown-e
    :parameters ()
    :precondition (and (ready24) (holding e))
    :effect (and
      (not (holding e))
      (on-table e)
      (clear e)
      (handempty)
      (not (ready24))
      (ready25)
    )
  )

  (:action step25-unstack-a-g
    :parameters ()
    :precondition (and (ready25) (handempty) (on a g) (clear a))
    :effect (and
      (not (on a g))
      (holding a)
      (not (clear a))
      (clear g)
      (not (handempty))
      (not (ready25))
      (ready26)
    )
  )

  (:action step26-stack-a-e
    :parameters ()
    :precondition (and (ready26) (holding a) (clear e))
    :effect (and
      (not (holding a))
      (on a e)
      (not (clear e))
      (clear a)
      (handempty)
      (not (ready26))
      (ready27)
    )
  )

  (:action step27-unstack-a-e
    :parameters ()
    :precondition (and (ready27) (handempty) (on a e) (clear a))
    :effect (and
      (not (on a e))
      (holding a)
      (not (clear a))
      (clear e)
      (not (handempty))
      (not (ready27))
      (ready28)
    )
  )

  (:action step28-putdown-a
    :parameters ()
    :precondition (and (ready28) (holding a))
    :effect (and
      (not (holding a))
      (on-table a)
      (clear a)
      (handempty)
      (not (ready28))
      (ready29)
    )
  )

  (:action step29-pickup-g
    :parameters ()
    :precondition (and (ready29) (handempty) (on-table g) (clear g))
    :effect (and
      (not (on-table g))
      (holding g)
      (not (clear g))
      (not (handempty))
      (not (ready29))
      (ready30)
    )
  )

  (:action step30-putdown-g
    :parameters ()
    :precondition (and (ready30) (holding g))
    :effect (and
      (not (holding g))
      (on-table g)
      (clear g)
      (handempty)
      (not (ready30))
      (ready31)
    )
  )

  (:action step31-pickup-a
    :parameters ()
    :precondition (and (ready31) (handempty) (on-table a) (clear a))
    :effect (and
      (not (on-table a))
      (holding a)
      (not (clear a))
      (not (handempty))
      (not (ready31))
      (ready32)
    )
  )

  (:action step32-stack-a-d
    :parameters ()
    :precondition (and (ready32) (holding a) (clear d))
    :effect (and
      (not (holding a))
      (on a d)
      (not (clear d))
      (clear a)
      (handempty)
      (not (ready32))
      (ready33)
    )
  )

  (:action step33-pickup-h
    :parameters ()
    :precondition (and (ready33) (handempty) (on-table h) (clear h))
    :effect (and
      (not (on-table h))
      (holding h)
      (not (clear h))
      (not (handempty))
      (not (ready33))
      (ready34)
    )
  )

  (:action step34-stack-h-e
    :parameters ()
    :precondition (and (ready34) (holding h) (clear e))
    :effect (and
      (not (holding h))
      (on h e)
      (not (clear e))
      (clear h)
      (handempty)
      (not (ready34))
      (ready35)
    )
  )

  (:action step35-unstack-a-d
    :parameters ()
    :precondition (and (ready35) (handempty) (on a d) (clear a))
    :effect (and
      (not (on a d))
      (holding a)
      (not (clear a))
      (clear d)
      (not (handempty))
      (not (ready35))
      (ready36)
    )
  )

  (:action step36-stack-a-g
    :parameters ()
    :precondition (and (ready36) (holding a) (clear g))
    :effect (and
      (not (holding a))
      (on a g)
      (not (clear g))
      (clear a)
      (handempty)
      (not (ready36))
      (ready37)
    )
  )

  (:action step37-unstack-a-g
    :parameters ()
    :precondition (and (ready37) (handempty) (on a g) (clear a))
    :effect (and
      (not (on a g))
      (holding a)
      (not (clear a))
      (clear g)
      (not (handempty))
      (not (ready37))
      (ready38)
    )
  )

  (:action step38-stack-a-i
    :parameters ()
    :precondition (and (ready38) (holding a) (clear i))
    :effect (and
      (not (holding a))
      (on a i)
      (not (clear i))
      (clear a)
      (handempty)
      (not (ready38))
      (ready39)
    )
  )

  (:action step39-unstack-a-i
    :parameters ()
    :precondition (and (ready39) (handempty) (on a i) (clear a))
    :effect (and
      (not (on a i))
      (holding a)
      (not (clear a))
      (clear i)
      (not (handempty))
      (not (ready39))
      (ready40)
    )
  )

  (:action step40-stack-a-d-final
    :parameters ()
    :precondition (and (ready40) (holding a) (clear d))
    :effect (and
      (not (holding a))
      (on a d)
      (not (clear d))
      (clear a)
      (handempty)
      (not (ready40))
      (done)
    )
  )
)