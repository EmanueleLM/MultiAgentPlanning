(define (problem hanoi10_problem)
  (:domain hanoi_agents)
  (:objects
    d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 - disk
    peg1 peg2 peg3 - peg
    ;; pegs and disks are places; the domain types define disk and peg as place subtypes
    agent_1 agent_2 - agent
  )

  (:init
    ;; Initial stack on peg1: d10 (bottom) ... d2 below d1, d1 top
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 d8)
    (on d8 d9)
    (on d9 d10)
    (on d10 peg1)

    ;; Clear places: top disk d1 is clear, pegs 2 and 3 are clear
    (clear d1)
    (clear peg2)
    (clear peg3)

    ;; Define size ordering: smaller di dj for i<j
    (smaller d1 d2) (smaller d1 d3) (smaller d1 d4) (smaller d1 d5) (smaller d1 d6) (smaller d1 d7) (smaller d1 d8) (smaller d1 d9) (smaller d1 d10)
    (smaller d2 d3) (smaller d2 d4) (smaller d2 d5) (smaller d2 d6) (smaller d2 d7) (smaller d2 d8) (smaller d2 d9) (smaller d2 d10)
    (smaller d3 d4) (smaller d3 d5) (smaller d3 d6) (smaller d3 d7) (smaller d3 d8) (smaller d3 d9) (smaller d3 d10)
    (smaller d4 d5) (smaller d4 d6) (smaller d4 d7) (smaller d4 d8) (smaller d4 d9) (smaller d4 d10)
    (smaller d5 d6) (smaller d5 d7) (smaller d5 d8) (smaller d5 d9) (smaller d5 d10)
    (smaller d6 d7) (smaller d6 d8) (smaller d6 d9) (smaller d6 d10)
    (smaller d7 d8) (smaller d7 d9) (smaller d7 d10)
    (smaller d8 d9) (smaller d8 d10)
    (smaller d9 d10)

    ;; Agent move permissions.
    ;; No external restrictions were provided on which disks each agent may move,
    ;; so both agents are permitted to move any disk (encoded explicitly).
    (can-move agent_1 d1) (can-move agent_1 d2) (can-move agent_1 d3) (can-move agent_1 d4) (can-move agent_1 d5)
    (can-move agent_1 d6) (can-move agent_1 d7) (can-move agent_1 d8) (can-move agent_1 d9) (can-move agent_1 d10)

    (can-move agent_2 d1) (can-move agent_2 d2) (can-move agent_2 d3) (can-move agent_2 d4) (can-move agent_2 d5)
    (can-move agent_2 d6) (can-move agent_2 d7) (can-move agent_2 d8) (can-move agent_2 d9) (can-move agent_2 d10)
  )

  (:goal (and
    ;; Goal: all disks stacked on peg3 in the same size order (d10 bottom ... d1 top)
    (on d1 d2)
    (on d2 d3)
    (on d3 d4)
    (on d4 d5)
    (on d5 d6)
    (on d6 d7)
    (on d7 d8)
    (on d8 d9)
    (on d9 d10)
    (on d10 peg3)
  ))
)