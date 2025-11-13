(define (problem trip-venice-dubrovnik-istanbul-11days-classical)
  (:domain trip-planning-fd-classical)
  (:objects
    venice dubrovnik istanbul - city
    v1 v2 v3 v4 v5 d1 d2 d3 d4 i1 i2 - token
  )
  (:init
    (at venice)

    (direct venice dubrovnik)
    (direct dubrovnik venice)
    (direct dubrovnik istanbul)
    (direct istanbul dubrovnik)

    (unspent v1) (alloc v1 venice)
    (unspent v2) (alloc v2 venice)
    (unspent v3) (alloc v3 venice)
    (unspent v4) (alloc v4 venice)
    (unspent v5) (alloc v5 venice)

    (unspent d1) (alloc d1 dubrovnik)
    (unspent d2) (alloc d2 dubrovnik)
    (unspent d3) (alloc d3 dubrovnik)
    (unspent d4) (alloc d4 dubrovnik)

    (unspent i1) (alloc i1 istanbul)
    (unspent i2) (alloc i2 istanbul)
  )
  (:goal (and
    (visited venice)
    (visited dubrovnik)
    (visited istanbul)
    (spent v1)
    (spent v2)
    (spent v3)
    (spent v4)
    (spent v5)
    (spent d1)
    (spent d2)
    (spent d3)
    (spent d4)
    (spent i1)
    (spent i2)
  ))
)