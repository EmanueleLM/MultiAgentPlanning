(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    paltry sip clip wretched memory tightfisted - act
    p1 p2 p3 p4 p5 p6 p7 - phase
  )

  (:init
    ;; Phase ordering: enforce strict linear sequence p1 -> p2 -> p3 -> p4 -> p5 -> p6 -> p7
    (next p1 p2)
    (next p2 p3)
    (next p3 p4)
    (next p4 p5)
    (next p5 p6)
    (next p6 p7)

    ;; Start at the first phase
    (current p1)

    ;; Assign each named action to its designated phase (one action per phase)
    (assigned paltry p1)
    (assigned sip p2)
    (assigned clip p3)
    (assigned wretched p4)
    (assigned memory p5)
    (assigned tightfisted p6)

    ;; No actions are done initially (omitted because default is false)
  )

  ;; Goals: every named action must be completed and the system must have advanced to the terminal phase p7.
  ;; The successor relation is also required to match the declared sequence explicitly (included here to
  ;; reflect the "declared goal next predicate" constraint).
  (:goal
    (and
      (done paltry)
      (done sip)
      (done clip)
      (done wretched)
      (done memory)
      (done tightfisted)
      (current p7)
      (next p1 p2)
      (next p2 p3)
      (next p3 p4)
      (next p4 p5)
      (next p5 p6)
      (next p6 p7)
    )
  )
)