(define (problem tripplanningexample23)
  (:domain trip-planning)
  (:objects
    london bucharest riga - city
    d1 d2 d3 d4 d5 d6 d7 d8 - day
  )
  (:init
    ; day succession
    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)

    ; start state: day 1 in London
    (current d1)
    (loc london)
    (at london d1)
    (filled d1)
    (visited london)

    ; direct-flight adjacency (undirected)
    (adj london bucharest)
    (adj bucharest london)
    (adj bucharest riga)
    (adj riga bucharest)

    ; allowed city per day (enforces contiguous blocks and workshop in Riga on days 5..8)
    (ok d1 london)
    (ok d2 london)
    (ok d3 bucharest)
    (ok d4 bucharest)
    (ok d5 riga)
    (ok d6 riga)
    (ok d7 riga)
    (ok d8 riga)
  )
  (:goal (and
    (current d8)
    (visited london)
    (visited bucharest)
    (visited riga)
  ))
)