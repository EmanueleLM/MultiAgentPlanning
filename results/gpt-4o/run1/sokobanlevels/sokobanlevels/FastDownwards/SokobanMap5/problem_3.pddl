(define (problem sokoban-instance)
  (:domain sokoban)
  (:objects
    loc-1 loc-2 loc-3 loc-4 loc-5 loc-6 loc-7 loc-8 loc-9 loc-10
    loc-11 loc-12 loc-13 loc-14 loc-15 loc-16 loc-17 loc-18 loc-19 loc-20
    loc-21 loc-22 loc-23 loc-24 loc-25 loc-26 loc-27 loc-28 loc-29 loc-30
    loc-31 loc-32 loc-33 loc-34 loc-35 loc-36 loc-37 loc-38 loc-39 loc-40
    loc-41 loc-42 loc-43 loc-44 loc-45 loc-46 loc-47 loc-48 loc-49 loc-50
    loc-51 loc-52 loc-53 loc-54 loc-55 loc-56 loc-57 loc-58 loc-59 loc-60
    loc-61 loc-62 loc-63 loc-64 loc-65 loc-66 loc-67 loc-68 loc-69 loc-70
    loc-71 loc-72 loc-73 loc-74 loc-75 loc-76 loc-77 loc-78 loc-79 loc-80
    loc-81 loc-82 loc-83 loc-84 loc-85 loc-86 loc-87 loc-88 loc-89 loc-90
    loc-91 loc-92 loc-93 loc-94 loc-95 loc-96 loc-97 loc-98 loc-99 loc-100
    loc-101 loc-102 loc-103 loc-104 loc-105 - location
  )
  (:init
    (at-player loc-2)
    (at-box loc-80)
    (goal loc-104)
    (clear loc-104)
    ;; Adjacency and clearing for passage (lines indicate connection in map)
    (adjacent loc-2 loc-3) (adjacent loc-3 loc-2)
    (adjacent loc-3 loc-4) (adjacent loc-4 loc-3)
    ;; and so on for the entire passageway
    ;; reconstruct the way such adjacency for continuous locations excludes walls
    ;; Add clear predicates wherever necessary ensuring all movement and box transfers are legitimate
    (clear loc-2) (clear loc-4) (clear loc-5)
    ;; Add more clear locations and correct adjacencies
  )

  (:goal
    (and
      (at-box loc-104)
    )
  )
)