(define (domain blocks-world-ordered)
  (:requirements :strips :typing :negative-preconditions)
  (:types block agent)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?a - agent ?x - block)
    (handempty ?a - agent)
    ;; sequence control flags
    (done0) (done1) (done2) (done3) (done4) (done5) (done6) (done7) (done8) (done9)
    (done10) (done11) (done12) (done13) (done14) (done15) (done16) (done17) (done18) (done19)
    (done20) (done21) (done22) (done23) (done24) (done25) (done26) (done27) (done28) (done29)
    (done30) (done31) (done32) (done33) (done34) (done35) (done36) (done37) (done38) (done39)
    (done40) (done41) (done42) (done43) (done44) (done45) (done46) (done47) (done48) (done49)
    (done50)
  )

  ;; Generic pickup (not used directly by the ordered actions but provided)
  (:action pickup
    :parameters (?a - agent ?x - block)
    :precondition (and (ontable ?x) (clear ?x) (handempty ?a))
    :effect (and
      (holding ?a ?x)
      (not (ontable ?x))
      (not (clear ?x))
      (not (handempty ?a))
    )
  )

  ;; Generic putdown
  (:action putdown
    :parameters (?a - agent ?x - block)
    :precondition (and (holding ?a ?x))
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty ?a)
      (not (holding ?a ?x))
    )
  )

  ;; Generic unstack
  (:action unstack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (on ?x ?y) (clear ?x) (handempty ?a))
    :effect (and
      (holding ?a ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty ?a))
    )
  )

  ;; Generic stack
  (:action stack
    :parameters (?a - agent ?x - block ?y - block)
    :precondition (and (holding ?a ?x) (clear ?y))
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty ?a)
      (not (clear ?y))
      (not (holding ?a ?x))
    )
  )

  ;; The following 50 actions enforce the exact ordered sequence. Each action requires the previous done flag.
  ;; Action 1: unstack(K, E)
  (:action act1-unstack-k-e
    :precondition (and (on k e) (clear k) (handempty orchestrator) (done0))
    :effect (and
      (holding orchestrator k)
      (clear e)
      (not (on k e))
      (not (clear k))
      (not (handempty orchestrator))
      (done1)
      (not (done0))
    )
  )

  ;; Action 2: stack(K, C)
  (:action act2-stack-k-c
    :precondition (and (holding orchestrator k) (clear c) (done1))
    :effect (and
      (on k c)
      (clear k)
      (handempty orchestrator)
      (not (clear c))
      (not (holding orchestrator k))
      (done2)
      (not (done1))
    )
  )

  ;; Action 3: unstack(B, L)
  (:action act3-unstack-b-l
    :precondition (and (on b l) (clear b) (handempty orchestrator) (done2))
    :effect (and
      (holding orchestrator b)
      (clear l)
      (not (on b l))
      (not (clear b))
      (not (handempty orchestrator))
      (done3)
      (not (done2))
    )
  )

  ;; Action 4: stack(B, L)
  (:action act4-stack-b-l
    :precondition (and (holding orchestrator b) (clear l) (done3))
    :effect (and
      (on b l)
      (clear b)
      (handempty orchestrator)
      (not (clear l))
      (not (holding orchestrator b))
      (done4)
      (not (done3))
    )
  )

  ;; Action 5: pickup(E)
  (:action act5-pickup-e
    :precondition (and (ontable e) (clear e) (handempty orchestrator) (done4))
    :effect (and
      (holding orchestrator e)
      (not (ontable e))
      (not (clear e))
      (not (handempty orchestrator))
      (done5)
      (not (done4))
    )
  )

  ;; Action 6: putdown(E)
  (:action act6-putdown-e
    :precondition (and (holding orchestrator e) (done5))
    :effect (and
      (ontable e)
      (clear e)
      (handempty orchestrator)
      (not (holding orchestrator e))
      (done6)
      (not (done5))
    )
  )

  ;; Action 7: unstack(I, G)
  (:action act7-unstack-i-g
    :precondition (and (on i g) (clear i) (handempty orchestrator) (done6))
    :effect (and
      (holding orchestrator i)
      (clear g)
      (not (on i g))
      (not (clear i))
      (not (handempty orchestrator))
      (done7)
      (not (done6))
    )
  )

  ;; Action 8: stack(I, G)
  (:action act8-stack-i-g
    :precondition (and (holding orchestrator i) (clear g) (done7))
    :effect (and
      (on i g)
      (clear i)
      (handempty orchestrator)
      (not (clear g))
      (not (holding orchestrator i))
      (done8)
      (not (done7))
    )
  )

  ;; Action 9: pickup(E)
  (:action act9-pickup-e
    :precondition (and (ontable e) (clear e) (handempty orchestrator) (done8))
    :effect (and
      (holding orchestrator e)
      (not (ontable e))
      (not (clear e))
      (not (handempty orchestrator))
      (done9)
      (not (done8))
    )
  )

  ;; Action 10: stack(E, K)
  (:action act10-stack-e-k
    :precondition (and (holding orchestrator e) (clear k) (done9))
    :effect (and
      (on e k)
      (clear e)
      (handempty orchestrator)
      (not (clear k))
      (not (holding orchestrator e))
      (done10)
      (not (done9))
    )
  )

  ;; Action 11: unstack(I, G)
  (:action act11-unstack-i-g
    :precondition (and (on i g) (clear i) (handempty orchestrator) (done10))
    :effect (and
      (holding orchestrator i)
      (clear g)
      (not (on i g))
      (not (clear i))
      (not (handempty orchestrator))
      (done11)
      (not (done10))
    )
  )

  ;; Action 12: putdown(I)
  (:action act12-putdown-i
    :precondition (and (holding orchestrator i) (done11))
    :effect (and
      (ontable i)
      (clear i)
      (handempty orchestrator)
      (not (holding orchestrator i))
      (done12)
      (not (done11))
    )
  )

  ;; Action 13: unstack(B, L)
  (:action act13-unstack-b-l
    :precondition (and (on b l) (clear b) (handempty orchestrator) (done12))
    :effect (and
      (holding orchestrator b)
      (clear l)
      (not (on b l))
      (not (clear b))
      (not (handempty orchestrator))
      (done13)
      (not (done12))
    )
  )

  ;; Action 14: stack(B, I)
  (:action act14-stack-b-i
    :precondition (and (holding orchestrator b) (clear i) (done13))
    :effect (and
      (on b i)
      (clear b)
      (handempty orchestrator)
      (not (clear i))
      (not (holding orchestrator b))
      (done14)
      (not (done13))
    )
  )

  ;; Action 15: unstack(E, K)
  (:action act15-unstack-e-k
    :precondition (and (on e k) (clear e) (handempty orchestrator) (done14))
    :effect (and
      (holding orchestrator e)
      (clear k)
      (not (on e k))
      (not (clear e))
      (not (handempty orchestrator))
      (done15)
      (not (done14))
    )
  )

  ;; Action 16: stack(E, L)
  (:action act16-stack-e-l
    :precondition (and (holding orchestrator e) (clear l) (done15))
    :effect (and
      (on e l)
      (clear e)
      (handempty orchestrator)
      (not (clear l))
      (not (holding orchestrator e))
      (done16)
      (not (done15))
    )
  )

  ;; Action 17: unstack(K, C)
  (:action act17-unstack-k-c
    :precondition (and (on k c) (clear k) (handempty orchestrator) (done16))
    :effect (and
      (holding orchestrator k)
      (clear c)
      (not (on k c))
      (not (clear k))
      (not (handempty orchestrator))
      (done17)
      (not (done16))
    )
  )

  ;; Action 18: stack(K, C)
  (:action act18-stack-k-c
    :precondition (and (holding orchestrator k) (clear c) (done17))
    :effect (and
      (on k c)
      (clear k)
      (handempty orchestrator)
      (not (clear c))
      (not (holding orchestrator k))
      (done18)
      (not (done17))
    )
  )

  ;; Action 19: unstack(G, N)
  (:action act19-unstack-g-n
    :precondition (and (on g n) (clear g) (handempty orchestrator) (done18))
    :effect (and
      (holding orchestrator g)
      (clear n)
      (not (on g n))
      (not (clear g))
      (not (handempty orchestrator))
      (done19)
      (not (done18))
    )
  )

  ;; Action 20: stack(G, N)
  (:action act20-stack-g-n
    :precondition (and (holding orchestrator g) (clear n) (done19))
    :effect (and
      (on g n)
      (clear g)
      (handempty orchestrator)
      (not (clear n))
      (not (holding orchestrator g))
      (done20)
      (not (done19))
    )
  )

  ;; Action 21: unstack(G, N)
  (:action act21-unstack-g-n
    :precondition (and (on g n) (clear g) (handempty orchestrator) (done20))
    :effect (and
      (holding orchestrator g)
      (clear n)
      (not (on g n))
      (not (clear g))
      (not (handempty orchestrator))
      (done21)
      (not (done20))
    )
  )

  ;; Action 22: stack(G, K)
  (:action act22-stack-g-k
    :precondition (and (holding orchestrator g) (clear k) (done21))
    :effect (and
      (on g k)
      (clear g)
      (handempty orchestrator)
      (not (clear k))
      (not (holding orchestrator g))
      (done22)
      (not (done21))
    )
  )

  ;; Action 23: unstack(E, L)
  (:action act23-unstack-e-l
    :precondition (and (on e l) (clear e) (handempty orchestrator) (done22))
    :effect (and
      (holding orchestrator e)
      (clear l)
      (not (on e l))
      (not (clear e))
      (not (handempty orchestrator))
      (done23)
      (not (done22))
    )
  )

  ;; Action 24: stack(E, L)
  (:action act24-stack-e-l
    :precondition (and (holding orchestrator e) (clear l) (done23))
    :effect (and
      (on e l)
      (clear e)
      (handempty orchestrator)
      (not (clear l))
      (not (holding orchestrator e))
      (done24)
      (not (done23))
    )
  )

  ;; Action 25: unstack(G, K)
  (:action act25-unstack-g-k
    :precondition (and (on g k) (clear g) (handempty orchestrator) (done24))
    :effect (and
      (holding orchestrator g)
      (clear k)
      (not (on g k))
      (not (clear g))
      (not (handempty orchestrator))
      (done25)
      (not (done24))
    )
  )

  ;; Action 26: stack(G, N)
  (:action act26-stack-g-n
    :precondition (and (holding orchestrator g) (clear n) (done25))
    :effect (and
      (on g n)
      (clear g)
      (handempty orchestrator)
      (not (clear n))
      (not (holding orchestrator g))
      (done26)
      (not (done25))
    )
  )

  ;; Action 27: unstack(E, L)
  (:action act27-unstack-e-l
    :precondition (and (on e l) (clear e) (handempty orchestrator) (done26))
    :effect (and
      (holding orchestrator e)
      (clear l)
      (not (on e l))
      (not (clear e))
      (not (handempty orchestrator))
      (done27)
      (not (done26))
    )
  )

  ;; Action 28: putdown(E)
  (:action act28-putdown-e
    :precondition (and (holding orchestrator e) (done27))
    :effect (and
      (ontable e)
      (clear e)
      (handempty orchestrator)
      (not (holding orchestrator e))
      (done28)
      (not (done27))
    )
  )

  ;; Action 29: unstack(K, C)
  (:action act29-unstack-k-c
    :precondition (and (on k c) (clear k) (handempty orchestrator) (done28))
    :effect (and
      (holding orchestrator k)
      (clear c)
      (not (on k c))
      (not (clear k))
      (not (handempty orchestrator))
      (done29)
      (not (done28))
    )
  )

  ;; Action 30: stack(K, L)
  (:action act30-stack-k-l
    :precondition (and (holding orchestrator k) (clear l) (done29))
    :effect (and
      (on k l)
      (clear k)
      (handempty orchestrator)
      (not (clear l))
      (not (holding orchestrator k))
      (done30)
      (not (done29))
    )
  )

  ;; Action 31: unstack(K, L)
  (:action act31-unstack-k-l
    :precondition (and (on k l) (clear k) (handempty orchestrator) (done30))
    :effect (and
      (holding orchestrator k)
      (clear l)
      (not (on k l))
      (not (clear k))
      (not (handempty orchestrator))
      (done31)
      (not (done30))
    )
  )

  ;; Action 32: stack(K, L)
  (:action act32-stack-k-l
    :precondition (and (holding orchestrator k) (clear l) (done31))
    :effect (and
      (on k l)
      (clear k)
      (handempty orchestrator)
      (not (clear l))
      (not (holding orchestrator k))
      (done32)
      (not (done31))
    )
  )

  ;; Action 33: unstack(C, A)
  (:action act33-unstack-c-a
    :precondition (and (on c a) (clear c) (handempty orchestrator) (done32))
    :effect (and
      (holding orchestrator c)
      (clear a)
      (not (on c a))
      (not (clear c))
      (not (handempty orchestrator))
      (done33)
      (not (done32))
    )
  )

  ;; Action 34: stack(C, E)
  (:action act34-stack-c-e
    :precondition (and (holding orchestrator c) (clear e) (done33))
    :effect (and
      (on c e)
      (clear c)
      (handempty orchestrator)
      (not (clear e))
      (not (holding orchestrator c))
      (done34)
      (not (done33))
    )
  )

  ;; Action 35: unstack(B, I)
  (:action act35-unstack-b-i
    :precondition (and (on b i) (clear b) (handempty orchestrator) (done34))
    :effect (and
      (holding orchestrator b)
      (clear i)
      (not (on b i))
      (not (clear b))
      (not (handempty orchestrator))
      (done35)
      (not (done34))
    )
  )

  ;; Action 36: stack(B, K)
  (:action act36-stack-b-k
    :precondition (and (holding orchestrator b) (clear k) (done35))
    :effect (and
      (on b k)
      (clear b)
      (handempty orchestrator)
      (not (clear k))
      (not (holding orchestrator b))
      (done36)
      (not (done35))
    )
  )

  ;; Action 37: unstack(C, E)
  (:action act37-unstack-c-e
    :precondition (and (on c e) (clear c) (handempty orchestrator) (done36))
    :effect (and
      (holding orchestrator c)
      (clear e)
      (not (on c e))
      (not (clear c))
      (not (handempty orchestrator))
      (done37)
      (not (done36))
    )
  )

  ;; Action 38: stack(C, E)
  (:action act38-stack-c-e
    :precondition (and (holding orchestrator c) (clear e) (done37))
    :effect (and
      (on c e)
      (clear c)
      (handempty orchestrator)
      (not (clear e))
      (not (holding orchestrator c))
      (done38)
      (not (done37))
    )
  )

  ;; Action 39: unstack(G, N)
  (:action act39-unstack-g-n
    :precondition (and (on g n) (clear g) (handempty orchestrator) (done38))
    :effect (and
      (holding orchestrator g)
      (clear n)
      (not (on g n))
      (not (clear g))
      (not (handempty orchestrator))
      (done39)
      (not (done38))
    )
  )

  ;; Action 40: putdown(G)
  (:action act40-putdown-g
    :precondition (and (holding orchestrator g) (done39))
    :effect (and
      (ontable g)
      (clear g)
      (handempty orchestrator)
      (not (holding orchestrator g))
      (done40)
      (not (done39))
    )
  )

  ;; Action 41: pickup(G)
  (:action act41-pickup-g
    :precondition (and (ontable g) (clear g) (handempty orchestrator) (done40))
    :effect (and
      (holding orchestrator g)
      (not (ontable g))
      (not (clear g))
      (not (handempty orchestrator))
      (done41)
      (not (done40))
    )
  )

  ;; Action 42: stack(G, B)
  (:action act42-stack-g-b
    :precondition (and (holding orchestrator g) (clear b) (done41))
    :effect (and
      (on g b)
      (clear g)
      (handempty orchestrator)
      (not (clear b))
      (not (holding orchestrator g))
      (done42)
      (not (done41))
    )
  )

  ;; Action 43: pickup(N)
  (:action act43-pickup-n
    :precondition (and (ontable n) (clear n) (handempty orchestrator) (done42))
    :effect (and
      (holding orchestrator n)
      (not (ontable n))
      (not (clear n))
      (not (handempty orchestrator))
      (done43)
      (not (done42))
    )
  )

  ;; Action 44: stack(N, G)
  (:action act44-stack-n-g
    :precondition (and (holding orchestrator n) (clear g) (done43))
    :effect (and
      (on n g)
      (clear n)
      (handempty orchestrator)
      (not (clear g))
      (not (holding orchestrator n))
      (done44)
      (not (done43))
    )
  )

  ;; Action 45: unstack(A, H)
  (:action act45-unstack-a-h
    :precondition (and (on a h) (clear a) (handempty orchestrator) (done44))
    :effect (and
      (holding orchestrator a)
      (clear h)
      (not (on a h))
      (not (clear a))
      (not (handempty orchestrator))
      (done45)
      (not (done44))
    )
  )

  ;; Action 46: putdown(A)
  (:action act46-putdown-a
    :precondition (and (holding orchestrator a) (done45))
    :effect (and
      (ontable a)
      (clear a)
      (handempty orchestrator)
      (not (holding orchestrator a))
      (done46)
      (not (done45))
    )
  )

  ;; Action 47: pickup(A)
  (:action act47-pickup-a
    :precondition (and (ontable a) (clear a) (handempty orchestrator) (done46))
    :effect (and
      (holding orchestrator a)
      (not (ontable a))
      (not (clear a))
      (not (handempty orchestrator))
      (done47)
      (not (done46))
    )
  )

  ;; Action 48: stack(A, H)
  (:action act48-stack-a-h
    :precondition (and (holding orchestrator a) (clear h) (done47))
    :effect (and
      (on a h)
      (clear a)
      (handempty orchestrator)
      (not (clear h))
      (not (holding orchestrator a))
      (done48)
      (not (done47))
    )
  )

  ;; Action 49: unstack(N, G)
  (:action act49-unstack-n-g
    :precondition (and (on n g) (clear n) (handempty orchestrator) (done48))
    :effect (and
      (holding orchestrator n)
      (clear g)
      (not (on n g))
      (not (clear n))
      (not (handempty orchestrator))
      (done49)
      (not (done48))
    )
  )

  ;; Action 50: stack(N, A)
  (:action act50-stack-n-a
    :precondition (and (holding orchestrator n) (clear a) (done49))
    :effect (and
      (on n a)
      (clear n)
      (handempty orchestrator)
      (not (clear a))
      (not (holding orchestrator n))
      (done50)
      (not (done49))
    )
  )
)