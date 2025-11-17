(define (problem tripplanningexample19-prob)
  (:domain tripplanningexample19)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    brussels valencia nice - city
  )
  (:init
    (first d1)
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    ; self edges to allow staying in the same city
    (direct brussels brussels)
    (direct valencia valencia)
    (direct nice nice)

    ; bidirectional direct flights per the graph
    (direct brussels valencia)
    (direct valencia brussels)
    (direct brussels nice)
    (direct nice brussels)
  )
  (:goal (and
    (at d1 nice)
    (at d2 nice)
    (at d3 nice)
    (at d4 nice)
    (at d5 brussels)
    (at d6 brussels)
    (at d7 valencia)
    (at d8 valencia)
    (at d9 valencia)
  ))
)