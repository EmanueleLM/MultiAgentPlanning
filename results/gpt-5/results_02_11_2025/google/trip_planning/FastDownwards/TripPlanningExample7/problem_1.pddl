(define (problem trip-venice-dubrovnik-istanbul-11days)
  (:domain trip-planning-fd)
  (:objects
    venice dubrovnik istanbul - city
  )
  (:init
    (at venice)

    (direct venice dubrovnik)
    (direct dubrovnik venice)
    (direct dubrovnik istanbul)
    (direct istanbul dubrovnik)

    (= (days-left) 11)
    (= (stay-days venice) 0)
    (= (stay-days dubrovnik) 0)
    (= (stay-days istanbul) 0)

    (= (target-days venice) 5)
    (= (target-days dubrovnik) 4)
    (= (target-days istanbul) 2)
  )
  (:goal (and
    (visited venice)
    (visited dubrovnik)
    (visited istanbul)
    (= (days-left) 0)
    (= (stay-days venice) (target-days venice))
    (= (stay-days dubrovnik) (target-days dubrovnik))
    (= (stay-days istanbul) (target-days istanbul))
  ))
)