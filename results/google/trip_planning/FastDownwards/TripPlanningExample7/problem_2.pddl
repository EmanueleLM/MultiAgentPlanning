(define (problem trip-example7)
  (:domain trip-planning)
  (:objects
    dubrovnik istanbul venice - city
    dub1 dub2 dub3 dub4 - token
    ist1 - token
    ven1 ven2 ven3 ven4 ven5 ven6 - token
  )
  (:init
    (at dubrovnik)
    (token-of dub1 dubrovnik) (token-of dub2 dubrovnik) (token-of dub3 dubrovnik) (token-of dub4 dubrovnik)
    (token-of ist1 istanbul)
    (token-of ven1 venice) (token-of ven2 venice) (token-of ven3 venice) (token-of ven4 venice) (token-of ven5 venice) (token-of ven6 venice)
    (free dub1) (free dub2) (free dub3) (free dub4)
    (free ist1)
    (free ven1) (free ven2) (free ven3) (free ven4) (free ven5) (free ven6)
    (direct dubrovnik istanbul)
    (direct dubrovnik venice)
    (direct istanbul venice)
  )
  (:goal (and
    (used dub1) (used dub2) (used dub3) (used dub4)
    (used ist1)
    (used ven1) (used ven2) (used ven3) (used ven4) (used ven5) (used ven6)
    (visited dubrovnik) (visited istanbul) (visited venice)
  ))
)