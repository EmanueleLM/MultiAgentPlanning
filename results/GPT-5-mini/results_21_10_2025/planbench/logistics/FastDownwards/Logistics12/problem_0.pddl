(define (problem orchestrated-multiagent-prob)
  (:domain orchestrated-multiagent)

  (:objects
    actor1 observer1 - agent
    kitchen office - loc
    item1 - item
    cliptool1 - tool
    coin1 - coin
    cup1 - cup
    event1 - event
  )

  (:init
    ; locations
    (at actor1 kitchen)
    (at observer1 office)
    (at-cup cup1 kitchen)

    ; possessions (assumed from reconciled inputs)
    (has-coin actor1 coin1)
    (has-tool actor1 cliptool1)

    ; agent states
    (thirsty actor1) ; sip is available but not required for goals

    ; nothing is clipped yet and no events have happened or been remembered initially
  )

  (:goal (and
    (remembers observer1 event1)
    (tightfisted actor1)
    (clipped item1)
  ))
)