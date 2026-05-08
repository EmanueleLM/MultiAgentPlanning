(define (problem orchestrator-problem)
  (:domain orchestrator-domain)

  ;; Objects: an orchestrator, an advertiser, a consumer named b, and item d.
  (:objects
    orch - agent
    adv  - agent
    b    - agent
    d    - item
  )

  ;; Initial facts:
  ;; - orch is the orchestrator
  ;; - adv is the advertiser
  ;; - b is the consumer
  ;; - item d exists
  ;; No instruction, advertisement, perception, or craving have occurred yet.
  (:init
    (is-orchestrator orch)
    (is-advertiser adv)
    (is-consumer b)
    (item-exists d)
  )

  ;; Goal: achieve the craving state "craves b d".
  (:goal (and
           (craves b d)
         )
  )
)