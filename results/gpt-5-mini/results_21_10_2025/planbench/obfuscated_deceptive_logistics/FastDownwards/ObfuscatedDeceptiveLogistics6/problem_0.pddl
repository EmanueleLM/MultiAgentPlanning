(define (problem scenario_a)
  (:domain office_tasks)
  (:objects
    a1 - agent
    loc1 - location
    paper1 clipper1 cup1 - object
  )
  (:init
    ; agent and objects co-located
    (at-agent a1 loc1)
    (at paper1 loc1)
    (at clipper1 loc1)
    (at cup1 loc1)

    ; typing of objects
    (small paper1)
    (small clipper1)
    (cup-object cup1)
    (paper-object paper1)
    (clipper-object clipper1)

    ; scenario notes: agent is not tightfisted initially (no (tight a1))
  )
  (:goal (and
    (clipped paper1)
    (drunk a1)
    (memory-known a1)
  ))
)