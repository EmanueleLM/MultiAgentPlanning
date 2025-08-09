(define (problem vault-problem)
  (:domain vault)
  (:objects
    AgentA AgentB   - agent
    ex             - ex
    vault          - vault
    k              - key
    obj            - obj)
  (:init
    (big   AgentA)
    (small AgentB)
    (at AgentA ex)
    (at AgentB ex)
    (has-thing AgentA k)
    (closed vault)
    (contains vault obj)
    (can-enter AgentB vault))
  (:goal (and
           (open vault)
           (has-thing AgentB obj))) )