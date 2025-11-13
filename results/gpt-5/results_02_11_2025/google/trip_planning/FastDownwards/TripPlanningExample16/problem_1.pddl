(define (problem trip9days-problem)
  (:domain trip9days)

  (:objects
    Prague Vienna Porto - city
    d1 d2 d3 d4 d5 d6 d7 d8 d9 - day
    prs1 prs2 prs3 - prslot
    vis1 vis2 vis3 - vislot
  )

  (:init
    (is-prague Prague)
    (is-vienna Vienna)
    (is-porto Porto)

    (edge Prague Vienna)
    (edge Vienna Prague)
    (edge Vienna Porto)
    (edge Porto Vienna)

    (next d1 d2)
    (next d2 d3)
    (next d3 d4)
    (next d4 d5)
    (next d5 d6)
    (next d6 d7)
    (next d7 d8)
    (next d8 d9)

    (current-day d1)
    (at Prague)
    (city-on d1 Prague)

    ; counting resources
    (used-prague-slot prs1)
    (free-prague-slot prs2)
    (free-prague-slot prs3)

    (free-vienna-slot vis1)
    (free-vienna-slot vis2)
    (free-vienna-slot vis3)

    (= (total-cost) 0)
  )

  (:goal (and
    ; workshop hard requirement: be in Prague on days 1-3
    (city-on d1 Prague)
    (city-on d2 Prague)
    (city-on d3 Prague)

    ; exactly 3 total days in Prague and Vienna
    (used-prague-slot prs1)
    (used-prague-slot prs2)
    (used-prague-slot prs3)
    (used-vienna-slot vis1)
    (used-vienna-slot vis2)
    (used-vienna-slot vis3)

    ; all 9 days advanced
    (current-day d9)
  ))

  (:metric minimize (total-cost))
)