(define (problem trip-planning-example20)
  (:domain trip-planning-example20)
  (:objects
    istanbul budapest dubrovnik - city
    t0 t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12 - time
    l0 l1 l2 l3 l4 l5 l6 - level
  )
  (:init
    (at dubrovnik)

    (direct istanbul budapest)
    (direct budapest istanbul)
    (direct dubrovnik istanbul)

    (current t0)
    (next t0 t1)
    (next t1 t2)
    (next t2 t3)
    (next t3 t4)
    (next t4 t5)
    (next t5 t6)
    (next t6 t7)
    (next t7 t8)
    (next t8 t9)
    (next t9 t10)
    (next t10 t11)
    (next t11 t12)
    (final t12)

    (remain istanbul l5)
    (remain budapest l6)
    (remain dubrovnik l3)

    (dec l6 l5)
    (dec l5 l4)
    (dec l4 l3)
    (dec l3 l2)
    (dec l2 l1)
    (dec l1 l0)
    (zero l0)

    (pending-cost istanbul)
    (pending-cost budapest)
    (pending-cost dubrovnik)

    (= (total-cost) 0)
  )
  (:goal (and
    (current t12)
    (visited istanbul)
    (visited budapest)
    (visited dubrovnik)
    (finalized istanbul)
    (finalized budapest)
    (finalized dubrovnik)
  ))
  (:metric minimize (total-cost))
)