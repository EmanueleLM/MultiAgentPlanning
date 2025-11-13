(define (problem trip-venice-dubrovnik-istanbul-11days)
  (:domain trip-planning)
  (:objects
    venice dubrovnik istanbul - city
  )
  (:init
    (at venice)

    ; direct-flight adjacency (bidirectional where allowed)
    (direct venice dubrovnik)
    (direct dubrovnik venice)
    (direct dubrovnik istanbul)
    (direct istanbul dubrovnik)

    ; no direct venice <-> istanbul is intentionally omitted

    (= (days-left) 11)
    (= (stay-days venice) 0)
    (= (stay-days dubrovnik) 0)
    (= (stay-days istanbul) 0)
  )
  (:goal (and
    (visited venice)
    (visited dubrovnik)
    (visited istanbul)
    (= (stay-days venice) 5)
    (= (stay-days dubrovnik) 3)
    (= (stay-days istanbul) 3)
    (= (days-left) 0)
    (= (+ (stay-days venice) (stay-days dubrovnik) (stay-days istanbul)) 11)
  ))
)