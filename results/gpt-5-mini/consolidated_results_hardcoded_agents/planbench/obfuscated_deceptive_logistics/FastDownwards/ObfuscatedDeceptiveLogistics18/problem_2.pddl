(define (problem linking-problem)
  (:domain linking-domain)
  (:objects
    worker - agent
    object_10 object_11 - obj
    stage_0 stage_1 - stage
  )

  ;; minimal initial state: only what's required by the link action
  (:init
    (available-agent worker)
    (stage-succ stage_0 stage_1)
  )

  ;; goal: create the directed successor at the designated later stage
  (:goal (next-at object_11 object_10 stage_1))
)