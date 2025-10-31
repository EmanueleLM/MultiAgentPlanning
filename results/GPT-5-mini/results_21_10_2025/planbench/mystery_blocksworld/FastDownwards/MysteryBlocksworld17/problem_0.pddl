(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  (:objects
    alice - agent
    cup biscuit clipper token - item
  )

  (:init
    (at cup kitchen)
    (at biscuit kitchen)
    (at clipper kitchen)
    (at token kitchen)
    (at-agent alice kitchen)
    (holding alice token)
  )

  (:goal (and
    (cleaned cup)
    (remembers alice biscuit)
    (hoarded biscuit)
  ))
)