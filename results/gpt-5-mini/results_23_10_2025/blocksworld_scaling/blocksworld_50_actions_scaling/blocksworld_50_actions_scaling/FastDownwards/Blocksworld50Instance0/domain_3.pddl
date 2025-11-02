(define (domain multi-agent-blocks-sequenced)
  (:requirements :strips :typing :negative-preconditions)
  (:types block robot)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?r - robot ?x - block)
    (handempty ?r - robot)

    (step0) (step1) (step2) (step3) (step4) (step5) (step6) (step7) (step8) (step9)
    (step10) (step11) (step12) (step13) (step14) (step15) (step16) (step17) (step18) (step19)
    (step20) (step21) (step22) (step23) (step24) (step25) (step26) (step27) (step28) (step29)
    (step30) (step31) (step32) (step33) (step34) (step35) (step36) (step37) (step38) (step39)
    (step40) (step41) (step42) (step43) (step44) (step45) (step46) (step47) (step48) (step49)
    (step50)
  )

  ;; 1. unstack(i, c)
  (:action step-1-unstack-i-c
    :parameters ()
    :precondition (and (step0) (on i c) (clear i) (handempty robot1))
    :effect (and
      (not (on i c))
      (clear c)
      (not (clear i))
      (not (handempty robot1))
      (holding robot1 i)
      (not (step0))
      (step1)
    )
  )

  ;; 2. putdown(i)
  (:action step-2-putdown-i
    :parameters ()
    :precondition (and (step1) (holding robot1 i))
    :effect (and
      (ontable i)
      (clear i)
      (handempty robot1)
      (not (holding robot1 i))
      (not (step1))
      (step2)
    )
  )

  ;; 3. unstack(c, j)
  (:action step-3-unstack-c-j
    :parameters ()
    :precondition (and (step2) (on c j) (clear c) (handempty robot1))
    :effect (and
      (not (on c j))
      (clear j)
      (not (clear c))
      (not (handempty robot1))
      (holding robot1 c)
      (not (step2))
      (step3)
    )
  )

  ;; 4. putdown(c)
  (:action step-4-putdown-c
    :parameters ()
    :precondition (and (step3) (holding robot1 c))
    :effect (and
      (ontable c)
      (clear c)
      (handempty robot1)
      (not (holding robot1 c))
      (not (step3))
      (step4)
    )
  )

  ;; 5. pickup(c)
  (:action step-5-pickup-c
    :parameters ()
    :precondition (and (step4) (ontable c) (clear c) (handempty robot1))
    :effect (and
      (not (ontable c))
      (not (clear c))
      (not (handempty robot1))
      (holding robot1 c)
      (not (step4))
      (step5)
    )
  )

  ;; 6. stack(c, i)
  (:action step-6-stack-c-i
    :parameters ()
    :precondition (and (step5) (holding robot1 c) (clear i))
    :effect (and
      (on c i)
      (clear c)
      (not (clear i))
      (handempty robot1)
      (not (holding robot1 c))
      (not (step5))
      (step6)
    )
  )

  ;; 7. unstack(b, e)
  (:action step-7-unstack-b-e
    :parameters ()
    :precondition (and (step6) (on b e) (clear b) (handempty robot1))
    :effect (and
      (not (on b e))
      (clear e)
      (not (clear b))
      (not (handempty robot1))
      (holding robot1 b)
      (not (step6))
      (step7)
    )
  )

  ;; 8. putdown(b)
  (:action step-8-putdown-b
    :parameters ()
    :precondition (and (step7) (holding robot1 b))
    :effect (and
      (ontable b)
      (clear b)
      (handempty robot1)
      (not (holding robot1 b))
      (not (step7))
      (step8)
    )
  )

  ;; 9. unstack(c, i)
  (:action step-9-unstack-c-i
    :parameters ()
    :precondition (and (step8) (on c i) (clear c) (handempty robot1))
    :effect (and
      (not (on c i))
      (clear i)
      (not (clear c))
      (not (handempty robot1))
      (holding robot1 c)
      (not (step8))
      (step9)
    )
  )

  ;; 10. stack(c, j)
  (:action step-10-stack-c-j
    :parameters ()
    :precondition (and (step9) (holding robot1 c) (clear j))
    :effect (and
      (on c j)
      (clear c)
      (not (clear j))
      (handempty robot1)
      (not (holding robot1 c))
      (not (step9))
      (step10)
    )
  )

  ;; 11. unstack(e, l)
  (:action step-11-unstack-e-l
    :parameters ()
    :precondition (and (step10) (on e l) (clear e) (handempty robot1))
    :effect (and
      (not (on e l))
      (clear l)
      (not (clear e))
      (not (handempty robot1))
      (holding robot1 e)
      (not (step10))
      (step11)
    )
  )

  ;; 12. stack(e, l)
  (:action step-12-stack-e-l
    :parameters ()
    :precondition (and (step11) (holding robot1 e) (clear l))
    :effect (and
      (on e l)
      (clear e)
      (not (clear l))
      (handempty robot1)
      (not (holding robot1 e))
      (not (step11))
      (step12)
    )
  )

  ;; 13. unstack(e, l)
  (:action step-13-unstack-e-l
    :parameters ()
    :precondition (and (step12) (on e l) (clear e) (handempty robot1))
    :effect (and
      (not (on e l))
      (clear l)
      (not (clear e))
      (not (handempty robot1))
      (holding robot1 e)
      (not (step12))
      (step13)
    )
  )

  ;; 14. stack(e, b)
  (:action step-14-stack-e-b
    :parameters ()
    :precondition (and (step13) (holding robot1 e) (clear b))
    :effect (and
      (on e b)
      (clear e)
      (not (clear b))
      (handempty robot1)
      (not (holding robot1 e))
      (not (step13))
      (step14)
    )
  )

  ;; 15. unstack(e, b)
  (:action step-15-unstack-e-b
    :parameters ()
    :precondition (and (step14) (on e b) (clear e) (handempty robot1))
    :effect (and
      (not (on e b))
      (clear b)
      (not (clear e))
      (not (handempty robot1))
      (holding robot1 e)
      (not (step14))
      (step15)
    )
  )

  ;; 16. stack(e, l)
  (:action step-16-stack-e-l
    :parameters ()
    :precondition (and (step15) (holding robot1 e) (clear l))
    :effect (and
      (on e l)
      (clear e)
      (not (clear l))
      (handempty robot1)
      (not (holding robot1 e))
      (not (step15))
      (step16)
    )
  )

  ;; 17. pickup(i)
  (:action step-17-pickup-i
    :parameters ()
    :precondition (and (step16) (ontable i) (clear i) (handempty robot1))
    :effect (and
      (not (ontable i))
      (not (clear i))
      (not (handempty robot1))
      (holding robot1 i)
      (not (step16))
      (step17)
    )
  )

  ;; 18. putdown(i)
  (:action step-18-putdown-i
    :parameters ()
    :precondition (and (step17) (holding robot1 i))
    :effect (and
      (ontable i)
      (clear i)
      (handempty robot1)
      (not (holding robot1 i))
      (not (step17))
      (step18)
    )
  )

  ;; 19. pickup(i)
  (:action step-19-pickup-i
    :parameters ()
    :precondition (and (step18) (ontable i) (clear i) (handempty robot1))
    :effect (and
      (not (ontable i))
      (not (clear i))
      (not (handempty robot1))
      (holding robot1 i)
      (not (step18))
      (step19)
    )
  )

  ;; 20. stack(i, e)
  (:action step-20-stack-i-e
    :parameters ()
    :precondition (and (step19) (holding robot1 i) (clear e))
    :effect (and
      (on i e)
      (clear i)
      (not (clear e))
      (handempty robot1)
      (not (holding robot1 i))
      (not (step19))
      (step20)
    )
  )

  ;; 21. unstack(i, e)
  (:action step-21-unstack-i-e
    :parameters ()
    :precondition (and (step20) (on i e) (clear i) (handempty robot1))
    :effect (and
      (not (on i e))
      (clear e)
      (not (clear i))
      (not (handempty robot1))
      (holding robot1 i)
      (not (step20))
      (step21)
    )
  )

  ;; 22. stack(i, c)
  (:action step-22-stack-i-c
    :parameters ()
    :precondition (and (step21) (holding robot1 i) (clear c))
    :effect (and
      (on i c)
      (clear i)
      (not (clear c))
      (handempty robot1)
      (not (holding robot1 i))
      (not (step21))
      (step22)
    )
  )

  ;; 23. unstack(e, l)
  (:action step-23-unstack-e-l
    :parameters ()
    :precondition (and (step22) (on e l) (clear e) (handempty robot1))
    :effect (and
      (not (on e l))
      (clear l)
      (not (clear e))
      (not (handempty robot1))
      (holding robot1 e)
      (not (step22))
      (step23)
    )
  )

  ;; 24. stack(e, l)
  (:action step-24-stack-e-l
    :parameters ()
    :precondition (and (step23) (holding robot1 e) (clear l))
    :effect (and
      (on e l)
      (clear e)
      (not (clear l))
      (handempty robot1)
      (not (holding robot1 e))
      (not (step23))
      (step24)
    )
  )

  ;; 25. pickup(b)
  (:action step-25-pickup-b
    :parameters ()
    :precondition (and (step24) (ontable b) (clear b) (handempty robot1))
    :effect (and
      (not (ontable b))
      (not (clear b))
      (not (handempty robot1))
      (holding robot1 b)
      (not (step24))
      (step25)
    )
  )

  ;; 26. stack(b, e)
  (:action step-26-stack-b-e
    :parameters ()
    :precondition (and (step25) (holding robot1 b) (clear e))
    :effect (and
      (on b e)
      (clear b)
      (not (clear e))
      (handempty robot1)
      (not (holding robot1 b))
      (not (step25))
      (step26)
    )
  )

  ;; 27. unstack(b, e)
  (:action step-27-unstack-b-e
    :parameters ()
    :precondition (and (step26) (on b e) (clear b) (handempty robot1))
    :effect (and
      (not (on b e))
      (clear e)
      (not (clear b))
      (not (handempty robot1))
      (holding robot1 b)
      (not (step26))
      (step27)
    )
  )

  ;; 28. stack(b, i)
  (:action step-28-stack-b-i
    :parameters ()
    :precondition (and (step27) (holding robot1 b) (clear i))
    :effect (and
      (on b i)
      (clear b)
      (not (clear i))
      (handempty robot1)
      (not (holding robot1 b))
      (not (step27))
      (step28)
    )
  )

  ;; 29. unstack(b, i)
  (:action step-29-unstack-b-i
    :parameters ()
    :precondition (and (step28) (on b i) (clear b) (handempty robot1))
    :effect (and
      (not (on b i))
      (clear i)
      (not (clear b))
      (not (handempty robot1))
      (holding robot1 b)
      (not (step28))
      (step29)
    )
  )

  ;; 30. stack(b, e)
  (:action step-30-stack-b-e
    :parameters ()
    :precondition (and (step29) (holding robot1 b) (clear e))
    :effect (and
      (on b e)
      (clear b)
      (not (clear e))
      (handempty robot1)
      (not (holding robot1 b))
      (not (step29))
      (step30)
    )
  )

  ;; 31. unstack(i, c)
  (:action step-31-unstack-i-c
    :parameters ()
    :precondition (and (step30) (on i c) (clear i) (handempty robot1))
    :effect (and
      (not (on i c))
      (clear c)
      (not (clear i))
      (not (handempty robot1))
      (holding robot1 i)
      (not (step30))
      (step31)
    )
  )

  ;; 32. putdown(i)
  (:action step-32-putdown-i
    :parameters ()
    :precondition (and (step31) (holding robot1 i))
    :effect (and
      (ontable i)
      (clear i)
      (handempty robot1)
      (not (holding robot1 i))
      (not (step31))
      (step32)
    )
  )

  ;; 33. unstack(c, j)
  (:action step-33-unstack-c-j
    :parameters ()
    :precondition (and (step32) (on c j) (clear c) (handempty robot1))
    :effect (and
      (not (on c j))
      (clear j)
      (not (clear c))
      (not (handempty robot1))
      (holding robot1 c)
      (not (step32))
      (step33)
    )
  )

  ;; 34. stack(c, i)
  (:action step-34-stack-c-i
    :parameters ()
    :precondition (and (step33) (holding robot1 c) (clear i))
    :effect (and
      (on c i)
      (clear c)
      (not (clear i))
      (handempty robot1)
      (not (holding robot1 c))
      (not (step33))
      (step34)
    )
  )

  ;; 35. unstack(b, e)
  (:action step-35-unstack-b-e
    :parameters ()
    :precondition (and (step34) (on b e) (clear b) (handempty robot1))
    :effect (and
      (not (on b e))
      (clear e)
      (not (clear b))
      (not (handempty robot1))
      (holding robot1 b)
      (not (step34))
      (step35)
    )
  )

  ;; 36. putdown(b)
  (:action step-36-putdown-b
    :parameters ()
    :precondition (and (step35) (holding robot1 b))
    :effect (and
      (ontable b)
      (clear b)
      (handempty robot1)
      (not (holding robot1 b))
      (not (step35))
      (step36)
    )
  )

  ;; 37. unstack(c, i)
  (:action step-37-unstack-c-i
    :parameters ()
    :precondition (and (step36) (on c i) (clear c) (handempty robot1))
    :effect (and
      (not (on c i))
      (clear i)
      (not (clear c))
      (not (handempty robot1))
      (holding robot1 c)
      (not (step36))
      (step37)
    )
  )

  ;; 38. stack(c, b)
  (:action step-38-stack-c-b
    :parameters ()
    :precondition (and (step37) (holding robot1 c) (clear b))
    :effect (and
      (on c b)
      (clear c)
      (not (clear b))
      (handempty robot1)
      (not (holding robot1 c))
      (not (step37))
      (step38)
    )
  )

  ;; 39. unstack(e, l)
  (:action step-39-unstack-e-l
    :parameters ()
    :precondition (and (step38) (on e l) (clear e) (handempty robot1))
    :effect (and
      (not (on e l))
      (clear l)
      (not (clear e))
      (not (handempty robot1))
      (holding robot1 e)
      (not (step38))
      (step39)
    )
  )

  ;; 40. putdown(e)
  (:action step-40-putdown-e
    :parameters ()
    :precondition (and (step39) (holding robot1 e))
    :effect (and
      (ontable e)
      (clear e)
      (handempty robot1)
      (not (holding robot1 e))
      (not (step39))
      (step40)
    )
  )

  ;; 41. unstack(c, b)
  (:action step-41-unstack-c-b
    :parameters ()
    :precondition (and (step40) (on c b) (clear c) (handempty robot1))
    :effect (and
      (not (on c b))
      (clear b)
      (not (clear c))
      (not (handempty robot1))
      (holding robot1 c)
      (not (step40))
      (step41)
    )
  )

  ;; 42. stack(c, i)
  (:action step-42-stack-c-i
    :parameters ()
    :precondition (and (step41) (holding robot1 c) (clear i))
    :effect (and
      (on c i)
      (clear c)
      (not (clear i))
      (handempty robot1)
      (not (holding robot1 c))
      (not (step41))
      (step42)
    )
  )

  ;; 43. unstack(l, a)
  (:action step-43-unstack-l-a
    :parameters ()
    :precondition (and (step42) (on l a) (clear l) (handempty robot1))
    :effect (and
      (not (on l a))
      (clear a)
      (not (clear l))
      (not (handempty robot1))
      (holding robot1 l)
      (not (step42))
      (step43)
    )
  )

  ;; 44. stack(l, c)
  (:action step-44-stack-l-c
    :parameters ()
    :precondition (and (step43) (holding robot1 l) (clear c))
    :effect (and
      (on l c)
      (clear l)
      (not (clear c))
      (handempty robot1)
      (not (holding robot1 l))
      (not (step43))
      (step44)
    )
  )

  ;; 45. pickup(b)
  (:action step-45-pickup-b
    :parameters ()
    :precondition (and (step44) (ontable b) (clear b) (handempty robot1))
    :effect (and
      (not (ontable b))
      (not (clear b))
      (not (handempty robot1))
      (holding robot1 b)
      (not (step44))
      (step45)
    )
  )

  ;; 46. stack(b, a)
  (:action step-46-stack-b-a
    :parameters ()
    :precondition (and (step45) (holding robot1 b) (clear a))
    :effect (and
      (on b a)
      (clear b)
      (not (clear a))
      (handempty robot1)
      (not (holding robot1 b))
      (not (step45))
      (step46)
    )
  )

  ;; 47. unstack(l, c)
  (:action step-47-unstack-l-c
    :parameters ()
    :precondition (and (step46) (on l c) (clear l) (handempty robot1))
    :effect (and
      (not (on l c))
      (clear c)
      (not (clear l))
      (not (handempty robot1))
      (holding robot1 l)
      (not (step46))
      (step47)
    )
  )

  ;; 48. stack(l, j)
  (:action step-48-stack-l-j
    :parameters ()
    :precondition (and (step47) (holding robot1 l) (clear j))
    :effect (and
      (on l j)
      (clear l)
      (not (clear j))
      (handempty robot1)
      (not (holding robot1 l))
      (not (step47))
      (step48)
    )
  )

  ;; 49. unstack(b, a)
  (:action step-49-unstack-b-a
    :parameters ()
    :precondition (and (step48) (on b a) (clear b) (handempty robot1))
    :effect (and
      (not (on b a))
      (clear a)
      (not (clear b))
      (not (handempty robot1))
      (holding robot1 b)
      (not (step48))
      (step49)
    )
  )

  ;; 50. stack(b, c)
  (:action step-50-stack-b-c
    :parameters ()
    :precondition (and (step49) (holding robot1 b) (clear c))
    :effect (and
      (on b c)
      (clear b)
      (not (clear c))
      (handempty robot1)
      (not (holding robot1 b))
      (not (step49))
      (step50)
    )
  )

)