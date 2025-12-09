(define (problem pddl_orchestrator-problem)
  (:domain pddl_orchestrator)
  (:objects
    d1 d2 d3 d4 d5 - disk
    peg1 peg2 peg3 - peg
    b1 b2 b3 - base
  )
  (:init
    ;; peg-to-base mapping
    (base-of peg1 b1)
    (base-of peg2 b2)
    (base-of peg3 b3)

    ;; initial stack on peg1 (b1) largest at bottom -> smallest on top:
    ;; b1 <- d5 <- d4 <- d3 <- d2 <- d1 (d1 is topmost)
    (on d5 b1)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    ;; top relations initially
    ;; for base b1 the object directly above it is d5 (the bottom disk)
    (top b1 d5)
    (top d5 d4)
    (top d4 d3)
    (top d3 d2)
    (top d2 d1)
    (top d1 d1)

    ;; empty pegs b2 and b3: top maps to itself
    (top b2 b2)
    (top b3 b3)

    ;; explicit strict ordering "smaller" for disks (d1 smallest ... d5 largest).
    ;; Provide all strictly smaller pairs (i < j => smaller di dj)
    (smaller d1 d2)
    (smaller d1 d3)
    (smaller d1 d4)
    (smaller d1 d5)
    (smaller d2 d3)
    (smaller d2 d4)
    (smaller d2 d5)
    (smaller d3 d4)
    (smaller d3 d5)
    (smaller d4 d5)

    ;; any disk is smaller than any base (so any disk can be placed on an empty peg base)
    (smaller d1 b1) (smaller d1 b2) (smaller d1 b3)
    (smaller d2 b1) (smaller d2 b2) (smaller d2 b3)
    (smaller d3 b1) (smaller d3 b2) (smaller d3 b3)
    (smaller d4 b1) (smaller d4 b2) (smaller d4 b3)
    (smaller d5 b1) (smaller d5 b2) (smaller d5 b3)
  )

  ;; Goal: complete stack moved to peg3 (b3) with identical ordering d5 bottom ... d1 top,
  ;; and top mappings set accordingly; peg1 and peg2 bases must be empty (top maps to themselves).
  (:goal (and
    (on d5 b3)
    (on d4 d5)
    (on d3 d4)
    (on d2 d3)
    (on d1 d2)

    (top b3 d5)
    (top d5 d4)
    (top d4 d3)
    (top d3 d2)
    (top d2 d1)
    (top d1 d1)

    ;; other pegs empty
    (top b1 b1)
    (top b2 b2)
  ))
)