(define (problem orchestration-problem)
  (:domain orchestration)
  (:objects
    player - agent
    p1 p2 p3 p4 p5 p6 p7 - phase
    coin - thing
    cup1 - cup
    clipper1 - clipper
    item1 - item
    mem1 - memorytag
  )

  (:init
    ;; phase ordering and initial phase
    (succ p1 p2)
    (succ p2 p3)
    (succ p3 p4)
    (succ p4 p5)
    (succ p5 p6)
    (succ p6 p7)
    (at-phase p1)

    ;; observed canonical facts
    (holding player coin)
    (cup-full cup1)
    (clipper-available clipper1)

    ;; No actions are done initially (absence of done-* predicates)
    ;; Auditor-consistency: only the above initial facts and succ relations are trusted.

  )

  (:goal (and
    ;; All mandated terminal conditions: every action completed and final phase reached.
    (done-paltry)
    (done-sip)
    (done-clip)
    (done-wretched)
    (done-memory)
    (done-tightfisted)
    (tightfisted player)
    (memorized mem1)
    (clipped item1)
    (cup-empty cup1)
    (at-phase p7)
  ))
)