(define (problem sokoban-instance)
  (:domain sokoban)

  (:init
    (at player pos_099)
    (at box pos_053)
    (goal pos_050)
    (clear pos_053)
    ; Define clear positions
    (clear pos_052) (clear pos_054) (clear pos_059) (clear pos_060) (clear pos_061)
    (clear pos_062) (clear pos_063) (clear pos_064) (clear pos_065)
    ; Define adjacency relations
    (adjacent pos_052 pos_053) (adjacent pos_053 pos_054) 
    (adjacent pos_059 pos_060) (adjacent pos_060 pos_061) (adjacent pos_061 pos_062)
    (adjacent pos_062 pos_063) (adjacent pos_063 pos_064) (adjacent pos_064 pos_065)
    ; Ensure adjacency is bidirectional
    (adjacent pos_053 pos_052) (adjacent pos_054 pos_053)
    (adjacent pos_060 pos_059) (adjacent pos_061 pos_060) (adjacent pos_062 pos_061)
    (adjacent pos_063 pos_062) (adjacent pos_064 pos_063) (adjacent pos_065 pos_064)
  )

  (:goal
    (and
      (at box pos_050)
      (goal pos_050)
    )
  )

  (:metric minimize (total-cost)) ; If costs are used
)